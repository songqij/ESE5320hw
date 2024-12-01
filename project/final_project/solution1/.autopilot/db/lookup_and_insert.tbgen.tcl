set moduleName lookup_and_insert
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {lookup_and_insert}
set C_modelType { int 65 }
set C_modelArgList {
	{ hash_table int 33 regular {array 32768 { 2 3 } 1 1 }  }
	{ assoc_mem_quarter_0 int 64 regular {array 32 { 2 3 } 1 1 }  }
	{ assoc_mem_quarter_1 int 64 regular {array 32 { 2 3 } 1 1 }  }
	{ assoc_mem_quarter_2 int 64 regular {array 32 { 2 3 } 1 1 }  }
	{ assoc_mem_quarter_3 int 64 regular {array 32 { 2 3 } 1 1 }  }
	{ assoc_mem_value int 12 regular {array 64 { 2 3 } 1 1 }  }
	{ assoc_mem_fill_read int 32 regular  }
	{ key int 20 regular  }
	{ nextCode int 12 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "hash_table", "interface" : "memory", "bitwidth" : 33, "direction" : "READWRITE"} , 
 	{ "Name" : "assoc_mem_quarter_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "assoc_mem_quarter_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "assoc_mem_quarter_2", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "assoc_mem_quarter_3", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "assoc_mem_value", "interface" : "memory", "bitwidth" : 12, "direction" : "READWRITE"} , 
 	{ "Name" : "assoc_mem_fill_read", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "key", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "nextCode", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 65} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ hash_table_address0 sc_out sc_lv 15 signal 0 } 
	{ hash_table_ce0 sc_out sc_logic 1 signal 0 } 
	{ hash_table_we0 sc_out sc_logic 1 signal 0 } 
	{ hash_table_d0 sc_out sc_lv 33 signal 0 } 
	{ hash_table_q0 sc_in sc_lv 33 signal 0 } 
	{ assoc_mem_quarter_0_address0 sc_out sc_lv 5 signal 1 } 
	{ assoc_mem_quarter_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ assoc_mem_quarter_0_we0 sc_out sc_logic 1 signal 1 } 
	{ assoc_mem_quarter_0_d0 sc_out sc_lv 64 signal 1 } 
	{ assoc_mem_quarter_0_q0 sc_in sc_lv 64 signal 1 } 
	{ assoc_mem_quarter_1_address0 sc_out sc_lv 5 signal 2 } 
	{ assoc_mem_quarter_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ assoc_mem_quarter_1_we0 sc_out sc_logic 1 signal 2 } 
	{ assoc_mem_quarter_1_d0 sc_out sc_lv 64 signal 2 } 
	{ assoc_mem_quarter_1_q0 sc_in sc_lv 64 signal 2 } 
	{ assoc_mem_quarter_2_address0 sc_out sc_lv 5 signal 3 } 
	{ assoc_mem_quarter_2_ce0 sc_out sc_logic 1 signal 3 } 
	{ assoc_mem_quarter_2_we0 sc_out sc_logic 1 signal 3 } 
	{ assoc_mem_quarter_2_d0 sc_out sc_lv 64 signal 3 } 
	{ assoc_mem_quarter_2_q0 sc_in sc_lv 64 signal 3 } 
	{ assoc_mem_quarter_3_address0 sc_out sc_lv 5 signal 4 } 
	{ assoc_mem_quarter_3_ce0 sc_out sc_logic 1 signal 4 } 
	{ assoc_mem_quarter_3_we0 sc_out sc_logic 1 signal 4 } 
	{ assoc_mem_quarter_3_d0 sc_out sc_lv 64 signal 4 } 
	{ assoc_mem_quarter_3_q0 sc_in sc_lv 64 signal 4 } 
	{ assoc_mem_value_address0 sc_out sc_lv 6 signal 5 } 
	{ assoc_mem_value_ce0 sc_out sc_logic 1 signal 5 } 
	{ assoc_mem_value_we0 sc_out sc_logic 1 signal 5 } 
	{ assoc_mem_value_d0 sc_out sc_lv 12 signal 5 } 
	{ assoc_mem_value_q0 sc_in sc_lv 12 signal 5 } 
	{ assoc_mem_fill_read sc_in sc_lv 32 signal 6 } 
	{ key sc_in sc_lv 20 signal 7 } 
	{ nextCode sc_in sc_lv 12 signal 8 } 
	{ ap_return_0 sc_out sc_lv 32 signal -1 } 
	{ ap_return_1 sc_out sc_lv 1 signal -1 } 
	{ ap_return_2 sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "hash_table_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "hash_table", "role": "address0" }} , 
 	{ "name": "hash_table_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hash_table", "role": "ce0" }} , 
 	{ "name": "hash_table_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hash_table", "role": "we0" }} , 
 	{ "name": "hash_table_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":33, "type": "signal", "bundle":{"name": "hash_table", "role": "d0" }} , 
 	{ "name": "hash_table_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":33, "type": "signal", "bundle":{"name": "hash_table", "role": "q0" }} , 
 	{ "name": "assoc_mem_quarter_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "assoc_mem_quarter_0", "role": "address0" }} , 
 	{ "name": "assoc_mem_quarter_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_quarter_0", "role": "ce0" }} , 
 	{ "name": "assoc_mem_quarter_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_quarter_0", "role": "we0" }} , 
 	{ "name": "assoc_mem_quarter_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "assoc_mem_quarter_0", "role": "d0" }} , 
 	{ "name": "assoc_mem_quarter_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "assoc_mem_quarter_0", "role": "q0" }} , 
 	{ "name": "assoc_mem_quarter_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "assoc_mem_quarter_1", "role": "address0" }} , 
 	{ "name": "assoc_mem_quarter_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_quarter_1", "role": "ce0" }} , 
 	{ "name": "assoc_mem_quarter_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_quarter_1", "role": "we0" }} , 
 	{ "name": "assoc_mem_quarter_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "assoc_mem_quarter_1", "role": "d0" }} , 
 	{ "name": "assoc_mem_quarter_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "assoc_mem_quarter_1", "role": "q0" }} , 
 	{ "name": "assoc_mem_quarter_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "assoc_mem_quarter_2", "role": "address0" }} , 
 	{ "name": "assoc_mem_quarter_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_quarter_2", "role": "ce0" }} , 
 	{ "name": "assoc_mem_quarter_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_quarter_2", "role": "we0" }} , 
 	{ "name": "assoc_mem_quarter_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "assoc_mem_quarter_2", "role": "d0" }} , 
 	{ "name": "assoc_mem_quarter_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "assoc_mem_quarter_2", "role": "q0" }} , 
 	{ "name": "assoc_mem_quarter_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "assoc_mem_quarter_3", "role": "address0" }} , 
 	{ "name": "assoc_mem_quarter_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_quarter_3", "role": "ce0" }} , 
 	{ "name": "assoc_mem_quarter_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_quarter_3", "role": "we0" }} , 
 	{ "name": "assoc_mem_quarter_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "assoc_mem_quarter_3", "role": "d0" }} , 
 	{ "name": "assoc_mem_quarter_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "assoc_mem_quarter_3", "role": "q0" }} , 
 	{ "name": "assoc_mem_value_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "assoc_mem_value", "role": "address0" }} , 
 	{ "name": "assoc_mem_value_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_value", "role": "ce0" }} , 
 	{ "name": "assoc_mem_value_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "assoc_mem_value", "role": "we0" }} , 
 	{ "name": "assoc_mem_value_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "assoc_mem_value", "role": "d0" }} , 
 	{ "name": "assoc_mem_value_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "assoc_mem_value", "role": "q0" }} , 
 	{ "name": "assoc_mem_fill_read", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "assoc_mem_fill_read", "role": "default" }} , 
 	{ "name": "key", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "key", "role": "default" }} , 
 	{ "name": "nextCode", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "nextCode", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "lookup_and_insert",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "hash_table", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "assoc_mem_quarter_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "assoc_mem_quarter_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "assoc_mem_quarter_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "assoc_mem_quarter_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "assoc_mem_value", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "assoc_mem_fill_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "key", "Type" : "None", "Direction" : "I"},
			{"Name" : "nextCode", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	lookup_and_insert {
		hash_table {Type IO LastRead 8 FirstWrite 9}
		assoc_mem_quarter_0 {Type IO LastRead 3 FirstWrite 9}
		assoc_mem_quarter_1 {Type IO LastRead 3 FirstWrite 9}
		assoc_mem_quarter_2 {Type IO LastRead 3 FirstWrite 9}
		assoc_mem_quarter_3 {Type IO LastRead 3 FirstWrite 9}
		assoc_mem_value {Type IO LastRead 7 FirstWrite 9}
		assoc_mem_fill_read {Type I LastRead 0 FirstWrite -1}
		key {Type I LastRead 0 FirstWrite -1}
		nextCode {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	hash_table { ap_memory {  { hash_table_address0 mem_address 1 15 }  { hash_table_ce0 mem_ce 1 1 }  { hash_table_we0 mem_we 1 1 }  { hash_table_d0 mem_din 1 33 }  { hash_table_q0 mem_dout 0 33 } } }
	assoc_mem_quarter_0 { ap_memory {  { assoc_mem_quarter_0_address0 mem_address 1 5 }  { assoc_mem_quarter_0_ce0 mem_ce 1 1 }  { assoc_mem_quarter_0_we0 mem_we 1 1 }  { assoc_mem_quarter_0_d0 mem_din 1 64 }  { assoc_mem_quarter_0_q0 mem_dout 0 64 } } }
	assoc_mem_quarter_1 { ap_memory {  { assoc_mem_quarter_1_address0 mem_address 1 5 }  { assoc_mem_quarter_1_ce0 mem_ce 1 1 }  { assoc_mem_quarter_1_we0 mem_we 1 1 }  { assoc_mem_quarter_1_d0 mem_din 1 64 }  { assoc_mem_quarter_1_q0 mem_dout 0 64 } } }
	assoc_mem_quarter_2 { ap_memory {  { assoc_mem_quarter_2_address0 mem_address 1 5 }  { assoc_mem_quarter_2_ce0 mem_ce 1 1 }  { assoc_mem_quarter_2_we0 mem_we 1 1 }  { assoc_mem_quarter_2_d0 mem_din 1 64 }  { assoc_mem_quarter_2_q0 mem_dout 0 64 } } }
	assoc_mem_quarter_3 { ap_memory {  { assoc_mem_quarter_3_address0 mem_address 1 5 }  { assoc_mem_quarter_3_ce0 mem_ce 1 1 }  { assoc_mem_quarter_3_we0 mem_we 1 1 }  { assoc_mem_quarter_3_d0 mem_din 1 64 }  { assoc_mem_quarter_3_q0 mem_dout 0 64 } } }
	assoc_mem_value { ap_memory {  { assoc_mem_value_address0 mem_address 1 6 }  { assoc_mem_value_ce0 mem_ce 1 1 }  { assoc_mem_value_we0 mem_we 1 1 }  { assoc_mem_value_d0 mem_din 1 12 }  { assoc_mem_value_q0 mem_dout 0 12 } } }
	assoc_mem_fill_read { ap_none {  { assoc_mem_fill_read in_data 0 32 } } }
	key { ap_none {  { key in_data 0 20 } } }
	nextCode { ap_none {  { nextCode in_data 0 12 } } }
}
