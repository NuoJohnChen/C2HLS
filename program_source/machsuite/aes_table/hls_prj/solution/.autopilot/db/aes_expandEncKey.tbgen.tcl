set moduleName aes_expandEncKey
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {aes_expandEncKey}
set C_modelType { int 776 }
set C_modelArgList {
	{ p_read int 768 regular  }
	{ k_idx int 10 regular  }
	{ rc_read int 8 regular  }
	{ sbox int 8 regular {array 256 { 1 1 1 1 1 1 1 1 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 768, "direction" : "READONLY"} , 
 	{ "Name" : "k_idx", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "rc_read", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "sbox", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 776} ]}
# RTL Port declarations: 
set portNum 36
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
	{ p_read sc_in sc_lv 768 signal 0 } 
	{ k_idx sc_in sc_lv 10 signal 1 } 
	{ rc_read sc_in sc_lv 8 signal 2 } 
	{ sbox_address0 sc_out sc_lv 8 signal 3 } 
	{ sbox_ce0 sc_out sc_logic 1 signal 3 } 
	{ sbox_q0 sc_in sc_lv 8 signal 3 } 
	{ sbox_address1 sc_out sc_lv 8 signal 3 } 
	{ sbox_ce1 sc_out sc_logic 1 signal 3 } 
	{ sbox_q1 sc_in sc_lv 8 signal 3 } 
	{ sbox_address2 sc_out sc_lv 8 signal 3 } 
	{ sbox_ce2 sc_out sc_logic 1 signal 3 } 
	{ sbox_q2 sc_in sc_lv 8 signal 3 } 
	{ sbox_address3 sc_out sc_lv 8 signal 3 } 
	{ sbox_ce3 sc_out sc_logic 1 signal 3 } 
	{ sbox_q3 sc_in sc_lv 8 signal 3 } 
	{ sbox_address4 sc_out sc_lv 8 signal 3 } 
	{ sbox_ce4 sc_out sc_logic 1 signal 3 } 
	{ sbox_q4 sc_in sc_lv 8 signal 3 } 
	{ sbox_address5 sc_out sc_lv 8 signal 3 } 
	{ sbox_ce5 sc_out sc_logic 1 signal 3 } 
	{ sbox_q5 sc_in sc_lv 8 signal 3 } 
	{ sbox_address6 sc_out sc_lv 8 signal 3 } 
	{ sbox_ce6 sc_out sc_logic 1 signal 3 } 
	{ sbox_q6 sc_in sc_lv 8 signal 3 } 
	{ sbox_address7 sc_out sc_lv 8 signal 3 } 
	{ sbox_ce7 sc_out sc_logic 1 signal 3 } 
	{ sbox_q7 sc_in sc_lv 8 signal 3 } 
	{ ap_return_0 sc_out sc_lv 768 signal -1 } 
	{ ap_return_1 sc_out sc_lv 8 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "k_idx", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "k_idx", "role": "default" }} , 
 	{ "name": "rc_read", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rc_read", "role": "default" }} , 
 	{ "name": "sbox_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "address0" }} , 
 	{ "name": "sbox_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sbox", "role": "ce0" }} , 
 	{ "name": "sbox_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "q0" }} , 
 	{ "name": "sbox_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "address1" }} , 
 	{ "name": "sbox_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sbox", "role": "ce1" }} , 
 	{ "name": "sbox_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "q1" }} , 
 	{ "name": "sbox_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "address2" }} , 
 	{ "name": "sbox_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sbox", "role": "ce2" }} , 
 	{ "name": "sbox_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "q2" }} , 
 	{ "name": "sbox_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "address3" }} , 
 	{ "name": "sbox_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sbox", "role": "ce3" }} , 
 	{ "name": "sbox_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "q3" }} , 
 	{ "name": "sbox_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "address4" }} , 
 	{ "name": "sbox_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sbox", "role": "ce4" }} , 
 	{ "name": "sbox_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "q4" }} , 
 	{ "name": "sbox_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "address5" }} , 
 	{ "name": "sbox_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sbox", "role": "ce5" }} , 
 	{ "name": "sbox_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "q5" }} , 
 	{ "name": "sbox_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "address6" }} , 
 	{ "name": "sbox_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sbox", "role": "ce6" }} , 
 	{ "name": "sbox_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "q6" }} , 
 	{ "name": "sbox_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "address7" }} , 
 	{ "name": "sbox_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sbox", "role": "ce7" }} , 
 	{ "name": "sbox_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sbox", "role": "q7" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "aes_expandEncKey",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "27", "EstimateLatencyMin" : "27", "EstimateLatencyMax" : "27",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "rc_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "sbox", "Type" : "Memory", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	aes_expandEncKey {
		p_read {Type I LastRead 0 FirstWrite -1}
		k_idx {Type I LastRead 0 FirstWrite -1}
		rc_read {Type I LastRead 0 FirstWrite -1}
		sbox {Type I LastRead 20 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "27", "Max" : "27"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 768 } } }
	k_idx { ap_none {  { k_idx in_data 0 10 } } }
	rc_read { ap_none {  { rc_read in_data 0 8 } } }
	sbox { ap_memory {  { sbox_address0 mem_address 1 8 }  { sbox_ce0 mem_ce 1 1 }  { sbox_q0 in_data 0 8 }  { sbox_address1 MemPortADDR2 1 8 }  { sbox_ce1 MemPortCE2 1 1 }  { sbox_q1 in_data 0 8 }  { sbox_address2 MemPortADDR2 1 8 }  { sbox_ce2 MemPortCE2 1 1 }  { sbox_q2 in_data 0 8 }  { sbox_address3 MemPortADDR2 1 8 }  { sbox_ce3 MemPortCE2 1 1 }  { sbox_q3 in_data 0 8 }  { sbox_address4 MemPortADDR2 1 8 }  { sbox_ce4 MemPortCE2 1 1 }  { sbox_q4 in_data 0 8 }  { sbox_address5 MemPortADDR2 1 8 }  { sbox_ce5 MemPortCE2 1 1 }  { sbox_q5 in_data 0 8 }  { sbox_address6 MemPortADDR2 1 8 }  { sbox_ce6 MemPortCE2 1 1 }  { sbox_q6 in_data 0 8 }  { sbox_address7 MemPortADDR2 1 8 }  { sbox_ce7 MemPortCE2 1 1 }  { sbox_q7 in_data 0 8 } } }
}
