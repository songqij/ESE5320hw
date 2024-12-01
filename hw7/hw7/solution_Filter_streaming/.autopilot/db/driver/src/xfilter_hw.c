// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xfilter_hw.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFilter_hw_CfgInitialize(XFilter_hw *InstancePtr, XFilter_hw_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFilter_hw_Start(XFilter_hw *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFilter_hw_IsDone(XFilter_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFilter_hw_IsIdle(XFilter_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFilter_hw_IsReady(XFilter_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFilter_hw_Continue(XFilter_hw *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XFilter_hw_EnableAutoRestart(XFilter_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XFilter_hw_DisableAutoRestart(XFilter_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_AP_CTRL, 0);
}

void XFilter_hw_Set_Input_r(XFilter_hw *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_INPUT_R_DATA, (u32)(Data));
    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_INPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XFilter_hw_Get_Input_r(XFilter_hw *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_INPUT_R_DATA);
    Data += (u64)XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_INPUT_R_DATA + 4) << 32;
    return Data;
}

void XFilter_hw_Set_Output_r(XFilter_hw *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_OUTPUT_R_DATA, (u32)(Data));
    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_OUTPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XFilter_hw_Get_Output_r(XFilter_hw *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_OUTPUT_R_DATA);
    Data += (u64)XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_OUTPUT_R_DATA + 4) << 32;
    return Data;
}

void XFilter_hw_InterruptGlobalEnable(XFilter_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_GIE, 1);
}

void XFilter_hw_InterruptGlobalDisable(XFilter_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_GIE, 0);
}

void XFilter_hw_InterruptEnable(XFilter_hw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_IER);
    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_IER, Register | Mask);
}

void XFilter_hw_InterruptDisable(XFilter_hw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_IER);
    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_IER, Register & (~Mask));
}

void XFilter_hw_InterruptClear(XFilter_hw *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFilter_hw_WriteReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_ISR, Mask);
}

u32 XFilter_hw_InterruptGetEnabled(XFilter_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_IER);
}

u32 XFilter_hw_InterruptGetStatus(XFilter_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFilter_hw_ReadReg(InstancePtr->Control_BaseAddress, XFILTER_HW_CONTROL_ADDR_ISR);
}

