import os
import re

import math
import random
import subprocess
import requests
import glob
from typing import List, Iterable
from typing import Dict, List
import shutil
from typing import List, Tuple, Union
from lib_function import * 
import json

function_error_count = 0

def test(top_function, test_path):
    global global_list
    accel = 1
    function_pass = False
    syn_pass = False
    resource = [0,0,0,0]
    # true_path = f"/home/zqy/LLM4CHIP/dataset/pair_slow_fast/test_cases_3B/{top_function}/{top_function}_slow.cpp"
    # if os.path.exists(true_path):
    #     global_list = grasp_latency(true_path)
    # Generate the TCL script
    command = ["cp","-r", f"{test_path}/{top_function}/{top_function}_fast.cpp", f"/home/zqy/LLM4CHIP/dataset/pair_slow_fast/test_cases_3B/{top_function}"]
    subprocess.run(command)
    tcl_template = f"""open_project {top_function}
add_files /home/zqy/LLM4CHIP/dataset/pair_slow_fast/test_cases_3B/{top_function}/{top_function}_fast.cpp
set_top {top_function}
open_solution solution1
create_clock -period 5 -name default
set_part {{xcu55c-fsvh2892-2L-e}}
csynth_design
exit
"""

    output_file = f"/home/zqy/LLM4CHIP/dataset/pair_slow_fast/test_cases_3B/{top_function}/run_hls.tcl"
    
    # Save the script to a file
    with open(output_file, "w") as file:
        file.write(tcl_template)
    print(f"TCL script generated and saved to {output_file}")

    # Run the generated TCL script using Vitis HLS
    log_file = f"{top_function}.log"
    command = ["vitis_hls", "-f", output_file]


    # Repair syn error
    output_path = f"/home/zqy/LLM4CHIP/dataset/pair_slow_fast/test_cases_3B/{top_function}/"
    function_errors = compile_and_check(top_function,output_path)
    if not function_errors:
        try:
            with open(log_file, "w") as log:
                subprocess.run(command, stdout=log, stderr=log, timeout=900, cwd=f"/home/zqy/LLM4CHIP/dataset/pair_slow_fast/test_cases_3B/{top_function}")  # 900秒 = 15分钟
            print(f"Vitis HLS run completed. Logs are saved to {log_file}")
            error_pattern = re.compile(r"ERROR: .*")
            with open(log_file, "r") as log:
                errors = error_pattern.findall(log.read())
            function_pass = True
        except subprocess.TimeoutExpired:
            print("Vitis HLS execution timed out after 10 minutes. Process terminated.")
            error_timeout = "Vitis HLS execution timed out, please reduce the parameter of unroll factor and local buffer size, simplify the code."
            errors = error_timeout
            syn_pass = False
    else:
        errors = str(function_errors)

    if not errors:
        # Parse the log file to know performance
        syn_pass = True
        previous_log = f"/home/zqy/LLM4CHIP/dataset/pair_slow_fast/test_cases_3B/{top_function}/csynth.rpt"
        curr_log = f"/home/zqy/LLM4CHIP/dataset/pair_slow_fast/test_cases_3B/{top_function}/{top_function}/solution1/syn/report/csynth.rpt"

        if os.path.exists(previous_log) and os.path.exists(curr_log):
            result_previous = parse_hls_report_with_checks(previous_log)
            result_current = parse_hls_report_with_checks(curr_log)
            resource = result_current['resource']
            print("result_previous: ", result_previous['resource'])
            print("result_previous: ", result_previous["total_latency_cycles"])
            print("result_current: ", result_current["total_latency_cycles"])
            print("resource_constraint_met: ", result_current["resource_constraint_met"])
            if result_current["total_latency_cycles"] != '-' and result_previous["total_latency_cycles"] != '-' and result_current["resource_constraint_met"] == True:
                accel = int(result_previous["total_latency_cycles"])/int(result_current["total_latency_cycles"])

            else:
                accel = 1
    else:
        accel = 1

    #print(f"{test_path} {top_function} function_pass: {function_pass}, syn_pass: {syn_pass}, accel: {accel}")
    return function_pass, syn_pass, accel, resource

def test_all(test_path):
    results = {}
    total_funcs = passed_funcs = passed_syn = 0
    accel_sum = 0.0
    max_accel = 1.0
    min_accel = 1.0
    max_proj = None
    min_proj = None

    for name in os.listdir(test_path):
        subdir = os.path.join(test_path, name)
        if not os.path.isdir(subdir):
            continue

        total_funcs += 1
        print(f"=== Testing {name} ===")
        try:
            function_pass, syn_pass, accel, resource = test(name, test_path)
        except Exception as e:
            print(f"[Error] {name}: {e}")
            function_pass, syn_pass, accel, resource = False, False, 1.0, (0,0,0,0)

        # accumulate
        if function_pass: passed_funcs += 1
        if syn_pass:      passed_syn   += 1
        accel_sum += accel

        # track maximum
        if accel > max_accel:
            max_accel = accel
            max_proj  = name
        if accel < min_accel:
            min_accel = accel
            min_proj  = name

        results[name] = {
            "function_pass": function_pass,
            "syn_pass":      syn_pass,
            "acceleration":  accel,
            "resource":      {
                "DSPs": resource[0],
                "BRAMs": resource[1],
                "FFs": resource[2],
                "LUTs": resource[3],
            }
        }

    # compute rates & average
    func_pass_rate = passed_funcs / total_funcs * 100 if total_funcs else 0.0
    syn_pass_rate  = passed_syn  / total_funcs * 100 if total_funcs else 0.0
    avg_accel      = accel_sum    / total_funcs if total_funcs else 1.0

    summary = {
        "total_projects":   total_funcs,
        "function_pass_rate_pct": func_pass_rate,
        "synthesis_pass_rate_pct": syn_pass_rate,
        "average_acceleration": avg_accel,
        "max_acceleration_project": max_proj,
        "max_acceleration_value": max_accel,
        "min_acceleration_project": min_proj,
        "min_acceleration_value": min_accel
    }

    # prepare full output
    output = {
        "summary": summary,
        "per_project": results
    }

    # write JSON named after last folder of test_path
    folder_name = os.path.basename(os.path.abspath(test_path))
    json_path = os.path.join(test_path, f"{folder_name}.json")
    with open(json_path, "w", encoding="utf-8") as jf:
        json.dump(output, jf, indent=2, ensure_ascii=False)

    print(f"\nResults written to {json_path}")
    return output

if __name__ == "__main__":
    TEST_PATH = "/home/zqy/LLM4CHIP/dataset/generate_pre3B_cot_best1"
    test_all(TEST_PATH)    

