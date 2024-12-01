// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XFILTER_HORIZONTAL_HW_H
#define XFILTER_HORIZONTAL_HW_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfilter_horizontal_hw_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XFilter_horizontal_hw_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XFilter_horizontal_hw;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFilter_horizontal_hw_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFilter_horizontal_hw_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFilter_horizontal_hw_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFilter_horizontal_hw_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XFilter_horizontal_hw_Initialize(XFilter_horizontal_hw *InstancePtr, u16 DeviceId);
XFilter_horizontal_hw_Config* XFilter_horizontal_hw_LookupConfig(u16 DeviceId);
int XFilter_horizontal_hw_CfgInitialize(XFilter_horizontal_hw *InstancePtr, XFilter_horizontal_hw_Config *ConfigPtr);
#else
int XFilter_horizontal_hw_Initialize(XFilter_horizontal_hw *InstancePtr, const char* InstanceName);
int XFilter_horizontal_hw_Release(XFilter_horizontal_hw *InstancePtr);
#endif

void XFilter_horizontal_hw_Start(XFilter_horizontal_hw *InstancePtr);
u32 XFilter_horizontal_hw_IsDone(XFilter_horizontal_hw *InstancePtr);
u32 XFilter_horizontal_hw_IsIdle(XFilter_horizontal_hw *InstancePtr);
u32 XFilter_horizontal_hw_IsReady(XFilter_horizontal_hw *InstancePtr);
void XFilter_horizontal_hw_Continue(XFilter_horizontal_hw *InstancePtr);
void XFilter_horizontal_hw_EnableAutoRestart(XFilter_horizontal_hw *InstancePtr);
void XFilter_horizontal_hw_DisableAutoRestart(XFilter_horizontal_hw *InstancePtr);

void XFilter_horizontal_hw_Set_Input_r(XFilter_horizontal_hw *InstancePtr, u64 Data);
u64 XFilter_horizontal_hw_Get_Input_r(XFilter_horizontal_hw *InstancePtr);
void XFilter_horizontal_hw_Set_Output_r(XFilter_horizontal_hw *InstancePtr, u64 Data);
u64 XFilter_horizontal_hw_Get_Output_r(XFilter_horizontal_hw *InstancePtr);

void XFilter_horizontal_hw_InterruptGlobalEnable(XFilter_horizontal_hw *InstancePtr);
void XFilter_horizontal_hw_InterruptGlobalDisable(XFilter_horizontal_hw *InstancePtr);
void XFilter_horizontal_hw_InterruptEnable(XFilter_horizontal_hw *InstancePtr, u32 Mask);
void XFilter_horizontal_hw_InterruptDisable(XFilter_horizontal_hw *InstancePtr, u32 Mask);
void XFilter_horizontal_hw_InterruptClear(XFilter_horizontal_hw *InstancePtr, u32 Mask);
u32 XFilter_horizontal_hw_InterruptGetEnabled(XFilter_horizontal_hw *InstancePtr);
u32 XFilter_horizontal_hw_InterruptGetStatus(XFilter_horizontal_hw *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
