-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Thu Oct 17 03:43:19 2024
-- Host        : gemini.seas.upenn.edu running 64-bit openSUSE Leap 15.6
-- Command     : write_vhdl -force -mode synth_stub
--               /mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/_x/link/vivado/vpl/prj/prj.gen/sources_1/bd/u96v2_sbc_base/ip/u96v2_sbc_base_mmult_fpga_1_0/u96v2_sbc_base_mmult_fpga_1_0_stub.vhdl
-- Design      : u96v2_sbc_base_mmult_fpga_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sbva484-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity u96v2_sbc_base_mmult_fpga_1_0 is
  Port ( 
    stall_start_ext : out STD_LOGIC;
    stall_done_ext : out STD_LOGIC;
    stall_start_str : out STD_LOGIC;
    stall_done_str : out STD_LOGIC;
    stall_start_int : out STD_LOGIC;
    stall_done_int : out STD_LOGIC;
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    event_done : out STD_LOGIC;
    interrupt : out STD_LOGIC;
    event_start : out STD_LOGIC;
    m_axi_b0_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_b0_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_b0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b0_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b0_AWVALID : out STD_LOGIC;
    m_axi_b0_AWREADY : in STD_LOGIC;
    m_axi_b0_WDATA : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_b0_WSTRB : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_b0_WLAST : out STD_LOGIC;
    m_axi_b0_WVALID : out STD_LOGIC;
    m_axi_b0_WREADY : in STD_LOGIC;
    m_axi_b0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b0_BVALID : in STD_LOGIC;
    m_axi_b0_BREADY : out STD_LOGIC;
    m_axi_b0_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_b0_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_b0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b0_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b0_ARVALID : out STD_LOGIC;
    m_axi_b0_ARREADY : in STD_LOGIC;
    m_axi_b0_RDATA : in STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_b0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b0_RLAST : in STD_LOGIC;
    m_axi_b0_RVALID : in STD_LOGIC;
    m_axi_b0_RREADY : out STD_LOGIC;
    m_axi_b1_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_b1_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_b1_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b1_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b1_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b1_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b1_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b1_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b1_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b1_AWVALID : out STD_LOGIC;
    m_axi_b1_AWREADY : in STD_LOGIC;
    m_axi_b1_WDATA : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_b1_WSTRB : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_b1_WLAST : out STD_LOGIC;
    m_axi_b1_WVALID : out STD_LOGIC;
    m_axi_b1_WREADY : in STD_LOGIC;
    m_axi_b1_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b1_BVALID : in STD_LOGIC;
    m_axi_b1_BREADY : out STD_LOGIC;
    m_axi_b1_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_b1_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_b1_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b1_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b1_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b1_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b1_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b1_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b1_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b1_ARVALID : out STD_LOGIC;
    m_axi_b1_ARREADY : in STD_LOGIC;
    m_axi_b1_RDATA : in STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_b1_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b1_RLAST : in STD_LOGIC;
    m_axi_b1_RVALID : in STD_LOGIC;
    m_axi_b1_RREADY : out STD_LOGIC;
    m_axi_b2_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_b2_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_b2_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b2_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b2_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b2_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b2_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b2_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b2_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b2_AWVALID : out STD_LOGIC;
    m_axi_b2_AWREADY : in STD_LOGIC;
    m_axi_b2_WDATA : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_b2_WSTRB : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_b2_WLAST : out STD_LOGIC;
    m_axi_b2_WVALID : out STD_LOGIC;
    m_axi_b2_WREADY : in STD_LOGIC;
    m_axi_b2_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b2_BVALID : in STD_LOGIC;
    m_axi_b2_BREADY : out STD_LOGIC;
    m_axi_b2_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_b2_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_b2_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b2_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b2_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b2_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b2_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b2_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_b2_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_b2_ARVALID : out STD_LOGIC;
    m_axi_b2_ARREADY : in STD_LOGIC;
    m_axi_b2_RDATA : in STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_b2_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_b2_RLAST : in STD_LOGIC;
    m_axi_b2_RVALID : in STD_LOGIC;
    m_axi_b2_RREADY : out STD_LOGIC
  );

end u96v2_sbc_base_mmult_fpga_1_0;

