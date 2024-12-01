################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/mnt/castor/seas_home/s/songqij/ese532_code/project/vitis/lzw.cpp 

OBJS += \
./source/lzw.o 

CPP_DEPS += \
./source/lzw.d 


# Each subdirectory must supply rules for building sources it contributes
source/lzw.o: /mnt/castor/seas_home/s/songqij/ese532_code/project/vitis/lzw.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -I/mnt/pollux/software/xilinx/2020.2/Vitis_HLS/2020.2/lnx64/tools/auto_cc/include -I/mnt/pollux/software/xilinx/2020.2/Vitis_HLS/2020.2/lnx64/tools/systemc/include -I/mnt/pollux/software/xilinx/2020.2/Vitis_HLS/2020.2/include/ap_sysc -I/mnt/castor/seas_home/s/songqij/ese532_code/project -I/mnt/pollux/software/xilinx/2020.2/Vitis_HLS/2020.2/include/etc -I/mnt/pollux/software/xilinx/2020.2/Vitis_HLS/2020.2/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


