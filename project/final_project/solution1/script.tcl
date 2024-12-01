############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project final_project
set_top lzw
add_files vitis/lzw.cpp
add_files vitis/lzw.h
add_files -tb vitis/testbench.cpp
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 100MHz -name default
config_rtl -register_reset_num 3
config_interface -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512 -m_axi_offset slave
config_export -format xo -output /mnt/castor/seas_home/s/songqij/ese532_code/project/Server/p3/lzw.xo -rtl verilog
source "./final_project/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format xo -output /mnt/castor/seas_home/s/songqij/ese532_code/project/Server/p3/lzw.xo
