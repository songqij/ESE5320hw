-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:mmult_fpga:1.0
-- IP Revision: 2113781316

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY u96v2_sbc_base_mmult_fpga_1_0 IS
  PORT (
    stall_start_ext : OUT STD_LOGIC;
    stall_done_ext : OUT STD_LOGIC;
    stall_start_str : OUT STD_LOGIC;
    stall_done_str : OUT STD_LOGIC;
    stall_start_int : OUT STD_LOGIC;
    stall_done_int : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    event_done : OUT STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    event_start : OUT STD_LOGIC;
    m_axi_b0_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_b0_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_b0_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b0_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b0_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b0_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b0_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b0_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b0_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b0_AWVALID : OUT STD_LOGIC;
    m_axi_b0_AWREADY : IN STD_LOGIC;
    m_axi_b0_WDATA : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    m_axi_b0_WSTRB : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_b0_WLAST : OUT STD_LOGIC;
    m_axi_b0_WVALID : OUT STD_LOGIC;
    m_axi_b0_WREADY : IN STD_LOGIC;
    m_axi_b0_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b0_BVALID : IN STD_LOGIC;
    m_axi_b0_BREADY : OUT STD_LOGIC;
    m_axi_b0_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_b0_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_b0_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b0_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b0_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b0_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b0_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b0_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b0_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b0_ARVALID : OUT STD_LOGIC;
    m_axi_b0_ARREADY : IN STD_LOGIC;
    m_axi_b0_RDATA : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    m_axi_b0_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b0_RLAST : IN STD_LOGIC;
    m_axi_b0_RVALID : IN STD_LOGIC;
    m_axi_b0_RREADY : OUT STD_LOGIC;
    m_axi_b1_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_b1_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_b1_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b1_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b1_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b1_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b1_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b1_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b1_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b1_AWVALID : OUT STD_LOGIC;
    m_axi_b1_AWREADY : IN STD_LOGIC;
    m_axi_b1_WDATA : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    m_axi_b1_WSTRB : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_b1_WLAST : OUT STD_LOGIC;
    m_axi_b1_WVALID : OUT STD_LOGIC;
    m_axi_b1_WREADY : IN STD_LOGIC;
    m_axi_b1_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b1_BVALID : IN STD_LOGIC;
    m_axi_b1_BREADY : OUT STD_LOGIC;
    m_axi_b1_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_b1_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_b1_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b1_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b1_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b1_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b1_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b1_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b1_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b1_ARVALID : OUT STD_LOGIC;
    m_axi_b1_ARREADY : IN STD_LOGIC;
    m_axi_b1_RDATA : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    m_axi_b1_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b1_RLAST : IN STD_LOGIC;
    m_axi_b1_RVALID : IN STD_LOGIC;
    m_axi_b1_RREADY : OUT STD_LOGIC;
    m_axi_b2_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_b2_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_b2_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b2_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b2_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b2_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b2_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b2_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b2_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b2_AWVALID : OUT STD_LOGIC;
    m_axi_b2_AWREADY : IN STD_LOGIC;
    m_axi_b2_WDATA : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    m_axi_b2_WSTRB : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_b2_WLAST : OUT STD_LOGIC;
    m_axi_b2_WVALID : OUT STD_LOGIC;
    m_axi_b2_WREADY : IN STD_LOGIC;
    m_axi_b2_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b2_BVALID : IN STD_LOGIC;
    m_axi_b2_BREADY : OUT STD_LOGIC;
    m_axi_b2_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_b2_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_b2_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b2_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b2_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b2_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b2_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b2_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_b2_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_b2_ARVALID : OUT STD_LOGIC;
    m_axi_b2_ARREADY : IN STD_LOGIC;
    m_axi_b2_RDATA : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    m_axi_b2_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_b2_RLAST : IN STD_LOGIC;
    m_axi_b2_RVALID : IN STD_LOGIC;
    m_axi_b2_RREADY : OUT STD_LOGIC
  );
END u96v2_sbc_base_mmult_fpga_1_0;

