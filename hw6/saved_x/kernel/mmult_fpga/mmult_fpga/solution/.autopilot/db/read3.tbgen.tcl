set moduleName read3
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
set C_modelName {read3}
set C_modelType { void 0 }
set C_modelArgList {
	{ b0 int 512 regular {axi_master 0}  }
	{ b1 int 512 regular {axi_master 0}  }
	{ A_tmp3 int 32 regular {fifo 1 volatile }  }
	{ B_tmp4 int 32 regular {fifo 1 volatile }  }
	{ A int 64 regular  }
	{ B int 64 regular  }
	{ C int 64 regular  }
	{ C_out int 64 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "b0", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "b1", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "A_tmp3", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "B_tmp4", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "A", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "B", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "C", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "C_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 115
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
	{ m_axi_b0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_b0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_b0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_b0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_b0_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_b0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_b0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_b0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_b0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_b0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_b0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_b0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_b0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_b0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_b0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_b0_WDATA sc_out sc_lv 512 signal 0 } 
	{ m_axi_b0_WSTRB sc_out sc_lv 64 signal 0 } 
	{ m_axi_b0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_b0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_b0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_b0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_b0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_b0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_b0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_b0_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_b0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_b0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_b0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_b0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_b0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_b0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_b0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_b0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_b0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_b0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_b0_RDATA sc_in sc_lv 512 signal 0 } 
	{ m_axi_b0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_b0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_b0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_b0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_b0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_b0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_b0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_b0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_b0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_b1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_b1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_b1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_b1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_b1_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_b1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_b1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_b1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_b1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_b1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_b1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_b1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_b1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_b1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_b1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_b1_WDATA sc_out sc_lv 512 signal 1 } 
	{ m_axi_b1_WSTRB sc_out sc_lv 64 signal 1 } 
	{ m_axi_b1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_b1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_b1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_b1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_b1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_b1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_b1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_b1_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_b1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_b1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_b1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_b1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_b1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_b1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_b1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_b1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_b1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_b1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_b1_RDATA sc_in sc_lv 512 signal 1 } 
	{ m_axi_b1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_b1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_b1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_b1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_b1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_b1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_b1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_b1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_b1_BUSER sc_in sc_lv 1 signal 1 } 
	{ A_tmp3_din sc_out sc_lv 32 signal 2 } 
	{ A_tmp3_full_n sc_in sc_logic 1 signal 2 } 
	{ A_tmp3_write sc_out sc_logic 1 signal 2 } 
	{ B_tmp4_din sc_out sc_lv 32 signal 3 } 
	{ B_tmp4_full_n sc_in sc_logic 1 signal 3 } 
	{ B_tmp4_write sc_out sc_logic 1 signal 3 } 
	{ A sc_in sc_lv 64 signal 4 } 
	{ B sc_in sc_lv 64 signal 5 } 
	{ C sc_in sc_lv 64 signal 6 } 
	{ C_out_din sc_out sc_lv 64 signal 7 } 
	{ C_out_full_n sc_in sc_logic 1 signal 7 } 
	{ C_out_write sc_out sc_logic 1 signal 7 } 
	{ ap_ext_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_str_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_int_blocking_n sc_out sc_logic 1 signal -1 } 
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
 	{ "name": "m_axi_b0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_b0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_b0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_b0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "AWID" }} , 
 	{ "name": "m_axi_b0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_b0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_b0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_b0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_b0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_b0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_b0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_b0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_b0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_b0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "WVALID" }} , 
 	{ "name": "m_axi_b0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "WREADY" }} , 
 	{ "name": "m_axi_b0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "b0", "role": "WDATA" }} , 
 	{ "name": "m_axi_b0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_b0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "WLAST" }} , 
 	{ "name": "m_axi_b0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "WID" }} , 
 	{ "name": "m_axi_b0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "WUSER" }} , 
 	{ "name": "m_axi_b0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_b0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_b0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_b0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "ARID" }} , 
 	{ "name": "m_axi_b0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_b0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_b0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_b0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_b0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_b0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_b0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_b0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_b0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_b0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "RVALID" }} , 
 	{ "name": "m_axi_b0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "RREADY" }} , 
 	{ "name": "m_axi_b0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "b0", "role": "RDATA" }} , 
 	{ "name": "m_axi_b0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "RLAST" }} , 
 	{ "name": "m_axi_b0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "RID" }} , 
 	{ "name": "m_axi_b0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "RUSER" }} , 
 	{ "name": "m_axi_b0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b0", "role": "RRESP" }} , 
 	{ "name": "m_axi_b0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "BVALID" }} , 
 	{ "name": "m_axi_b0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "BREADY" }} , 
 	{ "name": "m_axi_b0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b0", "role": "BRESP" }} , 
 	{ "name": "m_axi_b0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "BID" }} , 
 	{ "name": "m_axi_b0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "BUSER" }} , 
 	{ "name": "m_axi_b1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_b1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_b1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_b1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "AWID" }} , 
 	{ "name": "m_axi_b1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_b1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_b1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_b1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_b1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_b1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_b1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_b1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_b1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_b1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "WVALID" }} , 
 	{ "name": "m_axi_b1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "WREADY" }} , 
 	{ "name": "m_axi_b1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "b1", "role": "WDATA" }} , 
 	{ "name": "m_axi_b1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_b1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "WLAST" }} , 
 	{ "name": "m_axi_b1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "WID" }} , 
 	{ "name": "m_axi_b1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "WUSER" }} , 
 	{ "name": "m_axi_b1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_b1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_b1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_b1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "ARID" }} , 
 	{ "name": "m_axi_b1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_b1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_b1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_b1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_b1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_b1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_b1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_b1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_b1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_b1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "RVALID" }} , 
 	{ "name": "m_axi_b1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "RREADY" }} , 
 	{ "name": "m_axi_b1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "b1", "role": "RDATA" }} , 
 	{ "name": "m_axi_b1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "RLAST" }} , 
 	{ "name": "m_axi_b1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "RID" }} , 
 	{ "name": "m_axi_b1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "RUSER" }} , 
 	{ "name": "m_axi_b1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b1", "role": "RRESP" }} , 
 	{ "name": "m_axi_b1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "BVALID" }} , 
 	{ "name": "m_axi_b1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "BREADY" }} , 
 	{ "name": "m_axi_b1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b1", "role": "BRESP" }} , 
 	{ "name": "m_axi_b1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "BID" }} , 
 	{ "name": "m_axi_b1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b1", "role": "BUSER" }} , 
 	{ "name": "A_tmp3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_tmp3", "role": "din" }} , 
 	{ "name": "A_tmp3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_tmp3", "role": "full_n" }} , 
 	{ "name": "A_tmp3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_tmp3", "role": "write" }} , 
 	{ "name": "B_tmp4_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B_tmp4", "role": "din" }} , 
 	{ "name": "B_tmp4_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_tmp4", "role": "full_n" }} , 
 	{ "name": "B_tmp4_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B_tmp4", "role": "write" }} , 
 	{ "name": "A", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "default" }} , 
 	{ "name": "B", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "B", "role": "default" }} , 
 	{ "name": "C", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "C", "role": "default" }} , 
 	{ "name": "C_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "C_out", "role": "din" }} , 
 	{ "name": "C_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_out", "role": "full_n" }} , 
 	{ "name": "C_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C_out", "role": "write" }} , 
 	{ "name": "ap_ext_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_ext_blocking_n", "role": "default" }} , 
 	{ "name": "ap_str_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_str_blocking_n", "role": "default" }} , 
 	{ "name": "ap_int_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_int_blocking_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "read3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "133192", "EstimateLatencyMax" : "133192",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "b0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "b0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "b0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "b1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "b1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "b1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "A_tmp3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "A_tmp3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "B_tmp4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "B_tmp4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "A", "Type" : "None", "Direction" : "I"},
			{"Name" : "B", "Type" : "None", "Direction" : "I"},
			{"Name" : "C", "Type" : "None", "Direction" : "I"},
			{"Name" : "C_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "C_out_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	read3 {
		b0 {Type I LastRead 71 FirstWrite -1}
		b1 {Type I LastRead 71 FirstWrite -1}
		A_tmp3 {Type O LastRead -1 FirstWrite 72}
		B_tmp4 {Type O LastRead -1 FirstWrite 72}
		A {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}
		C {Type I LastRead 0 FirstWrite -1}
		C_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "133192", "Max" : "133192"}
	, {"Name" : "Interval", "Min" : "133192", "Max" : "133192"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	b0 { m_axi {  { m_axi_b0_AWVALID VALID 1 1 }  { m_axi_b0_AWREADY READY 0 1 }  { m_axi_b0_AWADDR ADDR 1 64 }  { m_axi_b0_AWID ID 1 1 }  { m_axi_b0_AWLEN LEN 1 32 }  { m_axi_b0_AWSIZE SIZE 1 3 }  { m_axi_b0_AWBURST BURST 1 2 }  { m_axi_b0_AWLOCK LOCK 1 2 }  { m_axi_b0_AWCACHE CACHE 1 4 }  { m_axi_b0_AWPROT PROT 1 3 }  { m_axi_b0_AWQOS QOS 1 4 }  { m_axi_b0_AWREGION REGION 1 4 }  { m_axi_b0_AWUSER USER 1 1 }  { m_axi_b0_WVALID VALID 1 1 }  { m_axi_b0_WREADY READY 0 1 }  { m_axi_b0_WDATA DATA 1 512 }  { m_axi_b0_WSTRB STRB 1 64 }  { m_axi_b0_WLAST LAST 1 1 }  { m_axi_b0_WID ID 1 1 }  { m_axi_b0_WUSER USER 1 1 }  { m_axi_b0_ARVALID VALID 1 1 }  { m_axi_b0_ARREADY READY 0 1 }  { m_axi_b0_ARADDR ADDR 1 64 }  { m_axi_b0_ARID ID 1 1 }  { m_axi_b0_ARLEN LEN 1 32 }  { m_axi_b0_ARSIZE SIZE 1 3 }  { m_axi_b0_ARBURST BURST 1 2 }  { m_axi_b0_ARLOCK LOCK 1 2 }  { m_axi_b0_ARCACHE CACHE 1 4 }  { m_axi_b0_ARPROT PROT 1 3 }  { m_axi_b0_ARQOS QOS 1 4 }  { m_axi_b0_ARREGION REGION 1 4 }  { m_axi_b0_ARUSER USER 1 1 }  { m_axi_b0_RVALID VALID 0 1 }  { m_axi_b0_RREADY READY 1 1 }  { m_axi_b0_RDATA DATA 0 512 }  { m_axi_b0_RLAST LAST 0 1 }  { m_axi_b0_RID ID 0 1 }  { m_axi_b0_RUSER USER 0 1 }  { m_axi_b0_RRESP RESP 0 2 }  { m_axi_b0_BVALID VALID 0 1 }  { m_axi_b0_BREADY READY 1 1 }  { m_axi_b0_BRESP RESP 0 2 }  { m_axi_b0_BID ID 0 1 }  { m_axi_b0_BUSER USER 0 1 } } }
	b1 { m_axi {  { m_axi_b1_AWVALID VALID 1 1 }  { m_axi_b1_AWREADY READY 0 1 }  { m_axi_b1_AWADDR ADDR 1 64 }  { m_axi_b1_AWID ID 1 1 }  { m_axi_b1_AWLEN LEN 1 32 }  { m_axi_b1_AWSIZE SIZE 1 3 }  { m_axi_b1_AWBURST BURST 1 2 }  { m_axi_b1_AWLOCK LOCK 1 2 }  { m_axi_b1_AWCACHE CACHE 1 4 }  { m_axi_b1_AWPROT PROT 1 3 }  { m_axi_b1_AWQOS QOS 1 4 }  { m_axi_b1_AWREGION REGION 1 4 }  { m_axi_b1_AWUSER USER 1 1 }  { m_axi_b1_WVALID VALID 1 1 }  { m_axi_b1_WREADY READY 0 1 }  { m_axi_b1_WDATA DATA 1 512 }  { m_axi_b1_WSTRB STRB 1 64 }  { m_axi_b1_WLAST LAST 1 1 }  { m_axi_b1_WID ID 1 1 }  { m_axi_b1_WUSER USER 1 1 }  { m_axi_b1_ARVALID VALID 1 1 }  { m_axi_b1_ARREADY READY 0 1 }  { m_axi_b1_ARADDR ADDR 1 64 }  { m_axi_b1_ARID ID 1 1 }  { m_axi_b1_ARLEN LEN 1 32 }  { m_axi_b1_ARSIZE SIZE 1 3 }  { m_axi_b1_ARBURST BURST 1 2 }  { m_axi_b1_ARLOCK LOCK 1 2 }  { m_axi_b1_ARCACHE CACHE 1 4 }  { m_axi_b1_ARPROT PROT 1 3 }  { m_axi_b1_ARQOS QOS 1 4 }  { m_axi_b1_ARREGION REGION 1 4 }  { m_axi_b1_ARUSER USER 1 1 }  { m_axi_b1_RVALID VALID 0 1 }  { m_axi_b1_RREADY READY 1 1 }  { m_axi_b1_RDATA DATA 0 512 }  { m_axi_b1_RLAST LAST 0 1 }  { m_axi_b1_RID ID 0 1 }  { m_axi_b1_RUSER USER 0 1 }  { m_axi_b1_RRESP RESP 0 2 }  { m_axi_b1_BVALID VALID 0 1 }  { m_axi_b1_BREADY READY 1 1 }  { m_axi_b1_BRESP RESP 0 2 }  { m_axi_b1_BID ID 0 1 }  { m_axi_b1_BUSER USER 0 1 } } }
	A_tmp3 { ap_fifo {  { A_tmp3_din fifo_data 1 32 }  { A_tmp3_full_n fifo_status 0 1 }  { A_tmp3_write fifo_update 1 1 } } }
	B_tmp4 { ap_fifo {  { B_tmp4_din fifo_data 1 32 }  { B_tmp4_full_n fifo_status 0 1 }  { B_tmp4_write fifo_update 1 1 } } }
	A { ap_none {  { A in_data 0 64 } } }
	B { ap_none {  { B in_data 0 64 } } }
	C { ap_none {  { C in_data 0 64 } } }
	C_out { ap_fifo {  { C_out_din fifo_data 1 64 }  { C_out_full_n fifo_status 0 1 }  { C_out_write fifo_update 1 1 } } }
}
