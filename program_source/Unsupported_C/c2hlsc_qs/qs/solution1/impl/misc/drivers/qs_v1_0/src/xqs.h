// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XQS_H
#define XQS_H

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
#include "xqs_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
    u64 Control_r_BaseAddress;
} XQs_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u64 Control_r_BaseAddress;
    u32 IsReady;
} XQs;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XQs_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XQs_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XQs_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XQs_ReadReg(BaseAddress, RegOffset) \
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
int XQs_Initialize(XQs *InstancePtr, u16 DeviceId);
XQs_Config* XQs_LookupConfig(u16 DeviceId);
int XQs_CfgInitialize(XQs *InstancePtr, XQs_Config *ConfigPtr);
#else
int XQs_Initialize(XQs *InstancePtr, const char* InstanceName);
int XQs_Release(XQs *InstancePtr);
#endif

void XQs_Start(XQs *InstancePtr);
u32 XQs_IsDone(XQs *InstancePtr);
u32 XQs_IsIdle(XQs *InstancePtr);
u32 XQs_IsReady(XQs *InstancePtr);
void XQs_EnableAutoRestart(XQs *InstancePtr);
void XQs_DisableAutoRestart(XQs *InstancePtr);

void XQs_Set_n(XQs *InstancePtr, u32 Data);
u32 XQs_Get_n(XQs *InstancePtr);
void XQs_Set_arr(XQs *InstancePtr, u64 Data);
u64 XQs_Get_arr(XQs *InstancePtr);

void XQs_InterruptGlobalEnable(XQs *InstancePtr);
void XQs_InterruptGlobalDisable(XQs *InstancePtr);
void XQs_InterruptEnable(XQs *InstancePtr, u32 Mask);
void XQs_InterruptDisable(XQs *InstancePtr, u32 Mask);
void XQs_InterruptClear(XQs *InstancePtr, u32 Mask);
u32 XQs_InterruptGetEnabled(XQs *InstancePtr);
u32 XQs_InterruptGetStatus(XQs *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
