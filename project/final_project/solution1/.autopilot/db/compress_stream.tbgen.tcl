set moduleName compress_stream
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
set C_modelName {compress_stream}
set C_modelType { void 0 }
set C_modelArgList {
	{ chunk_arr_stream int 8 regular {fifo 0 volatile }  }
	{ codeword_stream int 16 regular {fifo 1 volatile }  }
	{ gmem_load_loc int 32 regular {fifo 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "chunk_arr_stream", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "codeword_stream", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gmem_load_loc", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ chunk_arr_stream_dout sc_in sc_lv 8 signal 0 } 
	{ chunk_arr_stream_empty_n sc_in sc_logic 1 signal 0 } 
	{ chunk_arr_stream_read sc_out sc_logic 1 signal 0 } 
	{ codeword_stream_din sc_out sc_lv 16 signal 1 } 
	{ codeword_stream_full_n sc_in sc_logic 1 signal 1 } 
	{ codeword_stream_write sc_out sc_logic 1 signal 1 } 
	{ gmem_load_loc_dout sc_in sc_lv 32 signal 2 } 
	{ gmem_load_loc_empty_n sc_in sc_logic 1 signal 2 } 
	{ gmem_load_loc_read sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "chunk_arr_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "chunk_arr_stream", "role": "dout" }} , 
 	{ "name": "chunk_arr_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "chunk_arr_stream", "role": "empty_n" }} , 
 	{ "name": "chunk_arr_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "chunk_arr_stream", "role": "read" }} , 
 	{ "name": "codeword_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "codeword_stream", "role": "din" }} , 
 	{ "name": "codeword_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "codeword_stream", "role": "full_n" }} , 
 	{ "name": "codeword_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "codeword_stream", "role": "write" }} , 
 	{ "name": "gmem_load_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem_load_loc", "role": "dout" }} , 
 	{ "name": "gmem_load_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_load_loc", "role": "empty_n" }} , 
 	{ "name": "gmem_load_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem_load_loc", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7"],
		"CDFG" : "compress_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"Port" : [
			{"Name" : "chunk_arr_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "chunk_arr_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "codeword_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "1024", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "codeword_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem_load_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "gmem_load_loc_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.assoc_mem_quarter_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.assoc_mem_quarter_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.assoc_mem_quarter_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.assoc_mem_quarter_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.assoc_mem_value_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hash_table_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_lookup_and_insert_fu_280", "Parent" : "0",
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
	compress_stream {
		chunk_arr_stream {Type I LastRead 7 FirstWrite -1}
		codeword_stream {Type O LastRead -1 FirstWrite 7}
		gmem_load_loc {Type I LastRead 0 FirstWrite -1}}
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
	chunk_arr_stream { ap_fifo {  { chunk_arr_stream_dout fifo_data 0 8 }  { chunk_arr_stream_empty_n fifo_status 0 1 }  { chunk_arr_stream_read fifo_update 1 1 } } }
	codeword_stream { ap_fifo {  { codeword_stream_din fifo_data 1 16 }  { codeword_stream_full_n fifo_status 0 1 }  { codeword_stream_write fifo_update 1 1 } } }
	gmem_load_loc { ap_fifo {  { gmem_load_loc_dout fifo_data 0 32 }  { gmem_load_loc_empty_n fifo_status 0 1 }  { gmem_load_loc_read fifo_update 1 1 } } }
}
