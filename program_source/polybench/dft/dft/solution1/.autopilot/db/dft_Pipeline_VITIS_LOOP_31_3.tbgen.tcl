set moduleName dft_Pipeline_VITIS_LOOP_31_3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {dft_Pipeline_VITIS_LOOP_31_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ temp_real double 64 regular {array 256 { 1 3 } 1 1 }  }
	{ sample_real int 64 regular {array 256 { 0 3 } 0 1 }  }
	{ temp_imag double 64 regular {array 256 { 1 3 } 1 1 }  }
	{ sample_imag int 64 regular {array 256 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "temp_real", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "sample_real", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "temp_imag", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "sample_imag", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ temp_real_address0 sc_out sc_lv 8 signal 0 } 
	{ temp_real_ce0 sc_out sc_logic 1 signal 0 } 
	{ temp_real_q0 sc_in sc_lv 64 signal 0 } 
	{ sample_real_address0 sc_out sc_lv 8 signal 1 } 
	{ sample_real_ce0 sc_out sc_logic 1 signal 1 } 
	{ sample_real_we0 sc_out sc_logic 1 signal 1 } 
	{ sample_real_d0 sc_out sc_lv 64 signal 1 } 
	{ temp_imag_address0 sc_out sc_lv 8 signal 2 } 
	{ temp_imag_ce0 sc_out sc_logic 1 signal 2 } 
	{ temp_imag_q0 sc_in sc_lv 64 signal 2 } 
	{ sample_imag_address0 sc_out sc_lv 8 signal 3 } 
	{ sample_imag_ce0 sc_out sc_logic 1 signal 3 } 
	{ sample_imag_we0 sc_out sc_logic 1 signal 3 } 
	{ sample_imag_d0 sc_out sc_lv 64 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "temp_real_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_real", "role": "address0" }} , 
 	{ "name": "temp_real_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_real", "role": "ce0" }} , 
 	{ "name": "temp_real_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_real", "role": "q0" }} , 
 	{ "name": "sample_real_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sample_real", "role": "address0" }} , 
 	{ "name": "sample_real_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sample_real", "role": "ce0" }} , 
 	{ "name": "sample_real_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sample_real", "role": "we0" }} , 
 	{ "name": "sample_real_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sample_real", "role": "d0" }} , 
 	{ "name": "temp_imag_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "temp_imag", "role": "address0" }} , 
 	{ "name": "temp_imag_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "temp_imag", "role": "ce0" }} , 
 	{ "name": "temp_imag_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "temp_imag", "role": "q0" }} , 
 	{ "name": "sample_imag_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sample_imag", "role": "address0" }} , 
 	{ "name": "sample_imag_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sample_imag", "role": "ce0" }} , 
 	{ "name": "sample_imag_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sample_imag", "role": "we0" }} , 
 	{ "name": "sample_imag_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sample_imag", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "dft_Pipeline_VITIS_LOOP_31_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "temp_real", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sample_real", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "temp_imag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sample_imag", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_31_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	dft_Pipeline_VITIS_LOOP_31_3 {
		temp_real {Type I LastRead 0 FirstWrite -1}
		sample_real {Type O LastRead -1 FirstWrite 1}
		temp_imag {Type I LastRead 0 FirstWrite -1}
		sample_imag {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "258", "Max" : "258"}
	, {"Name" : "Interval", "Min" : "258", "Max" : "258"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	temp_real { ap_memory {  { temp_real_address0 mem_address 1 8 }  { temp_real_ce0 mem_ce 1 1 }  { temp_real_q0 in_data 0 64 } } }
	sample_real { ap_memory {  { sample_real_address0 mem_address 1 8 }  { sample_real_ce0 mem_ce 1 1 }  { sample_real_we0 mem_we 1 1 }  { sample_real_d0 mem_din 1 64 } } }
	temp_imag { ap_memory {  { temp_imag_address0 mem_address 1 8 }  { temp_imag_ce0 mem_ce 1 1 }  { temp_imag_q0 in_data 0 64 } } }
	sample_imag { ap_memory {  { sample_imag_address0 mem_address 1 8 }  { sample_imag_ce0 mem_ce 1 1 }  { sample_imag_we0 mem_we 1 1 }  { sample_imag_d0 mem_din 1 64 } } }
}
