///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      23/Apr/2017  13:43:51
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\STM32Cube_FW_F7_V1.6.0\Drivers\STM32F7xx_HAL_Driver\Src\stm32f7xx_hal_cortex.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EW5772.tmp
//        (D:\STM32Cube_FW_F7_V1.6.0\Drivers\STM32F7xx_HAL_Driver\Src\stm32f7xx_hal_cortex.c
//        -D STM32F767xx -lb D:\Apollo\gpio\Debug\List -o
//        D:\Apollo\gpio\Debug\Obj --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M7 -e --fpu=VFPv5_d16 --dlib_config
//        "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Full.h" -I D:\Apollo\gpio\CMSIS_header\ -I
//        D:\Apollo\gpio\CMSIS_core\ -I D:\Apollo\gpio\HAL_Driver\Inc\ -I
//        D:\Apollo\gpio\ -Ol)
//    Locale       =  C
//    List file    =  D:\Apollo\gpio\Debug\List\stm32f7xx_hal_cortex.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC HAL_MPU_ConfigRegion
        PUBLIC HAL_MPU_Disable
        PUBLIC HAL_MPU_Enable
        PUBLIC HAL_NVIC_ClearPendingIRQ
        PUBLIC HAL_NVIC_DisableIRQ
        PUBLIC HAL_NVIC_EnableIRQ
        PUBLIC HAL_NVIC_GetActive
        PUBLIC HAL_NVIC_GetPendingIRQ
        PUBLIC HAL_NVIC_GetPriority
        PUBLIC HAL_NVIC_GetPriorityGrouping
        PUBLIC HAL_NVIC_SetPendingIRQ
        PUBLIC HAL_NVIC_SetPriority
        PUBLIC HAL_NVIC_SetPriorityGrouping
        PUBLIC HAL_NVIC_SystemReset
        PUBLIC HAL_SYSTICK_CLKSourceConfig
        PUBWEAK HAL_SYSTICK_Callback
        PUBLIC HAL_SYSTICK_Config
        PUBLIC HAL_SYSTICK_IRQHandler


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SetPriorityGrouping(uint32_t)
NVIC_SetPriorityGrouping:
        ANDS     R0,R0,#0x7
        LDR.N    R1,??DataTable15  ;; 0xe000ed0c
        LDR      R2,[R1, #+0]
        MOVW     R1,#+63743
        ANDS     R2,R1,R2
        LDR.N    R1,??DataTable15_1  ;; 0x5fa0000
        ORRS     R1,R1,R0, LSL #+8
        ORRS     R2,R1,R2
        LDR.N    R0,??DataTable15  ;; 0xe000ed0c
        STR      R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t NVIC_GetPriorityGrouping(void)
NVIC_GetPriorityGrouping:
        LDR.N    R0,??DataTable15  ;; 0xe000ed0c
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+8,#+3
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R2,#+1
        ANDS     R1,R0,#0x1F
        LSLS     R2,R2,R1
        LDR.N    R1,??DataTable15_2  ;; 0xe000e100
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_DisableIRQ(IRQn_Type)
NVIC_DisableIRQ:
        MOVS     R2,#+1
        ANDS     R1,R0,#0x1F
        LSLS     R2,R2,R1
        LDR.N    R1,??DataTable15_3  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t NVIC_GetPendingIRQ(IRQn_Type)
NVIC_GetPendingIRQ:
        MOVS     R1,R0
        LDR.N    R0,??DataTable15_4  ;; 0xe000e200
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        MOVS     R2,R1
        LSRS     R2,R2,#+5
        LDR      R0,[R0, R2, LSL #+2]
        ANDS     R1,R1,#0x1F
        LSRS     R0,R0,R1
        ANDS     R0,R0,#0x1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SetPendingIRQ(IRQn_Type)
NVIC_SetPendingIRQ:
        MOVS     R2,#+1
        ANDS     R1,R0,#0x1F
        LSLS     R2,R2,R1
        LDR.N    R1,??DataTable15_4  ;; 0xe000e200
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_ClearPendingIRQ(IRQn_Type)
NVIC_ClearPendingIRQ:
        MOVS     R2,#+1
        ANDS     R1,R0,#0x1F
        LSLS     R2,R2,R1
        LDR.N    R1,??DataTable15_5  ;; 0xe000e280
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t NVIC_GetActive(IRQn_Type)
NVIC_GetActive:
        MOVS     R1,R0
        LDR.N    R0,??DataTable15_6  ;; 0xe000e300
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        MOVS     R2,R1
        LSRS     R2,R2,#+5
        LDR      R0,[R0, R2, LSL #+2]
        ANDS     R1,R1,#0x1F
        LSRS     R0,R0,R1
        ANDS     R0,R0,#0x1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BPL.N    ??NVIC_SetPriority_0
        LSLS     R1,R1,#+4
        LDR.N    R2,??DataTable15_7  ;; 0xe000ed18
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0xF
        ADD      R0,R2,R0
        STRB     R1,[R0, #-4]
        B.N      ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LSLS     R1,R1,#+4
        LDR.N    R2,??DataTable15_8  ;; 0xe000e400
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        STRB     R1,[R2, R0]
??NVIC_SetPriority_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t NVIC_GetPriority(IRQn_Type)
NVIC_GetPriority:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BPL.N    ??NVIC_GetPriority_0
        LDR.N    R1,??DataTable15_7  ;; 0xe000ed18
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0xF
        ADD      R0,R1,R0
        LDRB     R0,[R0, #-4]
        LSRS     R0,R0,#+4
        B.N      ??NVIC_GetPriority_1
??NVIC_GetPriority_0:
        LDR.N    R1,??DataTable15_8  ;; 0xe000e400
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDRB     R0,[R1, R0]
        LSRS     R0,R0,#+4
??NVIC_GetPriority_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t NVIC_EncodePriority(uint32_t, uint32_t, uint32_t)
NVIC_EncodePriority:
        PUSH     {R4}
        ANDS     R0,R0,#0x7
        RSBS     R3,R0,#+7
        CMP      R3,#+5
        BCC.N    ??NVIC_EncodePriority_0
        MOVS     R3,#+4
        B.N      ??NVIC_EncodePriority_1
??NVIC_EncodePriority_0:
        RSBS     R3,R0,#+7
??NVIC_EncodePriority_1:
        ADDS     R4,R0,#+4
        CMP      R4,#+7
        BCS.N    ??NVIC_EncodePriority_2
        MOVS     R0,#+0
        B.N      ??NVIC_EncodePriority_3
??NVIC_EncodePriority_2:
        SUBS     R0,R0,#+3
??NVIC_EncodePriority_3:
        MOVS     R4,#+1
        LSLS     R3,R4,R3
        SUBS     R3,R3,#+1
        ANDS     R1,R3,R1
        LSLS     R1,R1,R0
        MOVS     R3,#+1
        LSLS     R0,R3,R0
        SUBS     R0,R0,#+1
        ANDS     R0,R0,R2
        ORRS     R0,R0,R1
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_DecodePriority(uint32_t, uint32_t, uint32_t *const, uint32_t *const)
NVIC_DecodePriority:
        PUSH     {R4-R6}
        ANDS     R1,R1,#0x7
        RSBS     R4,R1,#+7
        CMP      R4,#+5
        BCC.N    ??NVIC_DecodePriority_0
        MOVS     R4,#+4
        B.N      ??NVIC_DecodePriority_1
??NVIC_DecodePriority_0:
        RSBS     R4,R1,#+7
??NVIC_DecodePriority_1:
        ADDS     R5,R1,#+4
        CMP      R5,#+7
        BCS.N    ??NVIC_DecodePriority_2
        MOVS     R1,#+0
        B.N      ??NVIC_DecodePriority_3
??NVIC_DecodePriority_2:
        SUBS     R1,R1,#+3
??NVIC_DecodePriority_3:
        MOVS     R5,R0
        LSRS     R5,R5,R1
        MOVS     R6,#+1
        LSLS     R4,R6,R4
        SUBS     R4,R4,#+1
        ANDS     R4,R4,R5
        STR      R4,[R2, #+0]
        MOVS     R2,#+1
        LSLS     R1,R2,R1
        SUBS     R1,R1,#+1
        ANDS     R0,R1,R0
        STR      R0,[R3, #+0]
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SystemReset(void)
NVIC_SystemReset:
        DSB      
        LDR.N    R0,??DataTable15  ;; 0xe000ed0c
        LDR      R1,[R0, #+0]
        ANDS     R1,R1,#0x700
        LDR.N    R0,??DataTable15_9  ;; 0x5fa0004
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable15  ;; 0xe000ed0c
        STR      R1,[R0, #+0]
        DSB      
??NVIC_SystemReset_0:
        Nop      
        B.N      ??NVIC_SystemReset_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t SysTick_Config(uint32_t)
SysTick_Config:
        PUSH     {R7,LR}
        SUBS     R1,R0,#+1
        CMP      R1,#+16777216
        BCC.N    ??SysTick_Config_0
        MOVS     R0,#+1
        B.N      ??SysTick_Config_1
??SysTick_Config_0:
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable15_10  ;; 0xe000e014
        STR      R0,[R1, #+0]
        MOVS     R1,#+15
        MOVS     R0,#-1
        BL       NVIC_SetPriority
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_11  ;; 0xe000e018
        STR      R0,[R1, #+0]
        MOVS     R0,#+7
        LDR.N    R1,??DataTable15_12  ;; 0xe000e010
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
??SysTick_Config_1:
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_SetPriorityGrouping:
        PUSH     {R7,LR}
        BL       NVIC_SetPriorityGrouping
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_SetPriority:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R0,#+0
        BL       NVIC_GetPriorityGrouping
        MOVS     R2,R6
        MOVS     R1,R5
        BL       NVIC_EncodePriority
        MOVS     R1,R0
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_SetPriority
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_EnableIRQ:
        PUSH     {R7,LR}
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_EnableIRQ
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_DisableIRQ:
        PUSH     {R7,LR}
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_DisableIRQ
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_SystemReset:
        PUSH     {R7,LR}
        BL       NVIC_SystemReset
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_SYSTICK_Config:
        PUSH     {R7,LR}
        BL       SysTick_Config
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_MPU_Disable:
        DMB      
        LDR.N    R0,??DataTable15_13  ;; 0xe000ed24
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x10000
        LDR.N    R1,??DataTable15_13  ;; 0xe000ed24
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_14  ;; 0xe000ed94
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_MPU_Enable:
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable15_14  ;; 0xe000ed94
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable15_13  ;; 0xe000ed24
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable15_13  ;; 0xe000ed24
        STR      R0,[R1, #+0]
        DSB      
        ISB      
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_MPU_ConfigRegion:
        LDRB     R1,[R0, #+1]
        LDR.N    R2,??DataTable15_15  ;; 0xe000ed98
        STR      R1,[R2, #+0]
        LDRB     R1,[R0, #+0]
        CMP      R1,#+0
        BEQ.N    ??HAL_MPU_ConfigRegion_0
        LDR      R1,[R0, #+4]
        LDR.N    R2,??DataTable15_16  ;; 0xe000ed9c
        STR      R1,[R2, #+0]
        LDRB     R1,[R0, #+12]
        LDRB     R2,[R0, #+11]
        LSLS     R2,R2,#+24
        ORRS     R2,R2,R1, LSL #+28
        LDRB     R1,[R0, #+10]
        ORRS     R2,R2,R1, LSL #+19
        LDRB     R1,[R0, #+13]
        ORRS     R2,R2,R1, LSL #+18
        LDRB     R1,[R0, #+14]
        ORRS     R2,R2,R1, LSL #+17
        LDRB     R1,[R0, #+15]
        ORRS     R2,R2,R1, LSL #+16
        LDRB     R1,[R0, #+9]
        ORRS     R2,R2,R1, LSL #+8
        LDRB     R1,[R0, #+8]
        ORRS     R2,R2,R1, LSL #+1
        LDRB     R0,[R0, #+0]
        ORRS     R2,R0,R2
        LDR.N    R0,??DataTable15_17  ;; 0xe000eda0
        STR      R2,[R0, #+0]
        B.N      ??HAL_MPU_ConfigRegion_1
??HAL_MPU_ConfigRegion_0:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_16  ;; 0xe000ed9c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_17  ;; 0xe000eda0
        STR      R0,[R1, #+0]
??HAL_MPU_ConfigRegion_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_GetPriorityGrouping:
        PUSH     {R7,LR}
        BL       NVIC_GetPriorityGrouping
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_GetPriority:
        PUSH     {R4-R6,LR}
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_GetPriority
        MOVS     R3,R6
        MOVS     R2,R5
        MOVS     R1,R4
        BL       NVIC_DecodePriority
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_SetPendingIRQ:
        PUSH     {R7,LR}
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_SetPendingIRQ
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_GetPendingIRQ:
        PUSH     {R7,LR}
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_GetPendingIRQ
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_ClearPendingIRQ:
        PUSH     {R7,LR}
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_ClearPendingIRQ
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_NVIC_GetActive:
        PUSH     {R7,LR}
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BL       NVIC_GetActive
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_SYSTICK_CLKSourceConfig:
        CMP      R0,#+4
        BNE.N    ??HAL_SYSTICK_CLKSourceConfig_0
        LDR.N    R0,??DataTable15_12  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable15_12  ;; 0xe000e010
        STR      R0,[R1, #+0]
        B.N      ??HAL_SYSTICK_CLKSourceConfig_1
??HAL_SYSTICK_CLKSourceConfig_0:
        LDR.N    R0,??DataTable15_12  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable15_12  ;; 0xe000e010
        STR      R0,[R1, #+0]
??HAL_SYSTICK_CLKSourceConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0xe000ed0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     0x5fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_4:
        DC32     0xe000e200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_5:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_6:
        DC32     0xe000e300

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_7:
        DC32     0xe000ed18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_8:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_9:
        DC32     0x5fa0004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_10:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_11:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_12:
        DC32     0xe000e010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_13:
        DC32     0xe000ed24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_14:
        DC32     0xe000ed94

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_15:
        DC32     0xe000ed98

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_16:
        DC32     0xe000ed9c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_17:
        DC32     0xe000eda0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_SYSTICK_IRQHandler:
        PUSH     {R7,LR}
        BL       HAL_SYSTICK_Callback
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        THUMB
HAL_SYSTICK_Callback:
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 848 bytes in section .text
// 
// 846 bytes of CODE memory (+ 2 bytes shared)
//
//Errors: none
//Warnings: none
