// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:mmult_fpga:1.0
// IP Revision: 2113781316

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module u96v2_sbc_base_mmult_fpga_1_0 (
  stall_start_ext,
  stall_done_ext,
  stall_start_str,
  stall_done_str,
  stall_start_int,
  stall_done_int,
  s_axi_control_AWADDR,
  s_axi_control_AWVALID,
  s_axi_control_AWREADY,
  s_axi_control_WDATA,
  s_axi_control_WSTRB,
  s_axi_control_WVALID,
  s_axi_control_WREADY,
  s_axi_control_BRESP,
  s_axi_control_BVALID,
  s_axi_control_BREADY,
  s_axi_control_ARADDR,
  s_axi_control_ARVALID,
  s_axi_control_ARREADY,
  s_axi_control_RDATA,
  s_axi_control_RRESP,
  s_axi_control_RVALID,
  s_axi_control_RREADY,
  ap_clk,
  ap_rst_n,
  event_done,
  interrupt,
  event_start,
  m_axi_b0_AWADDR,
  m_axi_b0_AWLEN,
  m_axi_b0_AWSIZE,
  m_axi_b0_AWBURST,
  m_axi_b0_AWLOCK,
  m_axi_b0_AWREGION,
  m_axi_b0_AWCACHE,
  m_axi_b0_AWPROT,
  m_axi_b0_AWQOS,
  m_axi_b0_AWVALID,
  m_axi_b0_AWREADY,
  m_axi_b0_WDATA,
  m_axi_b0_WSTRB,
  m_axi_b0_WLAST,
  m_axi_b0_WVALID,
  m_axi_b0_WREADY,
  m_axi_b0_BRESP,
  m_axi_b0_BVALID,
  m_axi_b0_BREADY,
  m_axi_b0_ARADDR,
  m_axi_b0_ARLEN,
  m_axi_b0_ARSIZE,
  m_axi_b0_ARBURST,
  m_axi_b0_ARLOCK,
  m_axi_b0_ARREGION,
  m_axi_b0_ARCACHE,
  m_axi_b0_ARPROT,
  m_axi_b0_ARQOS,
  m_axi_b0_ARVALID,
  m_axi_b0_ARREADY,
  m_axi_b0_RDATA,
  m_axi_b0_RRESP,
  m_axi_b0_RLAST,
  m_axi_b0_RVALID,
  m_axi_b0_RREADY,
  m_axi_b1_AWADDR,
  m_axi_b1_AWLEN,
  m_axi_b1_AWSIZE,
  m_axi_b1_AWBURST,
  m_axi_b1_AWLOCK,
  m_axi_b1_AWREGION,
  m_axi_b1_AWCACHE,
  m_axi_b1_AWPROT,
  m_axi_b1_AWQOS,
  m_axi_b1_AWVALID,
  m_axi_b1_AWREADY,
  m_axi_b1_WDATA,
  m_axi_b1_WSTRB,
  m_axi_b1_WLAST,
  m_axi_b1_WVALID,
  m_axi_b1_WREADY,
  m_axi_b1_BRESP,
  m_axi_b1_BVALID,
  m_axi_b1_BREADY,
  m_axi_b1_ARADDR,
  m_axi_b1_ARLEN,
  m_axi_b1_ARSIZE,
  m_axi_b1_ARBURST,
  m_axi_b1_ARLOCK,
  m_axi_b1_ARREGION,
  m_axi_b1_ARCACHE,
  m_axi_b1_ARPROT,
  m_axi_b1_ARQOS,
  m_axi_b1_ARVALID,
  m_axi_b1_ARREADY,
  m_axi_b1_RDATA,
  m_axi_b1_RRESP,
  m_axi_b1_RLAST,
  m_axi_b1_RVALID,
  m_axi_b1_RREADY,
  m_axi_b2_AWADDR,
  m_axi_b2_AWLEN,
  m_axi_b2_AWSIZE,
  m_axi_b2_AWBURST,
  m_axi_b2_AWLOCK,
  m_axi_b2_AWREGION,
  m_axi_b2_AWCACHE,
  m_axi_b2_AWPROT,
  m_axi_b2_AWQOS,
  m_axi_b2_AWVALID,
  m_axi_b2_AWREADY,
  m_axi_b2_WDATA,
  m_axi_b2_WSTRB,
  m_axi_b2_WLAST,
  m_axi_b2_WVALID,
  m_axi_b2_WREADY,
  m_axi_b2_BRESP,
  m_axi_b2_BVALID,
  m_axi_b2_BREADY,
  m_axi_b2_ARADDR,
  m_axi_b2_ARLEN,
  m_axi_b2_ARSIZE,
  m_axi_b2_ARBURST,
  m_axi_b2_ARLOCK,
  m_axi_b2_ARREGION,
  m_axi_b2_ARCACHE,
  m_axi_b2_ARPROT,
  m_axi_b2_ARQOS,
  m_axi_b2_ARVALID,
  m_axi_b2_ARREADY,
  m_axi_b2_RDATA,
  m_axi_b2_RRESP,
  m_axi_b2_RLAST,
  m_axi_b2_RVALID,
  m_axi_b2_RREADY
);

