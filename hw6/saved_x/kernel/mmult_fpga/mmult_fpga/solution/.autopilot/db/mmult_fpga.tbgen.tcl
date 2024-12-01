set moduleName mmult_fpga
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 1
set StallSigGenFlag 1
set isEnableWaveformDebug 1
set C_modelName {mmult_fpga}
set C_modelType { void 0 }
set C_modelArgList {
	{ b0 int 512 regular {axi_master 0}  }
	{ b1 int 512 regular {axi_master 0}  }
	{ b2 int 512 regular {axi_master 1}  }
	{ A int 64 regular {axi_slave 0}  }
	{ B int 64 regular {axi_slave 0}  }
	{ C int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "b0", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "A","cData": "int512","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "A","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "b1", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "B","cData": "int512","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "B","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "b2", "interface" : "axi_master", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "C","cData": "int512","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "C","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "A", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "B", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "C", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} ]}
# RTL Port declarations: 
set portNum 163
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ event_done sc_out sc_logic 1 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ event_start sc_out sc_logic 1 signal -1 } 
	{ m_axi_b0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_b0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_b0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_b0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_b0_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_b0_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_b1_AWLEN sc_out sc_lv 8 signal 1 } 
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
	{ m_axi_b1_ARLEN sc_out sc_lv 8 signal 1 } 
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
	{ m_axi_b2_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_b2_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_b2_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_b2_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_b2_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_b2_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_b2_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_b2_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_b2_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_b2_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_b2_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_b2_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_b2_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_b2_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_b2_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_b2_WDATA sc_out sc_lv 512 signal 2 } 
	{ m_axi_b2_WSTRB sc_out sc_lv 64 signal 2 } 
	{ m_axi_b2_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_b2_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_b2_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_b2_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_b2_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_b2_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_b2_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_b2_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_b2_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_b2_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_b2_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_b2_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_b2_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_b2_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_b2_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_b2_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_b2_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_b2_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_b2_RDATA sc_in sc_lv 512 signal 2 } 
	{ m_axi_b2_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_b2_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_b2_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_b2_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_b2_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_b2_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_b2_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_b2_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_b2_BUSER sc_in sc_lv 1 signal 2 } 
	{ stall_start_ext sc_out sc_logic 1 signal -1 } 
	{ stall_done_ext sc_out sc_logic 1 signal -1 } 
	{ stall_start_str sc_out sc_logic 1 signal -1 } 
	{ stall_done_str sc_out sc_logic 1 signal -1 } 
	{ stall_start_int sc_out sc_logic 1 signal -1 } 
	{ stall_done_int sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"mmult_fpga","role":"start","value":"0","valid_bit":"0"},{"name":"mmult_fpga","role":"continue","value":"0","valid_bit":"4"},{"name":"mmult_fpga","role":"auto_start","value":"0","valid_bit":"7"},{"name":"A","role":"data","value":"16"},{"name":"B","role":"data","value":"28"},{"name":"C","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"mmult_fpga","role":"start","value":"0","valid_bit":"0"},{"name":"mmult_fpga","role":"done","value":"0","valid_bit":"1"},{"name":"mmult_fpga","role":"idle","value":"0","valid_bit":"2"},{"name":"mmult_fpga","role":"ready","value":"0","valid_bit":"3"},{"name":"mmult_fpga","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "event_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "event_done", "role": "default" }} , 
 	{ "name": "event_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "event_start", "role": "default" }} , 
 	{ "name": "m_axi_b0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_b0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_b0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_b0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b0", "role": "AWID" }} , 
 	{ "name": "m_axi_b0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "b0", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_b0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "b0", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_b1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "b1", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_b1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "b1", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_b2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_b2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_b2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_b2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b2", "role": "AWID" }} , 
 	{ "name": "m_axi_b2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "b2", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_b2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "b2", "role": "ARLEN" }} , 
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
 	{ "name": "stall_start_ext", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_start_ext", "role": "default" }} , 
 	{ "name": "stall_done_ext", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_done_ext", "role": "default" }} , 
 	{ "name": "stall_start_str", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_start_str", "role": "default" }} , 
 	{ "name": "stall_done_str", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_done_str", "role": "default" }} , 
 	{ "name": "stall_start_int", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_start_int", "role": "default" }} , 
 	{ "name": "stall_done_int", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_done_int", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "135", "136", "137", "138", "139", "140", "141"],
		"CDFG" : "mmult_fpga",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "300891", "EstimateLatencyMax" : "300891",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "5", "Name" : "read3_U0"}],
		"OutputProcess" : [
			{"ID" : "135", "Name" : "write_U0"}],
		"Port" : [
			{"Name" : "b0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "read3_U0", "Port" : "b0"}]},
			{"Name" : "b1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "read3_U0", "Port" : "b1"}]},
			{"Name" : "b2", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "write_U0", "Port" : "b2"}]},
			{"Name" : "A", "Type" : "None", "Direction" : "I"},
			{"Name" : "B", "Type" : "None", "Direction" : "I"},
			{"Name" : "C", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b0_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b1_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b2_m_axi_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.read3_U0", "Parent" : "0",
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
			{"Name" : "A_tmp3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "6", "DependentChan" : "136", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "A_tmp3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "B_tmp4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "6", "DependentChan" : "137", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "B_tmp4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "A", "Type" : "None", "Direction" : "I"},
			{"Name" : "B", "Type" : "None", "Direction" : "I"},
			{"Name" : "C", "Type" : "None", "Direction" : "I"},
			{"Name" : "C_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "135", "DependentChan" : "138", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "C_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.execution_U0", "Parent" : "0", "Child" : ["7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134"],
		"CDFG" : "execution",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "300821", "EstimateLatencyMax" : "300821",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "5",
		"StartFifo" : "start_for_execution_U0_U",
		"Port" : [
			{"Name" : "A_tmp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "136", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "A_tmp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "B_tmp", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "137", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "B_tmp_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "result", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "135", "DependentChan" : "139", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "result_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_0_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_1_U", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_2_U", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_3_U", "Parent" : "6"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_4_U", "Parent" : "6"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_5_U", "Parent" : "6"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_6_U", "Parent" : "6"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_7_U", "Parent" : "6"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_8_U", "Parent" : "6"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_9_U", "Parent" : "6"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_10_U", "Parent" : "6"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_11_U", "Parent" : "6"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_12_U", "Parent" : "6"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_13_U", "Parent" : "6"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_14_U", "Parent" : "6"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_15_U", "Parent" : "6"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_16_U", "Parent" : "6"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_17_U", "Parent" : "6"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_18_U", "Parent" : "6"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_19_U", "Parent" : "6"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_20_U", "Parent" : "6"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_21_U", "Parent" : "6"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_22_U", "Parent" : "6"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_23_U", "Parent" : "6"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_24_U", "Parent" : "6"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_25_U", "Parent" : "6"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_26_U", "Parent" : "6"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_27_U", "Parent" : "6"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_28_U", "Parent" : "6"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_29_U", "Parent" : "6"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_30_U", "Parent" : "6"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.A_temp1_31_U", "Parent" : "6"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_0_U", "Parent" : "6"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_1_U", "Parent" : "6"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_2_U", "Parent" : "6"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_3_U", "Parent" : "6"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_4_U", "Parent" : "6"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_5_U", "Parent" : "6"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_6_U", "Parent" : "6"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_7_U", "Parent" : "6"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_8_U", "Parent" : "6"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_9_U", "Parent" : "6"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_10_U", "Parent" : "6"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_11_U", "Parent" : "6"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_12_U", "Parent" : "6"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_13_U", "Parent" : "6"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_14_U", "Parent" : "6"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_15_U", "Parent" : "6"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_16_U", "Parent" : "6"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_17_U", "Parent" : "6"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_18_U", "Parent" : "6"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_19_U", "Parent" : "6"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_20_U", "Parent" : "6"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_21_U", "Parent" : "6"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_22_U", "Parent" : "6"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_23_U", "Parent" : "6"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_24_U", "Parent" : "6"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_25_U", "Parent" : "6"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_26_U", "Parent" : "6"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_27_U", "Parent" : "6"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_28_U", "Parent" : "6"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_29_U", "Parent" : "6"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_30_U", "Parent" : "6"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.B_temp1_31_U", "Parent" : "6"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U9", "Parent" : "6"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U10", "Parent" : "6"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U11", "Parent" : "6"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U12", "Parent" : "6"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U13", "Parent" : "6"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U14", "Parent" : "6"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U15", "Parent" : "6"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U16", "Parent" : "6"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U17", "Parent" : "6"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U18", "Parent" : "6"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U19", "Parent" : "6"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U20", "Parent" : "6"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U21", "Parent" : "6"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U22", "Parent" : "6"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U23", "Parent" : "6"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U24", "Parent" : "6"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U25", "Parent" : "6"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U26", "Parent" : "6"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U27", "Parent" : "6"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U28", "Parent" : "6"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U29", "Parent" : "6"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U30", "Parent" : "6"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U31", "Parent" : "6"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U32", "Parent" : "6"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U33", "Parent" : "6"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U34", "Parent" : "6"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U35", "Parent" : "6"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U36", "Parent" : "6"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U37", "Parent" : "6"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U38", "Parent" : "6"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U39", "Parent" : "6"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fadd_32ns_32ns_32_8_full_dsp_1_U40", "Parent" : "6"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U41", "Parent" : "6"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U42", "Parent" : "6"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U43", "Parent" : "6"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U44", "Parent" : "6"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U45", "Parent" : "6"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U46", "Parent" : "6"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U47", "Parent" : "6"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U48", "Parent" : "6"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U49", "Parent" : "6"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U50", "Parent" : "6"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U51", "Parent" : "6"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U52", "Parent" : "6"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U53", "Parent" : "6"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U54", "Parent" : "6"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U55", "Parent" : "6"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U56", "Parent" : "6"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U57", "Parent" : "6"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U58", "Parent" : "6"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U59", "Parent" : "6"},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U60", "Parent" : "6"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U61", "Parent" : "6"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U62", "Parent" : "6"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U63", "Parent" : "6"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U64", "Parent" : "6"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U65", "Parent" : "6"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U66", "Parent" : "6"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U67", "Parent" : "6"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U68", "Parent" : "6"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U69", "Parent" : "6"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U70", "Parent" : "6"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U71", "Parent" : "6"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.execution_U0.fmul_32ns_32ns_32_4_max_dsp_1_U72", "Parent" : "6"},
	{"ID" : "135", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.write_U0", "Parent" : "0",
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
		"StartSource" : "5",
		"StartFifo" : "start_for_write_U0_U",
		"Port" : [
			{"Name" : "result5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "139", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "result5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "b2_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "b2_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "b2_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "output_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "138", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_r_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "136", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.A_tmp_U", "Parent" : "0"},
	{"ID" : "137", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.B_tmp_U", "Parent" : "0"},
	{"ID" : "138", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.C_c_U", "Parent" : "0"},
	{"ID" : "139", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.result_U", "Parent" : "0"},
	{"ID" : "140", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_execution_U0_U", "Parent" : "0"},
	{"ID" : "141", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_write_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mmult_fpga {
		b0 {Type I LastRead 71 FirstWrite -1}
		b1 {Type I LastRead 71 FirstWrite -1}
		b2 {Type O LastRead 3 FirstWrite 4}
		A {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}
		C {Type I LastRead 0 FirstWrite -1}}
	read3 {
		b0 {Type I LastRead 71 FirstWrite -1}
		b1 {Type I LastRead 71 FirstWrite -1}
		A_tmp3 {Type O LastRead -1 FirstWrite 72}
		B_tmp4 {Type O LastRead -1 FirstWrite 72}
		A {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}
		C {Type I LastRead 0 FirstWrite -1}
		C_out {Type O LastRead -1 FirstWrite 0}}
	execution {
		A_tmp {Type I LastRead 3 FirstWrite -1}
		B_tmp {Type I LastRead 3 FirstWrite -1}
		result {Type O LastRead -1 FirstWrite 266}}
	write_r {
		result5 {Type I LastRead 3 FirstWrite -1}
		b2 {Type O LastRead 3 FirstWrite 4}
		output_r {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "300891", "Max" : "300891"}
	, {"Name" : "Interval", "Min" : "300822", "Max" : "300822"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	b0 { m_axi {  { m_axi_b0_AWVALID VALID 1 1 }  { m_axi_b0_AWREADY READY 0 1 }  { m_axi_b0_AWADDR ADDR 1 64 }  { m_axi_b0_AWID ID 1 1 }  { m_axi_b0_AWLEN LEN 1 8 }  { m_axi_b0_AWSIZE SIZE 1 3 }  { m_axi_b0_AWBURST BURST 1 2 }  { m_axi_b0_AWLOCK LOCK 1 2 }  { m_axi_b0_AWCACHE CACHE 1 4 }  { m_axi_b0_AWPROT PROT 1 3 }  { m_axi_b0_AWQOS QOS 1 4 }  { m_axi_b0_AWREGION REGION 1 4 }  { m_axi_b0_AWUSER USER 1 1 }  { m_axi_b0_WVALID VALID 1 1 }  { m_axi_b0_WREADY READY 0 1 }  { m_axi_b0_WDATA DATA 1 512 }  { m_axi_b0_WSTRB STRB 1 64 }  { m_axi_b0_WLAST LAST 1 1 }  { m_axi_b0_WID ID 1 1 }  { m_axi_b0_WUSER USER 1 1 }  { m_axi_b0_ARVALID VALID 1 1 }  { m_axi_b0_ARREADY READY 0 1 }  { m_axi_b0_ARADDR ADDR 1 64 }  { m_axi_b0_ARID ID 1 1 }  { m_axi_b0_ARLEN LEN 1 8 }  { m_axi_b0_ARSIZE SIZE 1 3 }  { m_axi_b0_ARBURST BURST 1 2 }  { m_axi_b0_ARLOCK LOCK 1 2 }  { m_axi_b0_ARCACHE CACHE 1 4 }  { m_axi_b0_ARPROT PROT 1 3 }  { m_axi_b0_ARQOS QOS 1 4 }  { m_axi_b0_ARREGION REGION 1 4 }  { m_axi_b0_ARUSER USER 1 1 }  { m_axi_b0_RVALID VALID 0 1 }  { m_axi_b0_RREADY READY 1 1 }  { m_axi_b0_RDATA DATA 0 512 }  { m_axi_b0_RLAST LAST 0 1 }  { m_axi_b0_RID ID 0 1 }  { m_axi_b0_RUSER USER 0 1 }  { m_axi_b0_RRESP RESP 0 2 }  { m_axi_b0_BVALID VALID 0 1 }  { m_axi_b0_BREADY READY 1 1 }  { m_axi_b0_BRESP RESP 0 2 }  { m_axi_b0_BID ID 0 1 }  { m_axi_b0_BUSER USER 0 1 } } }
	b1 { m_axi {  { m_axi_b1_AWVALID VALID 1 1 }  { m_axi_b1_AWREADY READY 0 1 }  { m_axi_b1_AWADDR ADDR 1 64 }  { m_axi_b1_AWID ID 1 1 }  { m_axi_b1_AWLEN LEN 1 8 }  { m_axi_b1_AWSIZE SIZE 1 3 }  { m_axi_b1_AWBURST BURST 1 2 }  { m_axi_b1_AWLOCK LOCK 1 2 }  { m_axi_b1_AWCACHE CACHE 1 4 }  { m_axi_b1_AWPROT PROT 1 3 }  { m_axi_b1_AWQOS QOS 1 4 }  { m_axi_b1_AWREGION REGION 1 4 }  { m_axi_b1_AWUSER USER 1 1 }  { m_axi_b1_WVALID VALID 1 1 }  { m_axi_b1_WREADY READY 0 1 }  { m_axi_b1_WDATA DATA 1 512 }  { m_axi_b1_WSTRB STRB 1 64 }  { m_axi_b1_WLAST LAST 1 1 }  { m_axi_b1_WID ID 1 1 }  { m_axi_b1_WUSER USER 1 1 }  { m_axi_b1_ARVALID VALID 1 1 }  { m_axi_b1_ARREADY READY 0 1 }  { m_axi_b1_ARADDR ADDR 1 64 }  { m_axi_b1_ARID ID 1 1 }  { m_axi_b1_ARLEN LEN 1 8 }  { m_axi_b1_ARSIZE SIZE 1 3 }  { m_axi_b1_ARBURST BURST 1 2 }  { m_axi_b1_ARLOCK LOCK 1 2 }  { m_axi_b1_ARCACHE CACHE 1 4 }  { m_axi_b1_ARPROT PROT 1 3 }  { m_axi_b1_ARQOS QOS 1 4 }  { m_axi_b1_ARREGION REGION 1 4 }  { m_axi_b1_ARUSER USER 1 1 }  { m_axi_b1_RVALID VALID 0 1 }  { m_axi_b1_RREADY READY 1 1 }  { m_axi_b1_RDATA DATA 0 512 }  { m_axi_b1_RLAST LAST 0 1 }  { m_axi_b1_RID ID 0 1 }  { m_axi_b1_RUSER USER 0 1 }  { m_axi_b1_RRESP RESP 0 2 }  { m_axi_b1_BVALID VALID 0 1 }  { m_axi_b1_BREADY READY 1 1 }  { m_axi_b1_BRESP RESP 0 2 }  { m_axi_b1_BID ID 0 1 }  { m_axi_b1_BUSER USER 0 1 } } }
	b2 { m_axi {  { m_axi_b2_AWVALID VALID 1 1 }  { m_axi_b2_AWREADY READY 0 1 }  { m_axi_b2_AWADDR ADDR 1 64 }  { m_axi_b2_AWID ID 1 1 }  { m_axi_b2_AWLEN LEN 1 8 }  { m_axi_b2_AWSIZE SIZE 1 3 }  { m_axi_b2_AWBURST BURST 1 2 }  { m_axi_b2_AWLOCK LOCK 1 2 }  { m_axi_b2_AWCACHE CACHE 1 4 }  { m_axi_b2_AWPROT PROT 1 3 }  { m_axi_b2_AWQOS QOS 1 4 }  { m_axi_b2_AWREGION REGION 1 4 }  { m_axi_b2_AWUSER USER 1 1 }  { m_axi_b2_WVALID VALID 1 1 }  { m_axi_b2_WREADY READY 0 1 }  { m_axi_b2_WDATA DATA 1 512 }  { m_axi_b2_WSTRB STRB 1 64 }  { m_axi_b2_WLAST LAST 1 1 }  { m_axi_b2_WID ID 1 1 }  { m_axi_b2_WUSER USER 1 1 }  { m_axi_b2_ARVALID VALID 1 1 }  { m_axi_b2_ARREADY READY 0 1 }  { m_axi_b2_ARADDR ADDR 1 64 }  { m_axi_b2_ARID ID 1 1 }  { m_axi_b2_ARLEN LEN 1 8 }  { m_axi_b2_ARSIZE SIZE 1 3 }  { m_axi_b2_ARBURST BURST 1 2 }  { m_axi_b2_ARLOCK LOCK 1 2 }  { m_axi_b2_ARCACHE CACHE 1 4 }  { m_axi_b2_ARPROT PROT 1 3 }  { m_axi_b2_ARQOS QOS 1 4 }  { m_axi_b2_ARREGION REGION 1 4 }  { m_axi_b2_ARUSER USER 1 1 }  { m_axi_b2_RVALID VALID 0 1 }  { m_axi_b2_RREADY READY 1 1 }  { m_axi_b2_RDATA DATA 0 512 }  { m_axi_b2_RLAST LAST 0 1 }  { m_axi_b2_RID ID 0 1 }  { m_axi_b2_RUSER USER 0 1 }  { m_axi_b2_RRESP RESP 0 2 }  { m_axi_b2_BVALID VALID 0 1 }  { m_axi_b2_BREADY READY 1 1 }  { m_axi_b2_BRESP RESP 0 2 }  { m_axi_b2_BID ID 0 1 }  { m_axi_b2_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ b0 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ b1 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ b2 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ b0 64 }
	{ b1 64 }
	{ b2 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ b0 64 }
	{ b1 64 }
	{ b2 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
