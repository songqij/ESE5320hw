// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Thu Oct 17 03:43:19 2024
// Host        : gemini.seas.upenn.edu running 64-bit openSUSE Leap 15.6
// Command     : write_verilog -force -mode synth_stub
//               /mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/_x/link/vivado/vpl/prj/prj.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_mmult_fpga_1_0/u96v2_sbc_base_mmult_fpga_1_0_stub.v
// Design      : u96v2_sbc_base_mmult_fpga_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mmult_fpga,Vivado 2020.2" *)
module u96v2_sbc_base_mmult_fpga_1_0(stall_start_ext, stall_done_ext, 
  stall_start_str, stall_done_str, stall_start_int, stall_done_int, s_axi_control_AWADDR, 
  s_axi_control_AWVALID, s_axi_control_AWREADY, s_axi_control_WDATA, s_axi_control_WSTRB, 
  s_axi_control_WVALID, s_axi_control_WREADY, s_axi_control_BRESP, s_axi_control_BVALID, 
  s_axi_control_BREADY, s_axi_control_ARADDR, s_axi_control_ARVALID, 
  s_axi_control_ARREADY, s_axi_control_RDATA, s_axi_control_RRESP, s_axi_control_RVALID, 
  s_axi_control_RREADY, ap_clk, ap_rst_n, event_done, interrupt, event_start, m_axi_b0_AWADDR, 
  m_axi_b0_AWLEN, m_axi_b0_AWSIZE, m_axi_b0_AWBURST, m_axi_b0_AWLOCK, m_axi_b0_AWREGION, 
  m_axi_b0_AWCACHE, m_axi_b0_AWPROT, m_axi_b0_AWQOS, m_axi_b0_AWVALID, m_axi_b0_AWREADY, 
  m_axi_b0_WDATA, m_axi_b0_WSTRB, m_axi_b0_WLAST, m_axi_b0_WVALID, m_axi_b0_WREADY, 
  m_axi_b0_BRESP, m_axi_b0_BVALID, m_axi_b0_BREADY, m_axi_b0_ARADDR, m_axi_b0_ARLEN, 
  m_axi_b0_ARSIZE, m_axi_b0_ARBURST, m_axi_b0_ARLOCK, m_axi_b0_ARREGION, m_axi_b0_ARCACHE, 
  m_axi_b0_ARPROT, m_axi_b0_ARQOS, m_axi_b0_ARVALID, m_axi_b0_ARREADY, m_axi_b0_RDATA, 
  m_axi_b0_RRESP, m_axi_b0_RLAST, m_axi_b0_RVALID, m_axi_b0_RREADY, m_axi_b1_AWADDR, 
  m_axi_b1_AWLEN, m_axi_b1_AWSIZE, m_axi_b1_AWBURST, m_axi_b1_AWLOCK, m_axi_b1_AWREGION, 
  m_axi_b1_AWCACHE, m_axi_b1_AWPROT, m_axi_b1_AWQOS, m_axi_b1_AWVALID, m_axi_b1_AWREADY, 
  m_axi_b1_WDATA, m_axi_b1_WSTRB, m_axi_b1_WLAST, m_axi_b1_WVALID, m_axi_b1_WREADY, 
  m_axi_b1_BRESP, m_axi_b1_BVALID, m_axi_b1_BREADY, m_axi_b1_ARADDR, m_axi_b1_ARLEN, 
  m_axi_b1_ARSIZE, m_axi_b1_ARBURST, m_axi_b1_ARLOCK, m_axi_b1_ARREGION, m_axi_b1_ARCACHE, 
  m_axi_b1_ARPROT, m_axi_b1_ARQOS, m_axi_b1_ARVALID, m_axi_b1_ARREADY, m_axi_b1_RDATA, 
  m_axi_b1_RRESP, m_axi_b1_RLAST, m_axi_b1_RVALID, m_axi_b1_RREADY, m_axi_b2_AWADDR, 
  m_axi_b2_AWLEN, m_axi_b2_AWSIZE, m_axi_b2_AWBURST, m_axi_b2_AWLOCK, m_axi_b2_AWREGION, 
  m_axi_b2_AWCACHE, m_axi_b2_AWPROT, m_axi_b2_AWQOS, m_axi_b2_AWVALID, m_axi_b2_AWREADY, 
  m_axi_b2_WDATA, m_axi_b2_WSTRB, m_axi_b2_WLAST, m_axi_b2_WVALID, m_axi_b2_WREADY, 
  m_axi_b2_BRESP, m_axi_b2_BVALID, m_axi_b2_BREADY, m_axi_b2_ARADDR, m_axi_b2_ARLEN, 
  m_axi_b2_ARSIZE, m_axi_b2_ARBURST, m_axi_b2_ARLOCK, m_axi_b2_ARREGION, m_axi_b2_ARCACHE, 
  m_axi_b2_ARPROT, m_axi_b2_ARQOS, m_axi_b2_ARVALID, m_axi_b2_ARREADY, m_axi_b2_RDATA, 
  m_axi_b2_RRESP, m_axi_b2_RLAST, m_axi_b2_RVALID, m_axi_b2_RREADY)