ARCHITECTURE u96v2_sbc_base_mmult_fpga_1_0_arch OF u96v2_sbc_base_mmult_fpga_1_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF u96v2_sbc_base_mmult_fpga_1_0_arch: ARCHITECTURE IS "yes";
  COMPONENT mmult_fpga IS
    GENERIC (
      C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER;
      C_S_AXI_CONTROL_DATA_WIDTH : INTEGER;
      C_M_AXI_B0_ID_WIDTH : INTEGER;
      C_M_AXI_B0_ADDR_WIDTH : INTEGER;
      C_M_AXI_B0_DATA_WIDTH : INTEGER;
      C_M_AXI_B0_AWUSER_WIDTH : INTEGER;
      C_M_AXI_B0_ARUSER_WIDTH : INTEGER;
      C_M_AXI_B0_WUSER_WIDTH : INTEGER;
      C_M_AXI_B0_RUSER_WIDTH : INTEGER;
      C_M_AXI_B0_BUSER_WIDTH : INTEGER;
      C_M_AXI_B0_USER_VALUE : INTEGER;
      C_M_AXI_B0_PROT_VALUE : INTEGER;
      C_M_AXI_B0_CACHE_VALUE : INTEGER;
      C_M_AXI_B1_ID_WIDTH : INTEGER;
      C_M_AXI_B1_ADDR_WIDTH : INTEGER;
      C_M_AXI_B1_DATA_WIDTH : INTEGER;
      C_M_AXI_B1_AWUSER_WIDTH : INTEGER;
      C_M_AXI_B1_ARUSER_WIDTH : INTEGER;
      C_M_AXI_B1_WUSER_WIDTH : INTEGER;
      C_M_AXI_B1_RUSER_WIDTH : INTEGER;
      C_M_AXI_B1_BUSER_WIDTH : INTEGER;
      C_M_AXI_B1_USER_VALUE : INTEGER;
      C_M_AXI_B1_PROT_VALUE : INTEGER;
      C_M_AXI_B1_CACHE_VALUE : INTEGER;
      C_M_AXI_B2_ID_WIDTH : INTEGER;
      C_M_AXI_B2_ADDR_WIDTH : INTEGER;
      C_M_AXI_B2_DATA_WIDTH : INTEGER;
      C_M_AXI_B2_AWUSER_WIDTH : INTEGER;
      C_M_AXI_B2_ARUSER_WIDTH : INTEGER;
      C_M_AXI_B2_WUSER_WIDTH : INTEGER;
      C_M_AXI_B2_RUSER_WIDTH : INTEGER;
      C_M_AXI_B2_BUSER_WIDTH : INTEGER;
      C_M_AXI_B2_USER_VALUE : INTEGER;
      C_M_AXI_B2_PROT_VALUE : INTEGER;
      C_M_AXI_B2_CACHE_VALUE : INTEGER
    );
    PORT (
      stall_start_ext : OUT STD_LOGIC;
      stall_done_ext : OUT STD_LOGIC;
      stall_start_str : OUT STD_LOGIC;
      stall_done_str : OUT STD_LOGIC;
      stall_start_int : OUT STD_LOGIC;
      stall_done_int : OUT STD_LOGIC;
      s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      s_axi_control_AWVALID : IN STD_LOGIC;
      s_axi_control_AWREADY : OUT STD_LOGIC;
      s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_control_WVALID : IN STD_LOGIC;
      s_axi_control_WREADY : OUT STD_LOGIC;
      s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_BVALID : OUT STD_LOGIC;
      s_axi_control_BREADY : IN STD_LOGIC;
      s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      s_axi_control_ARVALID : IN STD_LOGIC;
      s_axi_control_ARREADY : OUT STD_LOGIC;
      s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_RVALID : OUT STD_LOGIC;
      s_axi_control_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      event_done : OUT STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      event_start : OUT STD_LOGIC;
      m_axi_b0_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_b0_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_b0_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b0_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b0_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b0_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b0_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b0_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b0_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b0_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_AWVALID : OUT STD_LOGIC;
      m_axi_b0_AWREADY : IN STD_LOGIC;
      m_axi_b0_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_WDATA : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
      m_axi_b0_WSTRB : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_b0_WLAST : OUT STD_LOGIC;
      m_axi_b0_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_WVALID : OUT STD_LOGIC;
      m_axi_b0_WREADY : IN STD_LOGIC;
      m_axi_b0_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b0_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_BVALID : IN STD_LOGIC;
      m_axi_b0_BREADY : OUT STD_LOGIC;
      m_axi_b0_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_b0_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_b0_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b0_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b0_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b0_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b0_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b0_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b0_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b0_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_ARVALID : OUT STD_LOGIC;
      m_axi_b0_ARREADY : IN STD_LOGIC;
      m_axi_b0_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_RDATA : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      m_axi_b0_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b0_RLAST : IN STD_LOGIC;
      m_axi_b0_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b0_RVALID : IN STD_LOGIC;
      m_axi_b0_RREADY : OUT STD_LOGIC;
      m_axi_b1_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_b1_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_b1_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b1_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b1_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b1_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b1_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b1_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b1_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b1_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_AWVALID : OUT STD_LOGIC;
      m_axi_b1_AWREADY : IN STD_LOGIC;
      m_axi_b1_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_WDATA : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
      m_axi_b1_WSTRB : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_b1_WLAST : OUT STD_LOGIC;
      m_axi_b1_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_WVALID : OUT STD_LOGIC;
      m_axi_b1_WREADY : IN STD_LOGIC;
      m_axi_b1_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b1_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_BVALID : IN STD_LOGIC;
      m_axi_b1_BREADY : OUT STD_LOGIC;
      m_axi_b1_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_b1_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_b1_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b1_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b1_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b1_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b1_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b1_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b1_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b1_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_ARVALID : OUT STD_LOGIC;
      m_axi_b1_ARREADY : IN STD_LOGIC;
      m_axi_b1_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_RDATA : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      m_axi_b1_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b1_RLAST : IN STD_LOGIC;
      m_axi_b1_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b1_RVALID : IN STD_LOGIC;
      m_axi_b1_RREADY : OUT STD_LOGIC;
      m_axi_b2_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_b2_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_b2_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b2_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b2_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b2_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b2_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b2_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b2_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b2_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_AWVALID : OUT STD_LOGIC;
      m_axi_b2_AWREADY : IN STD_LOGIC;
      m_axi_b2_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_WDATA : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
      m_axi_b2_WSTRB : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_b2_WLAST : OUT STD_LOGIC;
      m_axi_b2_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_WVALID : OUT STD_LOGIC;
      m_axi_b2_WREADY : IN STD_LOGIC;
      m_axi_b2_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b2_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_BVALID : IN STD_LOGIC;
      m_axi_b2_BREADY : OUT STD_LOGIC;
      m_axi_b2_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_b2_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_b2_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b2_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b2_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b2_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b2_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b2_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_b2_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_b2_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_ARVALID : OUT STD_LOGIC;
      m_axi_b2_ARREADY : IN STD_LOGIC;
      m_axi_b2_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_RDATA : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      m_axi_b2_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_b2_RLAST : IN STD_LOGIC;
      m_axi_b2_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_b2_RVALID : IN STD_LOGIC;
      m_axi_b2_RREADY : OUT STD_LOGIC
    );
  END COMPONENT mmult_fpga;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF u96v2_sbc_base_mmult_fpga_1_0_arch: ARCHITECTURE IS "mmult_fpga,Vivado 2020.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF u96v2_sbc_base_mmult_fpga_1_0_arch : ARCHITECTURE IS "u96v2_sbc_base_mmult_fpga_1_0,mmult_fpga,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF u96v2_sbc_base_mmult_fpga_1_0_arch: ARCHITECTURE IS "u96v2_sbc_base_mmult_fpga_1_0,mmult_fpga,{x_ipProduct=Vivado 2020.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=mmult_fpga,x_ipVersion=1.0,x_ipCoreRevision=2113781316,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_S_AXI_CONTROL_ADDR_WIDTH=6,C_S_AXI_CONTROL_DATA_WIDTH=32,C_M_AXI_B0_ID_WIDTH=1,C_M_AXI_B0_ADDR_WIDTH=64,C_M_AXI_B0_DATA_WIDTH=512,C_M_AXI_B0_AWUSER_WIDTH=1,C_M_AXI_B0_ARUSER_WIDTH=1,C_M_AXI_B0_WUSER_WIDTH=1,C_M_AXI_B0_RUSER_WIDTH=1,C_M_AXI_B0_BUSER_WIDTH=1,C_M_AXI_B0_USER_VALUE=0x0000000" & 
