set moduleName mvt_Pipeline_lpwr
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
set C_modelName {mvt_Pipeline_lpwr}
set C_modelType { void 0 }
set C_modelArgList {
	{ buff_x1 float 32 regular {array 64 { 1 3 } 1 1 }  }
	{ x1_out int 32 regular {array 64 { 0 3 } 0 1 }  }
	{ buff_x2 float 32 regular {array 64 { 1 3 } 1 1 }  }
	{ x2_out int 32 regular {array 64 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "buff_x1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x1_out", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buff_x2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x2_out", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ buff_x1_address0 sc_out sc_lv 6 signal 0 } 
	{ buff_x1_ce0 sc_out sc_logic 1 signal 0 } 
	{ buff_x1_q0 sc_in sc_lv 32 signal 0 } 
	{ x1_out_address0 sc_out sc_lv 6 signal 1 } 
	{ x1_out_ce0 sc_out sc_logic 1 signal 1 } 
	{ x1_out_we0 sc_out sc_logic 1 signal 1 } 
	{ x1_out_d0 sc_out sc_lv 32 signal 1 } 
	{ buff_x2_address0 sc_out sc_lv 6 signal 2 } 
	{ buff_x2_ce0 sc_out sc_logic 1 signal 2 } 
	{ buff_x2_q0 sc_in sc_lv 32 signal 2 } 
	{ x2_out_address0 sc_out sc_lv 6 signal 3 } 
	{ x2_out_ce0 sc_out sc_logic 1 signal 3 } 
	{ x2_out_we0 sc_out sc_logic 1 signal 3 } 
	{ x2_out_d0 sc_out sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "buff_x1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "buff_x1", "role": "address0" }} , 
 	{ "name": "buff_x1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buff_x1", "role": "ce0" }} , 
 	{ "name": "buff_x1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buff_x1", "role": "q0" }} , 
 	{ "name": "x1_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "x1_out", "role": "address0" }} , 
 	{ "name": "x1_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x1_out", "role": "ce0" }} , 
 	{ "name": "x1_out_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x1_out", "role": "we0" }} , 
 	{ "name": "x1_out_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x1_out", "role": "d0" }} , 
 	{ "name": "buff_x2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "buff_x2", "role": "address0" }} , 
 	{ "name": "buff_x2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buff_x2", "role": "ce0" }} , 
 	{ "name": "buff_x2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "buff_x2", "role": "q0" }} , 
 	{ "name": "x2_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "x2_out", "role": "address0" }} , 
 	{ "name": "x2_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x2_out", "role": "ce0" }} , 
 	{ "name": "x2_out_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x2_out", "role": "we0" }} , 
 	{ "name": "x2_out_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x2_out", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "mvt_Pipeline_lpwr",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buff_x1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x1_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "buff_x2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x2_out", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "lpwr", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mvt_Pipeline_lpwr {
		buff_x1 {Type I LastRead 0 FirstWrite -1}
		x1_out {Type O LastRead -1 FirstWrite 1}
		buff_x2 {Type I LastRead 0 FirstWrite -1}
		x2_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "66", "Max" : "66"}
	, {"Name" : "Interval", "Min" : "66", "Max" : "66"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	buff_x1 { ap_memory {  { buff_x1_address0 mem_address 1 6 }  { buff_x1_ce0 mem_ce 1 1 }  { buff_x1_q0 in_data 0 32 } } }
	x1_out { ap_memory {  { x1_out_address0 mem_address 1 6 }  { x1_out_ce0 mem_ce 1 1 }  { x1_out_we0 mem_we 1 1 }  { x1_out_d0 mem_din 1 32 } } }
	buff_x2 { ap_memory {  { buff_x2_address0 mem_address 1 6 }  { buff_x2_ce0 mem_ce 1 1 }  { buff_x2_q0 in_data 0 32 } } }
	x2_out { ap_memory {  { x2_out_address0 mem_address 1 6 }  { x2_out_ce0 mem_ce 1 1 }  { x2_out_we0 mem_we 1 1 }  { x2_out_d0 mem_din 1 32 } } }
}
