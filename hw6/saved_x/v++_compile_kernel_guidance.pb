
�
v++_compile_kernel$dd2e2448-e64e-4be9-8264-8fa3101dcaeflv++  --target hw -k mmult_fpga --compile -Ifpga/hls --config fpga/design.cfg -okernel.xo fpga/hls/MMult.cpp *q"m/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/_x/reports/kernel/v++_compile_kernel_guidance.html2`"\/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/_x/v++_compile_kernel_guidance.pbB�
fpga/design.cfg�platform=u96v2_sbc_base
debug=1
save-temps=1

[connectivity]
nk=mmult_fpga:1:mmult_fpga_1
sp=mmult_fpga_1.A:HP0
sp=mmult_fpga_1.B:HP1
sp=mmult_fpga_1.C:HP2
*�,
��
Throughput"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
SPipelining result : Target II = 1, Final II = 1, Depth = 3, loop 'VITIS_LOOP_49_1'
W
U2SPipelining result : Target II = 1, Final II = 1, Depth = 3, loop 'VITIS_LOOP_49_1'
Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z AcceleratorZ
mmult_fpgaZ
Throughputh 
��
Throughput"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
cPipelining result : Target II = 1, Final II = 1, Depth = 2, loop 'VITIS_LOOP_65_2_VITIS_LOOP_66_3'
g
e2cPipelining result : Target II = 1, Final II = 1, Depth = 2, loop 'VITIS_LOOP_65_2_VITIS_LOOP_66_3'
Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z AcceleratorZ
mmult_fpgaZ
Throughputh 
��
Throughput"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
ePipelining result : Target II = 1, Final II = 1, Depth = 263, loop 'VITIS_LOOP_86_4_VITIS_LOOP_88_5'
i
g2ePipelining result : Target II = 1, Final II = 1, Depth = 263, loop 'VITIS_LOOP_86_4_VITIS_LOOP_88_5'
Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z
ThroughputZ AcceleratorZ
mmult_fpgah 
��
Throughput"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
TPipelining result : Target II = 1, Final II = 1, Depth = 3, loop 'VITIS_LOOP_103_1'
X
V2TPipelining result : Target II = 1, Final II = 1, Depth = 3, loop 'VITIS_LOOP_103_1'
Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z AcceleratorZ
mmult_fpgaZ
Throughputh 
�	�		Interface"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
]Design has MAXI bursts, see Vitis HLS GUI synthesis summary report for detailed information.
a
_2]Design has MAXI bursts, see Vitis HLS GUI synthesis summary report for detailed information.
Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z	InterfaceZ AcceleratorZ
mmult_fpgah 
�
�
Kernel"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
B**** Loop Constraint Status: All loop constraints were satisfied.
F
D2B**** Loop Constraint Status: All loop constraints were satisfied.
Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z
mmult_fpgaZ
KernelZ Acceleratorh 
��Kernel"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;JH
 **** Estimated Fmax: 205.47 MHz
$
"2 **** Estimated Fmax: 205.47 MHz
Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z
mmult_fpgaZ
KernelZ Acceleratorh 
��	Interface"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
\Multiple burst reads of length 8320 and bit width 512 has been inferred on port 'b0' (!%1!)
�
^2\Multiple burst reads of length 8320 and bit width 512 has been inferred on port 'b0' (%REF)

k
i	MMult.cpp2Z"M/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/fpga/hls/MMult.cpp2line=49Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z AcceleratorZ
mmult_fpgaZ	Interfaceh 
��	Interface"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
\Multiple burst reads of length 8320 and bit width 512 has been inferred on port 'b1' (!%1!)
�
^2\Multiple burst reads of length 8320 and bit width 512 has been inferred on port 'b1' (%REF)

k
i	MMult.cpp2Z"M/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/fpga/hls/MMult.cpp2line=49Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z AcceleratorZ
mmult_fpgaZ	Interfaceh 
��	Interface"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
]Multiple burst writes of length 8320 and bit width 512 has been inferred on port 'b2' (!%1!)
�
_2]Multiple burst writes of length 8320 and bit width 512 has been inferred on port 'b2' (%REF)

l
j	MMult.cpp2["M/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/fpga/hls/MMult.cpp2line=103Rp
 l
jh
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;Z AcceleratorZ
mmult_fpgaZ	Interfaceh 
��Latency"j
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;J�
]Cannot flatten loop 'VITIS_LOOP_63_1' (!%1!) in function 'execution' more than one sub loop.
�
_2]Cannot flatten loop 'VITIS_LOOP_63_1' (%REF) in function 'execution' more than one sub loop.

k
i	MMult.cpp2Z"M/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/fpga/hls/MMult.cpp2line=63R�
!%0!�
��
5See here for more help on vitis_hls 200-960 guidance.Mwww.xilinx.com"9/cgi-bin/docs/rdoc?v=2020.2;t=hls+guidance;d=200-960.htmlZ AcceleratorZ
mmult_fpgaZLatencyh B�
�
	Interface�
	InterfaceHLS Interface RelatedHLS"%s:
Kernel:	Interface: AcceleratorB Jj
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;P�  �� 
�
Kernel�
KernelHLS Kernel RelatedHLS"%s: Accelerator:
Kernel:
KernelB Jj
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;P�  �� 
�

Throughput�

ThroughputHLS Throughput RelatedHLS"%s: Accelerator:
Kernel:
ThroughputB Jj
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;P� �  �
�
Latency�
LatencyHLS Latency RelatedHLS"%s: Accelerator:
Kernel:LatencyB Jj
h
Vitis HLS User Guide (UG1399)Gwww.xilinx.com"3/cgi-bin/docs/rdoc?v=2020.2;d=ug1399-vitis-hls.pdf;P�  �� 