"0,C_M_AXI_B0_PROT_VALUE=000,C_M_AXI_B0_CACHE_VALUE=0011,C_M_AXI_B1_ID_WIDTH=1,C_M_AXI_B1_ADDR_WIDTH=64,C_M_AXI_B1_DATA_WIDTH=512,C_M_AXI_B1_AWUSER_WIDTH=1,C_M_AXI_B1_ARUSER_WIDTH=1,C_M_AXI_B1_WUSER_WIDTH=1,C_M_AXI_B1_RUSER_WIDTH=1,C_M_AXI_B1_BUSER_WIDTH=1,C_M_AXI_B1_USER_VALUE=0x00000000,C_M_AXI_B1_PROT_VALUE=000,C_M_AXI_B1_CACHE_VALUE=0011,C_M_AXI_B2_ID_WIDTH=1,C_M_AXI_B2_ADDR_WIDTH=64,C_M_AXI_B2_DATA_WIDTH=512,C_M_AXI_B2_AWUSER_WIDTH=1,C_M_AXI_B2_ARUSER_WIDTH=1,C_M_AXI_B2_WUSER_WIDTH=1,C_M_AXI" & 
"_B2_RUSER_WIDTH=1,C_M_AXI_B2_BUSER_WIDTH=1,C_M_AXI_B2_USER_VALUE=0x00000000,C_M_AXI_B2_PROT_VALUE=000,C_M_AXI_B2_CACHE_VALUE=0011}";
  ATTRIBUTE SDX_KERNEL : STRING;
  ATTRIBUTE SDX_KERNEL OF mmult_fpga: COMPONENT IS "true";
  ATTRIBUTE SDX_KERNEL_TYPE : STRING;
  ATTRIBUTE SDX_KERNEL_TYPE OF mmult_fpga: COMPONENT IS "hls";
  ATTRIBUTE SDX_KERNEL_SYNTH_INST : STRING;
  ATTRIBUTE SDX_KERNEL_SYNTH_INST OF mmult_fpga: COMPONENT IS "U0";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF u96v2_sbc_base_mmult_fpga_1_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_b2_AWADDR: SIGNAL IS "XIL_INTERFACENAME m_axi_b2, ADDR_WIDTH 64, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 512, FREQ_HZ 150000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN u96" & 