architecture stub of u96v2_sbc_base_mmult_fpga_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "stall_start_ext,stall_done_ext,stall_start_str,stall_done_str,stall_start_int,stall_done_int,s_axi_control_AWADDR[5:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[5:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,event_done,interrupt,event_start,m_axi_b0_AWADDR[63:0],m_axi_b0_AWLEN[7:0],m_axi_b0_AWSIZE[2:0],m_axi_b0_AWBURST[1:0],m_axi_b0_AWLOCK[1:0],m_axi_b0_AWREGION[3:0],m_axi_b0_AWCACHE[3:0],m_axi_b0_AWPROT[2:0],m_axi_b0_AWQOS[3:0],m_axi_b0_AWVALID,m_axi_b0_AWREADY,m_axi_b0_WDATA[511:0],m_axi_b0_WSTRB[63:0],m_axi_b0_WLAST,m_axi_b0_WVALID,m_axi_b0_WREADY,m_axi_b0_BRESP[1:0],m_axi_b0_BVALID,m_axi_b0_BREADY,m_axi_b0_ARADDR[63:0],m_axi_b0_ARLEN[7:0],m_axi_b0_ARSIZE[2:0],m_axi_b0_ARBURST[1:0],m_axi_b0_ARLOCK[1:0],m_axi_b0_ARREGION[3:0],m_axi_b0_ARCACHE[3:0],m_axi_b0_ARPROT[2:0],m_axi_b0_ARQOS[3:0],m_axi_b0_ARVALID,m_axi_b0_ARREADY,m_axi_b0_RDATA[511:0],m_axi_b0_RRESP[1:0],m_axi_b0_RLAST,m_axi_b0_RVALID,m_axi_b0_RREADY,m_axi_b1_AWADDR[63:0],m_axi_b1_AWLEN[7:0],m_axi_b1_AWSIZE[2:0],m_axi_b1_AWBURST[1:0],m_axi_b1_AWLOCK[1:0],m_axi_b1_AWREGION[3:0],m_axi_b1_AWCACHE[3:0],m_axi_b1_AWPROT[2:0],m_axi_b1_AWQOS[3:0],m_axi_b1_AWVALID,m_axi_b1_AWREADY,m_axi_b1_WDATA[511:0],m_axi_b1_WSTRB[63:0],m_axi_b1_WLAST,m_axi_b1_WVALID,m_axi_b1_WREADY,m_axi_b1_BRESP[1:0],m_axi_b1_BVALID,m_axi_b1_BREADY,m_axi_b1_ARADDR[63:0],m_axi_b1_ARLEN[7:0],m_axi_b1_ARSIZE[2:0],m_axi_b1_ARBURST[1:0],m_axi_b1_ARLOCK[1:0],m_axi_b1_ARREGION[3:0],m_axi_b1_ARCACHE[3:0],m_axi_b1_ARPROT[2:0],m_axi_b1_ARQOS[3:0],m_axi_b1_ARVALID,m_axi_b1_ARREADY,m_axi_b1_RDATA[511:0],m_axi_b1_RRESP[1:0],m_axi_b1_RLAST,m_axi_b1_RVALID,m_axi_b1_RREADY,m_axi_b2_AWADDR[63:0],m_axi_b2_AWLEN[7:0],m_axi_b2_AWSIZE[2:0],m_axi_b2_AWBURST[1:0],m_axi_b2_AWLOCK[1:0],m_axi_b2_AWREGION[3:0],m_axi_b2_AWCACHE[3:0],m_axi_b2_AWPROT[2:0],m_axi_b2_AWQOS[3:0],m_axi_b2_AWVALID,m_axi_b2_AWREADY,m_axi_b2_WDATA[511:0],m_axi_b2_WSTRB[63:0],m_axi_b2_WLAST,m_axi_b2_WVALID,m_axi_b2_WREADY,m_axi_b2_BRESP[1:0],m_axi_b2_BVALID,m_axi_b2_BREADY,m_axi_b2_ARADDR[63:0],m_axi_b2_ARLEN[7:0],m_axi_b2_ARSIZE[2:0],m_axi_b2_ARBURST[1:0],m_axi_b2_ARLOCK[1:0],m_axi_b2_ARREGION[3:0],m_axi_b2_ARCACHE[3:0],m_axi_b2_ARPROT[2:0],m_axi_b2_ARQOS[3:0],m_axi_b2_ARVALID,m_axi_b2_ARREADY,m_axi_b2_RDATA[511:0],m_axi_b2_RRESP[1:0],m_axi_b2_RLAST,m_axi_b2_RVALID,m_axi_b2_RREADY";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "mmult_fpga,Vivado 2020.2";
begin
end;