output wire stall_start_ext;
output wire stall_done_ext;
output wire stall_start_str;
output wire stall_done_str;
output wire stall_start_int;
output wire stall_done_int;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *)
input wire [5 : 0] s_axi_control_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *)
input wire s_axi_control_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *)
output wire s_axi_control_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *)
input wire [31 : 0] s_axi_control_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *)
input wire [3 : 0] s_axi_control_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *)
input wire s_axi_control_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *)
output wire s_axi_control_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *)
output wire [1 : 0] s_axi_control_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *)
output wire s_axi_control_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *)
input wire s_axi_control_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *)
input wire [5 : 0] s_axi_control_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *)
input wire s_axi_control_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *)
output wire s_axi_control_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *)
output wire [31 : 0] s_axi_control_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *)
output wire [1 : 0] s_axi_control_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *)
output wire s_axi_control_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 150000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN u96v2_sbc_base_clk_wiz_0_0_clk_out1, NUM_READ_THREADS\
 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *)
input wire s_axi_control_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_b0:m_axi_b1:m_axi_b2, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN u96v2_sbc_base_clk_wiz_0_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME event_done, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 event_done DATA" *)
output wire event_done;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME event_start, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 event_start DATA" *)
output wire event_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWADDR" *)
output wire [63 : 0] m_axi_b0_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWLEN" *)
output wire [7 : 0] m_axi_b0_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWSIZE" *)
output wire [2 : 0] m_axi_b0_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWBURST" *)
output wire [1 : 0] m_axi_b0_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWLOCK" *)
output wire [1 : 0] m_axi_b0_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWREGION" *)
output wire [3 : 0] m_axi_b0_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWCACHE" *)
output wire [3 : 0] m_axi_b0_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWPROT" *)
output wire [2 : 0] m_axi_b0_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWQOS" *)
output wire [3 : 0] m_axi_b0_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWVALID" *)
output wire m_axi_b0_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 AWREADY" *)
input wire m_axi_b0_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 WDATA" *)
output wire [511 : 0] m_axi_b0_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 WSTRB" *)
output wire [63 : 0] m_axi_b0_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 WLAST" *)
output wire m_axi_b0_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 WVALID" *)
output wire m_axi_b0_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 WREADY" *)
input wire m_axi_b0_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 BRESP" *)
input wire [1 : 0] m_axi_b0_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 BVALID" *)
input wire m_axi_b0_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 BREADY" *)
output wire m_axi_b0_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARADDR" *)
output wire [63 : 0] m_axi_b0_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARLEN" *)
output wire [7 : 0] m_axi_b0_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARSIZE" *)
output wire [2 : 0] m_axi_b0_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARBURST" *)
output wire [1 : 0] m_axi_b0_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARLOCK" *)
output wire [1 : 0] m_axi_b0_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARREGION" *)
output wire [3 : 0] m_axi_b0_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARCACHE" *)
output wire [3 : 0] m_axi_b0_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARPROT" *)
output wire [2 : 0] m_axi_b0_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARQOS" *)
output wire [3 : 0] m_axi_b0_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARVALID" *)
output wire m_axi_b0_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 ARREADY" *)
input wire m_axi_b0_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 RDATA" *)
input wire [511 : 0] m_axi_b0_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 RRESP" *)
input wire [1 : 0] m_axi_b0_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 RLAST" *)
input wire m_axi_b0_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 RVALID" *)
input wire m_axi_b0_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_b0, ADDR_WIDTH 64, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 512, FREQ_HZ 150000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN u96\
v2_sbc_base_clk_wiz_0_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b0 RREADY" *)
output wire m_axi_b0_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWADDR" *)
output wire [63 : 0] m_axi_b1_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWLEN" *)
output wire [7 : 0] m_axi_b1_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWSIZE" *)
output wire [2 : 0] m_axi_b1_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWBURST" *)
output wire [1 : 0] m_axi_b1_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWLOCK" *)
output wire [1 : 0] m_axi_b1_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWREGION" *)
output wire [3 : 0] m_axi_b1_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWCACHE" *)
output wire [3 : 0] m_axi_b1_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWPROT" *)
output wire [2 : 0] m_axi_b1_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWQOS" *)
output wire [3 : 0] m_axi_b1_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWVALID" *)
output wire m_axi_b1_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 AWREADY" *)
input wire m_axi_b1_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 WDATA" *)
output wire [511 : 0] m_axi_b1_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 WSTRB" *)
output wire [63 : 0] m_axi_b1_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 WLAST" *)
output wire m_axi_b1_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 WVALID" *)
output wire m_axi_b1_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 WREADY" *)
input wire m_axi_b1_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 BRESP" *)
input wire [1 : 0] m_axi_b1_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 BVALID" *)
input wire m_axi_b1_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 BREADY" *)
output wire m_axi_b1_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARADDR" *)
output wire [63 : 0] m_axi_b1_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARLEN" *)
output wire [7 : 0] m_axi_b1_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARSIZE" *)
output wire [2 : 0] m_axi_b1_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARBURST" *)
output wire [1 : 0] m_axi_b1_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARLOCK" *)
output wire [1 : 0] m_axi_b1_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARREGION" *)
output wire [3 : 0] m_axi_b1_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARCACHE" *)
output wire [3 : 0] m_axi_b1_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARPROT" *)
output wire [2 : 0] m_axi_b1_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARQOS" *)
output wire [3 : 0] m_axi_b1_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARVALID" *)
output wire m_axi_b1_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 ARREADY" *)
input wire m_axi_b1_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 RDATA" *)
input wire [511 : 0] m_axi_b1_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 RRESP" *)
input wire [1 : 0] m_axi_b1_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 RLAST" *)
input wire m_axi_b1_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 RVALID" *)
input wire m_axi_b1_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_b1, ADDR_WIDTH 64, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 512, FREQ_HZ 150000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN u96\
v2_sbc_base_clk_wiz_0_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b1 RREADY" *)
output wire m_axi_b1_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWADDR" *)
output wire [63 : 0] m_axi_b2_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWLEN" *)
output wire [7 : 0] m_axi_b2_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWSIZE" *)
output wire [2 : 0] m_axi_b2_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWBURST" *)
output wire [1 : 0] m_axi_b2_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWLOCK" *)
output wire [1 : 0] m_axi_b2_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWREGION" *)
output wire [3 : 0] m_axi_b2_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWCACHE" *)
output wire [3 : 0] m_axi_b2_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWPROT" *)
output wire [2 : 0] m_axi_b2_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWQOS" *)
output wire [3 : 0] m_axi_b2_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWVALID" *)
output wire m_axi_b2_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 AWREADY" *)
input wire m_axi_b2_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 WDATA" *)
output wire [511 : 0] m_axi_b2_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 WSTRB" *)
output wire [63 : 0] m_axi_b2_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 WLAST" *)
output wire m_axi_b2_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 WVALID" *)
output wire m_axi_b2_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 WREADY" *)
input wire m_axi_b2_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 BRESP" *)
input wire [1 : 0] m_axi_b2_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 BVALID" *)
input wire m_axi_b2_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 BREADY" *)
output wire m_axi_b2_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARADDR" *)
output wire [63 : 0] m_axi_b2_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARLEN" *)
output wire [7 : 0] m_axi_b2_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARSIZE" *)
output wire [2 : 0] m_axi_b2_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARBURST" *)
output wire [1 : 0] m_axi_b2_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARLOCK" *)
output wire [1 : 0] m_axi_b2_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARREGION" *)
output wire [3 : 0] m_axi_b2_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARCACHE" *)
output wire [3 : 0] m_axi_b2_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARPROT" *)
output wire [2 : 0] m_axi_b2_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARQOS" *)
output wire [3 : 0] m_axi_b2_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARVALID" *)
output wire m_axi_b2_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 ARREADY" *)
input wire m_axi_b2_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 RDATA" *)
input wire [511 : 0] m_axi_b2_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 RRESP" *)
input wire [1 : 0] m_axi_b2_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 RLAST" *)
input wire m_axi_b2_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 RVALID" *)
input wire m_axi_b2_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_b2, ADDR_WIDTH 64, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 512, FREQ_HZ 150000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN u96\
v2_sbc_base_clk_wiz_0_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_b2 RREADY" *)
output wire m_axi_b2_RREADY;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SIM_INST = "" *)
  mmult_fpga #(
    .C_S_AXI_CONTROL_ADDR_WIDTH(6),
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_M_AXI_B0_ID_WIDTH(1),
    .C_M_AXI_B0_ADDR_WIDTH(64),
    .C_M_AXI_B0_DATA_WIDTH(512),
    .C_M_AXI_B0_AWUSER_WIDTH(1),
    .C_M_AXI_B0_ARUSER_WIDTH(1),
    .C_M_AXI_B0_WUSER_WIDTH(1),
    .C_M_AXI_B0_RUSER_WIDTH(1),
    .C_M_AXI_B0_BUSER_WIDTH(1),
    .C_M_AXI_B0_USER_VALUE(32'H00000000),
    .C_M_AXI_B0_PROT_VALUE(3'B000),
    .C_M_AXI_B0_CACHE_VALUE(4'B0011),
    .C_M_AXI_B1_ID_WIDTH(1),
    .C_M_AXI_B1_ADDR_WIDTH(64),
    .C_M_AXI_B1_DATA_WIDTH(512),
    .C_M_AXI_B1_AWUSER_WIDTH(1),
    .C_M_AXI_B1_ARUSER_WIDTH(1),
    .C_M_AXI_B1_WUSER_WIDTH(1),
    .C_M_AXI_B1_RUSER_WIDTH(1),
    .C_M_AXI_B1_BUSER_WIDTH(1),
    .C_M_AXI_B1_USER_VALUE(32'H00000000),
    .C_M_AXI_B1_PROT_VALUE(3'B000),
    .C_M_AXI_B1_CACHE_VALUE(4'B0011),
    .C_M_AXI_B2_ID_WIDTH(1),
    .C_M_AXI_B2_ADDR_WIDTH(64),
    .C_M_AXI_B2_DATA_WIDTH(512),
    .C_M_AXI_B2_AWUSER_WIDTH(1),
    .C_M_AXI_B2_ARUSER_WIDTH(1),
    .C_M_AXI_B2_WUSER_WIDTH(1),
    .C_M_AXI_B2_RUSER_WIDTH(1),
    .C_M_AXI_B2_BUSER_WIDTH(1),
    .C_M_AXI_B2_USER_VALUE(32'H00000000),
    .C_M_AXI_B2_PROT_VALUE(3'B000),
    .C_M_AXI_B2_CACHE_VALUE(4'B0011)
  ) inst (
    .stall_start_ext(stall_start_ext),
    .stall_done_ext(stall_done_ext),
    .stall_start_str(stall_start_str),
    .stall_done_str(stall_done_str),
    .stall_start_int(stall_start_int),
    .stall_done_int(stall_done_int),
    .s_axi_control_AWADDR(s_axi_control_AWADDR),
    .s_axi_control_AWVALID(s_axi_control_AWVALID),
    .s_axi_control_AWREADY(s_axi_control_AWREADY),
    .s_axi_control_WDATA(s_axi_control_WDATA),
    .s_axi_control_WSTRB(s_axi_control_WSTRB),
    .s_axi_control_WVALID(s_axi_control_WVALID),
    .s_axi_control_WREADY(s_axi_control_WREADY),
    .s_axi_control_BRESP(s_axi_control_BRESP),
    .s_axi_control_BVALID(s_axi_control_BVALID),
    .s_axi_control_BREADY(s_axi_control_BREADY),
    .s_axi_control_ARADDR(s_axi_control_ARADDR),
    .s_axi_control_ARVALID(s_axi_control_ARVALID),
    .s_axi_control_ARREADY(s_axi_control_ARREADY),
    .s_axi_control_RDATA(s_axi_control_RDATA),
    .s_axi_control_RRESP(s_axi_control_RRESP),
    .s_axi_control_RVALID(s_axi_control_RVALID),
    .s_axi_control_RREADY(s_axi_control_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .event_done(event_done),
    .interrupt(interrupt),
    .event_start(event_start),
    .m_axi_b0_AWID(),
    .m_axi_b0_AWADDR(m_axi_b0_AWADDR),
    .m_axi_b0_AWLEN(m_axi_b0_AWLEN),
    .m_axi_b0_AWSIZE(m_axi_b0_AWSIZE),
    .m_axi_b0_AWBURST(m_axi_b0_AWBURST),
    .m_axi_b0_AWLOCK(m_axi_b0_AWLOCK),
    .m_axi_b0_AWREGION(m_axi_b0_AWREGION),
    .m_axi_b0_AWCACHE(m_axi_b0_AWCACHE),
    .m_axi_b0_AWPROT(m_axi_b0_AWPROT),
    .m_axi_b0_AWQOS(m_axi_b0_AWQOS),
    .m_axi_b0_AWUSER(),
    .m_axi_b0_AWVALID(m_axi_b0_AWVALID),
    .m_axi_b0_AWREADY(m_axi_b0_AWREADY),
    .m_axi_b0_WID(),
    .m_axi_b0_WDATA(m_axi_b0_WDATA),
    .m_axi_b0_WSTRB(m_axi_b0_WSTRB),
    .m_axi_b0_WLAST(m_axi_b0_WLAST),
    .m_axi_b0_WUSER(),
    .m_axi_b0_WVALID(m_axi_b0_WVALID),
    .m_axi_b0_WREADY(m_axi_b0_WREADY),
    .m_axi_b0_BID(1'B0),
    .m_axi_b0_BRESP(m_axi_b0_BRESP),
    .m_axi_b0_BUSER(1'B0),
    .m_axi_b0_BVALID(m_axi_b0_BVALID),
    .m_axi_b0_BREADY(m_axi_b0_BREADY),
    .m_axi_b0_ARID(),
    .m_axi_b0_ARADDR(m_axi_b0_ARADDR),
    .m_axi_b0_ARLEN(m_axi_b0_ARLEN),
    .m_axi_b0_ARSIZE(m_axi_b0_ARSIZE),
    .m_axi_b0_ARBURST(m_axi_b0_ARBURST),
    .m_axi_b0_ARLOCK(m_axi_b0_ARLOCK),
    .m_axi_b0_ARREGION(m_axi_b0_ARREGION),
    .m_axi_b0_ARCACHE(m_axi_b0_ARCACHE),
    .m_axi_b0_ARPROT(m_axi_b0_ARPROT),
    .m_axi_b0_ARQOS(m_axi_b0_ARQOS),
    .m_axi_b0_ARUSER(),
    .m_axi_b0_ARVALID(m_axi_b0_ARVALID),
    .m_axi_b0_ARREADY(m_axi_b0_ARREADY),
    .m_axi_b0_RID(1'B0),
    .m_axi_b0_RDATA(m_axi_b0_RDATA),
    .m_axi_b0_RRESP(m_axi_b0_RRESP),
    .m_axi_b0_RLAST(m_axi_b0_RLAST),
    .m_axi_b0_RUSER(1'B0),
    .m_axi_b0_RVALID(m_axi_b0_RVALID),
    .m_axi_b0_RREADY(m_axi_b0_RREADY),
    .m_axi_b1_AWID(),
    .m_axi_b1_AWADDR(m_axi_b1_AWADDR),
    .m_axi_b1_AWLEN(m_axi_b1_AWLEN),
    .m_axi_b1_AWSIZE(m_axi_b1_AWSIZE),
    .m_axi_b1_AWBURST(m_axi_b1_AWBURST),
    .m_axi_b1_AWLOCK(m_axi_b1_AWLOCK),
    .m_axi_b1_AWREGION(m_axi_b1_AWREGION),
    .m_axi_b1_AWCACHE(m_axi_b1_AWCACHE),
    .m_axi_b1_AWPROT(m_axi_b1_AWPROT),
    .m_axi_b1_AWQOS(m_axi_b1_AWQOS),
    .m_axi_b1_AWUSER(),
    .m_axi_b1_AWVALID(m_axi_b1_AWVALID),
    .m_axi_b1_AWREADY(m_axi_b1_AWREADY),
    .m_axi_b1_WID(),
    .m_axi_b1_WDATA(m_axi_b1_WDATA),
    .m_axi_b1_WSTRB(m_axi_b1_WSTRB),
    .m_axi_b1_WLAST(m_axi_b1_WLAST),
    .m_axi_b1_WUSER(),
    .m_axi_b1_WVALID(m_axi_b1_WVALID),
    .m_axi_b1_WREADY(m_axi_b1_WREADY),
    .m_axi_b1_BID(1'B0),
    .m_axi_b1_BRESP(m_axi_b1_BRESP),
    .m_axi_b1_BUSER(1'B0),
    .m_axi_b1_BVALID(m_axi_b1_BVALID),
    .m_axi_b1_BREADY(m_axi_b1_BREADY),
    .m_axi_b1_ARID(),
    .m_axi_b1_ARADDR(m_axi_b1_ARADDR),
    .m_axi_b1_ARLEN(m_axi_b1_ARLEN),
    .m_axi_b1_ARSIZE(m_axi_b1_ARSIZE),
    .m_axi_b1_ARBURST(m_axi_b1_ARBURST),
    .m_axi_b1_ARLOCK(m_axi_b1_ARLOCK),
    .m_axi_b1_ARREGION(m_axi_b1_ARREGION),
    .m_axi_b1_ARCACHE(m_axi_b1_ARCACHE),
    .m_axi_b1_ARPROT(m_axi_b1_ARPROT),
    .m_axi_b1_ARQOS(m_axi_b1_ARQOS),
    .m_axi_b1_ARUSER(),
    .m_axi_b1_ARVALID(m_axi_b1_ARVALID),
    .m_axi_b1_ARREADY(m_axi_b1_ARREADY),
    .m_axi_b1_RID(1'B0),
    .m_axi_b1_RDATA(m_axi_b1_RDATA),
    .m_axi_b1_RRESP(m_axi_b1_RRESP),
    .m_axi_b1_RLAST(m_axi_b1_RLAST),
    .m_axi_b1_RUSER(1'B0),
    .m_axi_b1_RVALID(m_axi_b1_RVALID),
    .m_axi_b1_RREADY(m_axi_b1_RREADY),
    .m_axi_b2_AWID(),
    .m_axi_b2_AWADDR(m_axi_b2_AWADDR),
    .m_axi_b2_AWLEN(m_axi_b2_AWLEN),
    .m_axi_b2_AWSIZE(m_axi_b2_AWSIZE),
    .m_axi_b2_AWBURST(m_axi_b2_AWBURST),
    .m_axi_b2_AWLOCK(m_axi_b2_AWLOCK),
    .m_axi_b2_AWREGION(m_axi_b2_AWREGION),
    .m_axi_b2_AWCACHE(m_axi_b2_AWCACHE),
    .m_axi_b2_AWPROT(m_axi_b2_AWPROT),
    .m_axi_b2_AWQOS(m_axi_b2_AWQOS),
    .m_axi_b2_AWUSER(),
    .m_axi_b2_AWVALID(m_axi_b2_AWVALID),
    .m_axi_b2_AWREADY(m_axi_b2_AWREADY),
    .m_axi_b2_WID(),
    .m_axi_b2_WDATA(m_axi_b2_WDATA),
    .m_axi_b2_WSTRB(m_axi_b2_WSTRB),
    .m_axi_b2_WLAST(m_axi_b2_WLAST),
    .m_axi_b2_WUSER(),
    .m_axi_b2_WVALID(m_axi_b2_WVALID),
    .m_axi_b2_WREADY(m_axi_b2_WREADY),
    .m_axi_b2_BID(1'B0),
    .m_axi_b2_BRESP(m_axi_b2_BRESP),
    .m_axi_b2_BUSER(1'B0),
    .m_axi_b2_BVALID(m_axi_b2_BVALID),
    .m_axi_b2_BREADY(m_axi_b2_BREADY),
    .m_axi_b2_ARID(),
    .m_axi_b2_ARADDR(m_axi_b2_ARADDR),
    .m_axi_b2_ARLEN(m_axi_b2_ARLEN),
    .m_axi_b2_ARSIZE(m_axi_b2_ARSIZE),
    .m_axi_b2_ARBURST(m_axi_b2_ARBURST),
    .m_axi_b2_ARLOCK(m_axi_b2_ARLOCK),
    .m_axi_b2_ARREGION(m_axi_b2_ARREGION),
    .m_axi_b2_ARCACHE(m_axi_b2_ARCACHE),
    .m_axi_b2_ARPROT(m_axi_b2_ARPROT),
    .m_axi_b2_ARQOS(m_axi_b2_ARQOS),
    .m_axi_b2_ARUSER(),
    .m_axi_b2_ARVALID(m_axi_b2_ARVALID),
    .m_axi_b2_ARREADY(m_axi_b2_ARREADY),
    .m_axi_b2_RID(1'B0),
    .m_axi_b2_RDATA(m_axi_b2_RDATA),
    .m_axi_b2_RRESP(m_axi_b2_RRESP),
    .m_axi_b2_RLAST(m_axi_b2_RLAST),
    .m_axi_b2_RUSER(1'B0),
    .m_axi_b2_RVALID(m_axi_b2_RVALID),
    .m_axi_b2_RREADY(m_axi_b2_RREADY)
  );
endmodule