"v2_sbc_base_clk_wiz_0_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b2_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b2 AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_b1_AWADDR: SIGNAL IS "XIL_INTERFACENAME m_axi_b1, ADDR_WIDTH 64, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 512, FREQ_HZ 150000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN u96" & 
"v2_sbc_base_clk_wiz_0_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b1_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b1 AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_b0_AWADDR: SIGNAL IS "XIL_INTERFACENAME m_axi_b0, ADDR_WIDTH 64, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 512, FREQ_HZ 150000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN u96" & 
"v2_sbc_base_clk_wiz_0_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_b0_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_b0 AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF event_start: SIGNAL IS "XIL_INTERFACENAME event_start, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF event_start: SIGNAL IS "xilinx.com:signal:data:1.0 event_start DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF interrupt: SIGNAL IS "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF event_done: SIGNAL IS "XIL_INTERFACENAME event_done, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF event_done: SIGNAL IS "xilinx.com:signal:data:1.0 event_done DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_b0:m_axi_b1:m_axi_b2, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN u96v2_sbc_base_clk_wiz_0_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_control_AWADDR: SIGNAL IS "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 150000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN u96v2_sbc_base_clk_wiz_0_0_clk_out1, NUM_READ_THREADS" & 
" 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR";
BEGIN
  U0 : mmult_fpga
    GENERIC MAP (
      C_S_AXI_CONTROL_ADDR_WIDTH => 6,
      C_S_AXI_CONTROL_DATA_WIDTH => 32,
      C_M_AXI_B0_ID_WIDTH => 1,
      C_M_AXI_B0_ADDR_WIDTH => 64,
      C_M_AXI_B0_DATA_WIDTH => 512,
      C_M_AXI_B0_AWUSER_WIDTH => 1,
      C_M_AXI_B0_ARUSER_WIDTH => 1,
      C_M_AXI_B0_WUSER_WIDTH => 1,
      C_M_AXI_B0_RUSER_WIDTH => 1,
      C_M_AXI_B0_BUSER_WIDTH => 1,
      C_M_AXI_B0_USER_VALUE => 0,
      C_M_AXI_B0_PROT_VALUE => 0,
      C_M_AXI_B0_CACHE_VALUE => 3,
      C_M_AXI_B1_ID_WIDTH => 1,
      C_M_AXI_B1_ADDR_WIDTH => 64,
      C_M_AXI_B1_DATA_WIDTH => 512,
      C_M_AXI_B1_AWUSER_WIDTH => 1,
      C_M_AXI_B1_ARUSER_WIDTH => 1,
      C_M_AXI_B1_WUSER_WIDTH => 1,
      C_M_AXI_B1_RUSER_WIDTH => 1,
      C_M_AXI_B1_BUSER_WIDTH => 1,
      C_M_AXI_B1_USER_VALUE => 0,
      C_M_AXI_B1_PROT_VALUE => 0,
      C_M_AXI_B1_CACHE_VALUE => 3,
      C_M_AXI_B2_ID_WIDTH => 1,
      C_M_AXI_B2_ADDR_WIDTH => 64,
      C_M_AXI_B2_DATA_WIDTH => 512,
      C_M_AXI_B2_AWUSER_WIDTH => 1,
      C_M_AXI_B2_ARUSER_WIDTH => 1,
      C_M_AXI_B2_WUSER_WIDTH => 1,
      C_M_AXI_B2_RUSER_WIDTH => 1,
      C_M_AXI_B2_BUSER_WIDTH => 1,
      C_M_AXI_B2_USER_VALUE => 0,
      C_M_AXI_B2_PROT_VALUE => 0,
      C_M_AXI_B2_CACHE_VALUE => 3
    )
    PORT MAP (
      stall_start_ext => stall_start_ext,
      stall_done_ext => stall_done_ext,
      stall_start_str => stall_start_str,
      stall_done_str => stall_done_str,
      stall_start_int => stall_start_int,
      stall_done_int => stall_done_int,
      s_axi_control_AWADDR => s_axi_control_AWADDR,
      s_axi_control_AWVALID => s_axi_control_AWVALID,
      s_axi_control_AWREADY => s_axi_control_AWREADY,
      s_axi_control_WDATA => s_axi_control_WDATA,
      s_axi_control_WSTRB => s_axi_control_WSTRB,
      s_axi_control_WVALID => s_axi_control_WVALID,
      s_axi_control_WREADY => s_axi_control_WREADY,
      s_axi_control_BRESP => s_axi_control_BRESP,
      s_axi_control_BVALID => s_axi_control_BVALID,
      s_axi_control_BREADY => s_axi_control_BREADY,
      s_axi_control_ARADDR => s_axi_control_ARADDR,
      s_axi_control_ARVALID => s_axi_control_ARVALID,
      s_axi_control_ARREADY => s_axi_control_ARREADY,
      s_axi_control_RDATA => s_axi_control_RDATA,
      s_axi_control_RRESP => s_axi_control_RRESP,
      s_axi_control_RVALID => s_axi_control_RVALID,
      s_axi_control_RREADY => s_axi_control_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      event_done => event_done,
      interrupt => interrupt,
      event_start => event_start,
      m_axi_b0_AWADDR => m_axi_b0_AWADDR,
      m_axi_b0_AWLEN => m_axi_b0_AWLEN,
      m_axi_b0_AWSIZE => m_axi_b0_AWSIZE,
      m_axi_b0_AWBURST => m_axi_b0_AWBURST,
      m_axi_b0_AWLOCK => m_axi_b0_AWLOCK,
      m_axi_b0_AWREGION => m_axi_b0_AWREGION,
      m_axi_b0_AWCACHE => m_axi_b0_AWCACHE,
      m_axi_b0_AWPROT => m_axi_b0_AWPROT,
      m_axi_b0_AWQOS => m_axi_b0_AWQOS,
      m_axi_b0_AWVALID => m_axi_b0_AWVALID,
      m_axi_b0_AWREADY => m_axi_b0_AWREADY,
      m_axi_b0_WDATA => m_axi_b0_WDATA,
      m_axi_b0_WSTRB => m_axi_b0_WSTRB,
      m_axi_b0_WLAST => m_axi_b0_WLAST,
      m_axi_b0_WVALID => m_axi_b0_WVALID,
      m_axi_b0_WREADY => m_axi_b0_WREADY,
      m_axi_b0_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b0_BRESP => m_axi_b0_BRESP,
      m_axi_b0_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b0_BVALID => m_axi_b0_BVALID,
      m_axi_b0_BREADY => m_axi_b0_BREADY,
      m_axi_b0_ARADDR => m_axi_b0_ARADDR,
      m_axi_b0_ARLEN => m_axi_b0_ARLEN,
      m_axi_b0_ARSIZE => m_axi_b0_ARSIZE,
      m_axi_b0_ARBURST => m_axi_b0_ARBURST,
      m_axi_b0_ARLOCK => m_axi_b0_ARLOCK,
      m_axi_b0_ARREGION => m_axi_b0_ARREGION,
      m_axi_b0_ARCACHE => m_axi_b0_ARCACHE,
      m_axi_b0_ARPROT => m_axi_b0_ARPROT,
      m_axi_b0_ARQOS => m_axi_b0_ARQOS,
      m_axi_b0_ARVALID => m_axi_b0_ARVALID,
      m_axi_b0_ARREADY => m_axi_b0_ARREADY,
      m_axi_b0_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b0_RDATA => m_axi_b0_RDATA,
      m_axi_b0_RRESP => m_axi_b0_RRESP,
      m_axi_b0_RLAST => m_axi_b0_RLAST,
      m_axi_b0_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b0_RVALID => m_axi_b0_RVALID,
      m_axi_b0_RREADY => m_axi_b0_RREADY,
      m_axi_b1_AWADDR => m_axi_b1_AWADDR,
      m_axi_b1_AWLEN => m_axi_b1_AWLEN,
      m_axi_b1_AWSIZE => m_axi_b1_AWSIZE,
      m_axi_b1_AWBURST => m_axi_b1_AWBURST,
      m_axi_b1_AWLOCK => m_axi_b1_AWLOCK,
      m_axi_b1_AWREGION => m_axi_b1_AWREGION,
      m_axi_b1_AWCACHE => m_axi_b1_AWCACHE,
      m_axi_b1_AWPROT => m_axi_b1_AWPROT,
      m_axi_b1_AWQOS => m_axi_b1_AWQOS,
      m_axi_b1_AWVALID => m_axi_b1_AWVALID,
      m_axi_b1_AWREADY => m_axi_b1_AWREADY,
      m_axi_b1_WDATA => m_axi_b1_WDATA,
      m_axi_b1_WSTRB => m_axi_b1_WSTRB,
      m_axi_b1_WLAST => m_axi_b1_WLAST,
      m_axi_b1_WVALID => m_axi_b1_WVALID,
      m_axi_b1_WREADY => m_axi_b1_WREADY,
      m_axi_b1_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b1_BRESP => m_axi_b1_BRESP,
      m_axi_b1_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b1_BVALID => m_axi_b1_BVALID,
      m_axi_b1_BREADY => m_axi_b1_BREADY,
      m_axi_b1_ARADDR => m_axi_b1_ARADDR,
      m_axi_b1_ARLEN => m_axi_b1_ARLEN,
      m_axi_b1_ARSIZE => m_axi_b1_ARSIZE,
      m_axi_b1_ARBURST => m_axi_b1_ARBURST,
      m_axi_b1_ARLOCK => m_axi_b1_ARLOCK,
      m_axi_b1_ARREGION => m_axi_b1_ARREGION,
      m_axi_b1_ARCACHE => m_axi_b1_ARCACHE,
      m_axi_b1_ARPROT => m_axi_b1_ARPROT,
      m_axi_b1_ARQOS => m_axi_b1_ARQOS,
      m_axi_b1_ARVALID => m_axi_b1_ARVALID,
      m_axi_b1_ARREADY => m_axi_b1_ARREADY,
      m_axi_b1_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b1_RDATA => m_axi_b1_RDATA,
      m_axi_b1_RRESP => m_axi_b1_RRESP,
      m_axi_b1_RLAST => m_axi_b1_RLAST,
      m_axi_b1_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b1_RVALID => m_axi_b1_RVALID,
      m_axi_b1_RREADY => m_axi_b1_RREADY,
      m_axi_b2_AWADDR => m_axi_b2_AWADDR,
      m_axi_b2_AWLEN => m_axi_b2_AWLEN,
      m_axi_b2_AWSIZE => m_axi_b2_AWSIZE,
      m_axi_b2_AWBURST => m_axi_b2_AWBURST,
      m_axi_b2_AWLOCK => m_axi_b2_AWLOCK,
      m_axi_b2_AWREGION => m_axi_b2_AWREGION,
      m_axi_b2_AWCACHE => m_axi_b2_AWCACHE,
      m_axi_b2_AWPROT => m_axi_b2_AWPROT,
      m_axi_b2_AWQOS => m_axi_b2_AWQOS,
      m_axi_b2_AWVALID => m_axi_b2_AWVALID,
      m_axi_b2_AWREADY => m_axi_b2_AWREADY,
      m_axi_b2_WDATA => m_axi_b2_WDATA,
      m_axi_b2_WSTRB => m_axi_b2_WSTRB,
      m_axi_b2_WLAST => m_axi_b2_WLAST,
      m_axi_b2_WVALID => m_axi_b2_WVALID,
      m_axi_b2_WREADY => m_axi_b2_WREADY,
      m_axi_b2_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b2_BRESP => m_axi_b2_BRESP,
      m_axi_b2_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b2_BVALID => m_axi_b2_BVALID,
      m_axi_b2_BREADY => m_axi_b2_BREADY,
      m_axi_b2_ARADDR => m_axi_b2_ARADDR,
      m_axi_b2_ARLEN => m_axi_b2_ARLEN,
      m_axi_b2_ARSIZE => m_axi_b2_ARSIZE,
      m_axi_b2_ARBURST => m_axi_b2_ARBURST,
      m_axi_b2_ARLOCK => m_axi_b2_ARLOCK,
      m_axi_b2_ARREGION => m_axi_b2_ARREGION,
      m_axi_b2_ARCACHE => m_axi_b2_ARCACHE,
      m_axi_b2_ARPROT => m_axi_b2_ARPROT,
      m_axi_b2_ARQOS => m_axi_b2_ARQOS,
      m_axi_b2_ARVALID => m_axi_b2_ARVALID,
      m_axi_b2_ARREADY => m_axi_b2_ARREADY,
      m_axi_b2_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b2_RDATA => m_axi_b2_RDATA,
      m_axi_b2_RRESP => m_axi_b2_RRESP,
      m_axi_b2_RLAST => m_axi_b2_RLAST,
      m_axi_b2_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_b2_RVALID => m_axi_b2_RVALID,
      m_axi_b2_RREADY => m_axi_b2_RREADY
    );
END u96v2_sbc_base_mmult_fpga_1_0_arch;
