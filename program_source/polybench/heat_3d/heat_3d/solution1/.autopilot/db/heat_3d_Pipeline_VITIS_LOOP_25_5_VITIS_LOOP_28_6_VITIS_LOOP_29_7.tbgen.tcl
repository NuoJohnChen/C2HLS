set moduleName heat_3d_Pipeline_VITIS_LOOP_25_5_VITIS_LOOP_28_6_VITIS_LOOP_29_7
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
set C_modelName {heat_3d_Pipeline_VITIS_LOOP_25_5_VITIS_LOOP_28_6_VITIS_LOOP_29_7}
set C_modelType { void 0 }
set C_modelArgList {
	{ A int 64 regular {array 8000 { 0 3 } 0 1 }  }
	{ B int 64 regular {array 8000 { 1 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "A", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "B", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 35
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_address0 sc_out sc_lv 13 signal 0 } 
	{ A_ce0 sc_out sc_logic 1 signal 0 } 
	{ A_we0 sc_out sc_logic 1 signal 0 } 
	{ A_d0 sc_out sc_lv 64 signal 0 } 
	{ B_address0 sc_out sc_lv 13 signal 1 } 
	{ B_ce0 sc_out sc_logic 1 signal 1 } 
	{ B_q0 sc_in sc_lv 64 signal 1 } 
	{ B_address1 sc_out sc_lv 13 signal 1 } 
	{ B_ce1 sc_out sc_logic 1 signal 1 } 
	{ B_q1 sc_in sc_lv 64 signal 1 } 
	{ grp_fu_99_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_99_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_99_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_99_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_99_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_103_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_103_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_103_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_103_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_103_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_107_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_107_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_107_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_107_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_107_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_111_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_111_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_111_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_111_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "we0" }} , 
 	{ "name": "A_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "d0" }} , 
 	{ "name": "B_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B", "role": "address0" }} , 
 	{ "name": "B_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "ce0" }} , 
 	{ "name": "B_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "B", "role": "q0" }} , 
 	{ "name": "B_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "B", "role": "address1" }} , 
 	{ "name": "B_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "ce1" }} , 
 	{ "name": "B_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "B", "role": "q1" }} , 
 	{ "name": "grp_fu_99_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_99_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_99_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_99_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_99_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_99_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_99_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_99_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_99_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_99_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_103_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_103_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_103_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_103_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_103_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_103_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_103_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_103_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_103_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_103_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_107_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_107_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_107_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_107_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_107_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_107_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_107_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_107_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_107_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_107_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_111_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_111_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_111_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_111_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_111_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_111_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_111_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_111_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "heat_3d_Pipeline_VITIS_LOOP_25_5_VITIS_LOOP_28_6_VITIS_LOOP_29_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "23370", "EstimateLatencyMax" : "23370",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "B", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_25_5_VITIS_LOOP_28_6_VITIS_LOOP_29_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	heat_3d_Pipeline_VITIS_LOOP_25_5_VITIS_LOOP_28_6_VITIS_LOOP_29_7 {
		A {Type O LastRead -1 FirstWrite 44}
		B {Type I LastRead 12 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "23370", "Max" : "23370"}
	, {"Name" : "Interval", "Min" : "23370", "Max" : "23370"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	A { ap_memory {  { A_address0 mem_address 1 13 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 64 } } }
	B { ap_memory {  { B_address0 mem_address 1 13 }  { B_ce0 mem_ce 1 1 }  { B_q0 mem_dout 0 64 }  { B_address1 MemPortADDR2 1 13 }  { B_ce1 MemPortCE2 1 1 }  { B_q1 MemPortDOUT2 0 64 } } }
}
