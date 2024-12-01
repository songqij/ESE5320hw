#
# Copyright 2020 Xilinx, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Create a project
open_project -reset proj_mmult

# Add design files
add_files MatrixMultiplication.cpp
add_files MatrixMultiplication.h

# Add test bench & files
add_files -tb Testbench.cpp

# Set the top-level function
set_top mmult

# ########################################################
# Create a solution
open_solution -reset solution1 -flow_target vitis
# Define technology and clock rate
set_part  {xcvu9p-flga2104-2-i}
create_clock -period 8

config_compile -dump_cfg=0 -name_max_length 80 -no_signed_zeros=0 -pipeline_loops 0 -pipeline_style stp -pragma_strict_mode=0 -unsafe_math_optimizations=0
csynth_design
config_export -format xo -output ../mmult.xo -rtl verilog
export_design -rtl verilog -format xo -output ../mmult.xo

exit