/* synthesis syn_black_box black_box_pad_pin="stall_start_ext,stall_done_ext,stall_start_str,stall_done_str,stall_start_int,stall_done_int,s_axi_control_AWADDR[5:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[5:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,event_done,interrupt,event_start,m_axi_b0_AWADDR[63:0],m_axi_b0_AWLEN[7:0],m_axi_b0_AWSIZE[2:0],m_axi_b0_AWBURST[1:0],m_axi_b0_AWLOCK[1:0],m_axi_b0_AWREGION[3:0],m_axi_b0_AWCACHE[3:0],m_axi_b0_AWPROT[2:0],m_axi_b0_AWQOS[3:0],m_axi_b0_AWVALID,m_axi_b0_AWREADY,m_axi_b0_WDATA[511:0],m_axi_b0_WSTRB[63:0],m_axi_b0_WLAST,m_axi_b0_WVALID,m_axi_b0_WREADY,m_axi_b0_BRESP[1:0],m_axi_b0_BVALID,m_axi_b0_BREADY,m_axi_b0_ARADDR[63:0],m_axi_b0_ARLEN[7:0],m_axi_b0_ARSIZE[2:0],m_axi_b0_ARBURST[1:0],m_axi_b0_ARLOCK[1:0],m_axi_b0_ARREGION[3:0],m_axi_b0_ARCACHE[3:0],m_axi_b0_ARPROT[2:0],m_axi_b0_ARQOS[3:0],m_axi_b0_ARVALID,m_axi_b0_ARREADY,m_axi_b0_RDATA[511:0],m_axi_b0_RRESP[1:0],m_axi_b0_RLAST,m_axi_b0_RVALID,m_axi_b0_RREADY,m_axi_b1_AWADDR[63:0],m_axi_b1_AWLEN[7:0],m_axi_b1_AWSIZE[2:0],m_axi_b1_AWBURST[1:0],m_axi_b1_AWLOCK[1:0],m_axi_b1_AWREGION[3:0],m_axi_b1_AWCACHE[3:0],m_axi_b1_AWPROT[2:0],m_axi_b1_AWQOS[3:0],m_axi_b1_AWVALID,m_axi_b1_AWREADY,m_axi_b1_WDATA[511:0],m_axi_b1_WSTRB[63:0],m_axi_b1_WLAST,m_axi_b1_WVALID,m_axi_b1_WREADY,m_axi_b1_BRESP[1:0],m_axi_b1_BVALID,m_axi_b1_BREADY,m_axi_b1_ARADDR[63:0],m_axi_b1_ARLEN[7:0],m_axi_b1_ARSIZE[2:0],m_axi_b1_ARBURST[1:0],m_axi_b1_ARLOCK[1:0],m_axi_b1_ARREGION[3:0],m_axi_b1_ARCACHE[3:0],m_axi_b1_ARPROT[2:0],m_axi_b1_ARQOS[3:0],m_axi_b1_ARVALID,m_axi_b1_ARREADY,m_axi_b1_RDATA[511:0],m_axi_b1_RRESP[1:0],m_axi_b1_RLAST,m_axi_b1_RVALID,m_axi_b1_RREADY,m_axi_b2_AWADDR[63:0],m_axi_b2_AWLEN[7:0],m_axi_b2_AWSIZE[2:0],m_axi_b2_AWBURST[1:0],m_axi_b2_AWLOCK[1:0],m_axi_b2_AWREGION[3:0],m_axi_b2_AWCACHE[3:0],m_axi_b2_AWPROT[2:0],m_axi_b2_AWQOS[3:0],m_axi_b2_AWVALID,m_axi_b2_AWREADY,m_axi_b2_WDATA[511:0],m_axi_b2_WSTRB[63:0],m_axi_b2_WLAST,m_axi_b2_WVALID,m_axi_b2_WREADY,m_axi_b2_BRESP[1:0],m_axi_b2_BVALID,m_axi_b2_BREADY,m_axi_b2_ARADDR[63:0],m_axi_b2_ARLEN[7:0],m_axi_b2_ARSIZE[2:0],m_axi_b2_ARBURST[1:0],m_axi_b2_ARLOCK[1:0],m_axi_b2_ARREGION[3:0],m_axi_b2_ARCACHE[3:0],m_axi_b2_ARPROT[2:0],m_axi_b2_ARQOS[3:0],m_axi_b2_ARVALID,m_axi_b2_ARREADY,m_axi_b2_RDATA[511:0],m_axi_b2_RRESP[1:0],m_axi_b2_RLAST,m_axi_b2_RVALID,m_axi_b2_RREADY" */;
  output stall_start_ext;
  output stall_done_ext;
  output stall_start_str;
  output stall_done_str;
  output stall_start_int;
  output stall_done_int;
  input [5:0]s_axi_control_AWADDR;
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  output [1:0]s_axi_control_BRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  input [5:0]s_axi_control_ARADDR;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  input ap_clk;
  input ap_rst_n;
  output event_done;
  output interrupt;
  output event_start;
  output [63:0]m_axi_b0_AWADDR;
  output [7:0]m_axi_b0_AWLEN;
  output [2:0]m_axi_b0_AWSIZE;
  output [1:0]m_axi_b0_AWBURST;
  output [1:0]m_axi_b0_AWLOCK;
  output [3:0]m_axi_b0_AWREGION;
  output [3:0]m_axi_b0_AWCACHE;
  output [2:0]m_axi_b0_AWPROT;
  output [3:0]m_axi_b0_AWQOS;
  output m_axi_b0_AWVALID;
  input m_axi_b0_AWREADY;
  output [511:0]m_axi_b0_WDATA;
  output [63:0]m_axi_b0_WSTRB;
  output m_axi_b0_WLAST;
  output m_axi_b0_WVALID;
  input m_axi_b0_WREADY;
  input [1:0]m_axi_b0_BRESP;
  input m_axi_b0_BVALID;
  output m_axi_b0_BREADY;
  output [63:0]m_axi_b0_ARADDR;
  output [7:0]m_axi_b0_ARLEN;
  output [2:0]m_axi_b0_ARSIZE;
  output [1:0]m_axi_b0_ARBURST;
  output [1:0]m_axi_b0_ARLOCK;
  output [3:0]m_axi_b0_ARREGION;
  output [3:0]m_axi_b0_ARCACHE;
  output [2:0]m_axi_b0_ARPROT;
  output [3:0]m_axi_b0_ARQOS;
  output m_axi_b0_ARVALID;
  input m_axi_b0_ARREADY;
  input [511:0]m_axi_b0_RDATA;
  input [1:0]m_axi_b0_RRESP;
  input m_axi_b0_RLAST;
  input m_axi_b0_RVALID;
  output m_axi_b0_RREADY;
  output [63:0]m_axi_b1_AWADDR;
  output [7:0]m_axi_b1_AWLEN;
  output [2:0]m_axi_b1_AWSIZE;
  output [1:0]m_axi_b1_AWBURST;
  output [1:0]m_axi_b1_AWLOCK;
  output [3:0]m_axi_b1_AWREGION;
  output [3:0]m_axi_b1_AWCACHE;
  output [2:0]m_axi_b1_AWPROT;
  output [3:0]m_axi_b1_AWQOS;
  output m_axi_b1_AWVALID;
  input m_axi_b1_AWREADY;
  output [511:0]m_axi_b1_WDATA;
  output [63:0]m_axi_b1_WSTRB;
  output m_axi_b1_WLAST;
  output m_axi_b1_WVALID;
  input m_axi_b1_WREADY;
  input [1:0]m_axi_b1_BRESP;
  input m_axi_b1_BVALID;
  output m_axi_b1_BREADY;
  output [63:0]m_axi_b1_ARADDR;
  output [7:0]m_axi_b1_ARLEN;
  output [2:0]m_axi_b1_ARSIZE;
  output [1:0]m_axi_b1_ARBURST;
  output [1:0]m_axi_b1_ARLOCK;
  output [3:0]m_axi_b1_ARREGION;
  output [3:0]m_axi_b1_ARCACHE;
  output [2:0]m_axi_b1_ARPROT;
  output [3:0]m_axi_b1_ARQOS;
  output m_axi_b1_ARVALID;
  input m_axi_b1_ARREADY;
  input [511:0]m_axi_b1_RDATA;
  input [1:0]m_axi_b1_RRESP;
  input m_axi_b1_RLAST;
  input m_axi_b1_RVALID;
  output m_axi_b1_RREADY;
  output [63:0]m_axi_b2_AWADDR;
  output [7:0]m_axi_b2_AWLEN;
  output [2:0]m_axi_b2_AWSIZE;
  output [1:0]m_axi_b2_AWBURST;
  output [1:0]m_axi_b2_AWLOCK;
  output [3:0]m_axi_b2_AWREGION;
  output [3:0]m_axi_b2_AWCACHE;
  output [2:0]m_axi_b2_AWPROT;
  output [3:0]m_axi_b2_AWQOS;
  output m_axi_b2_AWVALID;
  input m_axi_b2_AWREADY;
  output [511:0]m_axi_b2_WDATA;
  output [63:0]m_axi_b2_WSTRB;
  output m_axi_b2_WLAST;
  output m_axi_b2_WVALID;
  input m_axi_b2_WREADY;
  input [1:0]m_axi_b2_BRESP;
  input m_axi_b2_BVALID;
  output m_axi_b2_BREADY;
  output [63:0]m_axi_b2_ARADDR;
  output [7:0]m_axi_b2_ARLEN;
  output [2:0]m_axi_b2_ARSIZE;
  output [1:0]m_axi_b2_ARBURST;
  output [1:0]m_axi_b2_ARLOCK;
  output [3:0]m_axi_b2_ARREGION;
  output [3:0]m_axi_b2_ARCACHE;
  output [2:0]m_axi_b2_ARPROT;
  output [3:0]m_axi_b2_ARQOS;
  output m_axi_b2_ARVALID;
  input m_axi_b2_ARREADY;
  input [511:0]m_axi_b2_RDATA;
  input [1:0]m_axi_b2_RRESP;
  input m_axi_b2_RLAST;
  input m_axi_b2_RVALID;
  output m_axi_b2_RREADY;
endmodule
