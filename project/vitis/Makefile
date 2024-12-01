# 定义编译器和编译参数
CXX := aarch64-linux-gnu-g++
CXXFLAGS := -march=armv8-a+simd -mtune=cortex-a53 -std=c++11 \
             -DVITIS_PLATFORM= -D__USE_XOPEN2K8 \
             -I/mnt/pollux/software/xilinx/2020.2/Vivado/2020.2/include/ \
             -I/sw/u96v2_sbc_base/PetaLinux/sysroot/aarch64-xilinx-linux/usr/include/xrt/ \
             -O3 -g -Wall -c -fmessage-length=0 \
             --sysroot=/sw/u96v2_sbc_base/PetaLinux/sysroot/aarch64-xilinx-linux
LDFLAGS := -lxilinxopencl -lpthread -lrt -ldl -lcrypt -lstdc++ \
           -L/sw/u96v2_sbc_base/PetaLinux/sysroot/aarch64-xilinx-linux/usr/lib/ \
           --sysroot=/sw/u96v2_sbc_base/PetaLinux/sysroot/aarch64-xilinx-linux

SRC := sha_neon.cpp
OBJ := sha_neon.o
TARGET := sha_neon

# 默认目标
all: $(TARGET)

# 编译规则
$(OBJ): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(OBJ) $(SRC)

$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $(TARGET) $(LDFLAGS)

# 清理目标文件
clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean
