#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/mnt/pollux/software/xilinx/2020.2/Vitis/2020.2/bin:/mnt/pollux/software/xilinx/2020.2/Vitis/2020.2/bin:/mnt/pollux/software/xilinx/2020.2/Vitis/2020.2/bin:/mnt/pollux/software/xilinx/2020.2/Vitis/2020.2/bin:/mnt/pollux/software/xilinx/2020.2/Vivado/2020.2/bin
else
  PATH=/mnt/pollux/software/xilinx/2020.2/Vitis/2020.2/bin:/mnt/pollux/software/xilinx/2020.2/Vitis/2020.2/bin:/mnt/pollux/software/xilinx/2020.2/Vitis/2020.2/bin:/mnt/pollux/software/xilinx/2020.2/Vitis/2020.2/bin:/mnt/pollux/software/xilinx/2020.2/Vivado/2020.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/_x/link/vivado/vpl/prj/prj.runs/u96v2_sbc_base_auto_pc_1_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log u96v2_sbc_base_auto_pc_1.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source u96v2_sbc_base_auto_pc_1.tcl
