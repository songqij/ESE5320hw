set moduleName write_r
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 1
set StallSigGenFlag 1
set isEnableWaveformDebug 1
set C_modelName {write}
set C_modelType { void 0 }
set C_modelArgList {
	{ result5 int 32 regular {fifo 0 volatile }  }
	{ b2 int 512 regular {axi_master 1}  }
	{ output_r int 64 regular {fifo 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "result5", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "b2", "interface" : "axi_master", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_r", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 61
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ result5_dout sc_in sc_lv 32 signal 0 } 
	{ result5_empty_n sc_in sc_logic 1 signal 0 } 
	{ result5_read sc_out sc_logic 1 signal 0 } 
	{ m_axi_b2_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_b2_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_b2_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_b2_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_b2_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_b2_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_b2_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_b2_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_b2_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_b2_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_b2_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_b2_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_b2_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_b2_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_b2_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_b2_WDATA sc_out sc_lv 512 signal 1 } 
	{ m_axi_b2_WSTRB sc_out sc_lv 64 signal 1 } 
	{ m_axi_b2_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_b2_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_b2_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_b2_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_b2_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_b2_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_b2_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_b2_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_b2_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_b2_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_b2_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_b2_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_b2_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_b2_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_b2_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_b2_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_b2_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_b2_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_b2_RDATA sc_in sc_lv 512 signal 1 } 
	{ m_axi_b2_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_b2_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_b2_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_b2_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_b2_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_b2_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_b2_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_b2_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_b2_BUSER sc_in sc_lv 1 signal 1 } 
	{ output_r_dout sc_in sc_lv 64 signal 2 } 
	{ output_r_empty_n sc_in sc_logic 1 signal 2 } 
	{ output_r_read sc_out sc_logic 1 signal 2 } 
	{ ap_ext_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_str_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_int_blocking_n sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "result5_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "result5", "role": "dout" }} , 
 	{ "name": "result5_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result5", "role": "empty_n" }} , 
 	{ "name": "result5_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "result5", "role": "read" }} , 
 	{ "name": "m_axi_b2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_b2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_b2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_b2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "AWID" }} , 
 	{ "name": "m_axi_b2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b2", "role": "AWLEN" }} , 
 	{ "name": "m_axi_b2_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b2", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_b2_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b2", "role": "AWBURST" }} , 
 	{ "name": "m_axi_b2_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b2", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_b2_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b2", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_b2_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b2", "role": "AWPROT" }} , 
 	{ "name": "m_axi_b2_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b2", "role": "AWQOS" }} , 
 	{ "name": "m_axi_b2_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b2", "role": "AWREGION" }} , 
 	{ "name": "m_axi_b2_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "AWUSER" }} , 
 	{ "name": "m_axi_b2_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "WVALID" }} , 
 	{ "name": "m_axi_b2_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "WREADY" }} , 
 	{ "name": "m_axi_b2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "b2", "role": "WDATA" }} , 
 	{ "name": "m_axi_b2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_b2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "WLAST" }} , 
 	{ "name": "m_axi_b2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "WID" }} , 
 	{ "name": "m_axi_b2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "WUSER" }} , 
 	{ "name": "m_axi_b2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_b2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_b2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_b2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "ARID" }} , 
 	{ "name": "m_axi_b2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b2", "role": "ARLEN" }} , 
 	{ "name": "m_axi_b2_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b2", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_b2_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b2", "role": "ARBURST" }} , 
 	{ "name": "m_axi_b2_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b2", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_b2_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b2", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_b2_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b2", "role": "ARPROT" }} , 
 	{ "name": "m_axi_b2_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b2", "role": "ARQOS" }} , 
 	{ "name": "m_axi_b2_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b2", "role": "ARREGION" }} , 
 	{ "name": "m_axi_b2_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "ARUSER" }} , 
 	{ "name": "m_axi_b2_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "RVALID" }} , 
 	{ "name": "m_axi_b2_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "RREADY" }} , 
 	{ "name": "m_axi_b2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "b2", "role": "RDATA" }} , 
 	{ "name": "m_axi_b2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "RLAST" }} , 
 	{ "name": "m_axi_b2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "RID" }} , 
 	{ "name": "m_axi_b2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "RUSER" }} , 
 	{ "name": "m_axi_b2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b2", "role": "RRESP" }} , 
 	{ "name": "m_axi_b2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "BVALID" }} , 
 	{ "name": "m_axi_b2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "BREADY" }} , 
 	{ "name": "m_axi_b2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b2", "role": "BRESP" }} , 
 	{ "name": "m_axi_b2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "BID" }} , 
 	{ "name": "m_axi_b2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "BUSER" }} , 
 	{ "name": "output_r_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_r", "role": "dout" }} , 
 	{ "name": "output_r_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "empty_n" }} , 
 	{ "name": "output_r_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "read" }} , 
 	{ "name": "ap_ext_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_ext_blocking_n", "role": "default" }} , 
 	{ "name": "ap_str_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_str_blocking_n", "role": "default" }} , 
 	{ "name": "ap_int_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_int_blocking_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "write_r",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "133191", "EstimateLatencyMax" : "133191",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "result5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "result5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "b2_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "b2_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "b2_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "output_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_r_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	write_r {
		result5 {Type I LastRead 3 FirstWrite -1}
		b2 {Type O LastRead 3 FirstWrite 4}
		output_r {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "133191", "Max" : "133191"}
	, {"Name" : "Interval", "Min" : "133191", "Max" : "133191"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	result5 { ap_fifo {  { result5_dout fifo_data 0 32 }  { result5_empty_n fifo_status 0 1 }  { result5_read fifo_update 1 1 } } }
	b2 { m_axi {  { m_axi_b2_AWVALID VALID 1 1 }  { m_axi_b2_AWREADY READY 0 1 }  { m_axi_b2_AWADDR ADDR 1 64 }  { m_axi_b2_AWID ID 1 1 }  { m_axi_b2_AWLEN LEN 1 32 }  { m_axi_b2_AWSIZE SIZE 1 3 }  { m_axi_b2_AWBURST BURST 1 2 }  { m_axi_b2_AWLOCK LOCK 1 2 }  { m_axi_b2_AWCACHE CACHE 1 4 }  { m_axi_b2_AWPROT PROT 1 3 }  { m_axi_b2_AWQOS QOS 1 4 }  { m_axi_b2_AWREGION REGION 1 4 }  { m_axi_b2_AWUSER USER 1 1 }  { m_axi_b2_WVALID VALID 1 1 }  { m_axi_b2_WREADY READY 0 1 }  { m_axi_b2_WDATA DATA 1 512 }  { m_axi_b2_WSTRB STRB 1 64 }  { m_axi_b2_WLAST LAST 1 1 }  { m_axi_b2_WID ID 1 1 }  { m_axi_b2_WUSER USER 1 1 }  { m_axi_b2_ARVALID VALID 1 1 }  { m_axi_b2_ARREADY READY 0 1 }  { m_axi_b2_ARADDR ADDR 1 64 }  { m_axi_b2_ARID ID 1 1 }  { m_axi_b2_ARLEN LEN 1 32 }  { m_axi_b2_ARSIZE SIZE 1 3 }  { m_axi_b2_ARBURST BURST 1 2 }  { m_axi_b2_ARLOCK LOCK 1 2 }  { m_axi_b2_ARCACHE CACHE 1 4 }  { m_axi_b2_ARPROT PROT 1 3 }  { m_axi_b2_ARQOS QOS 1 4 }  { m_axi_b2_ARREGION REGION 1 4 }  { m_axi_b2_ARUSER USER 1 1 }  { m_axi_b2_RVALID VALID 0 1 }  { m_axi_b2_RREADY READY 1 1 }  { m_axi_b2_RDATA DATA 0 512 }  { m_axi_b2_RLAST LAST 0 1 }  { m_axi_b2_RID ID 0 1 }  { m_axi_b2_RUSER USER 0 1 }  { m_axi_b2_RRESP RESP 0 2 }  { m_axi_b2_BVALID VALID 0 1 }  { m_axi_b2_BREADY READY 1 1 }  { m_axi_b2_BRESP RESP 0 2 }  { m_axi_b2_BID ID 0 1 }  { m_axi_b2_BUSER USER 0 1 } } }
	output_r { ap_fifo {  { output_r_dout fifo_data 0 64 }  { output_r_empty_n fifo_status 0 1 }  { output_r_read fifo_update 1 1 } } }
}
