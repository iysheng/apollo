///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      20/Apr/2017  09:36:11
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\STM32Cube_FW_F7_V1.6.0\Drivers\STM32F7xx_HAL_Driver\Src\stm32f7xx_hal.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EW5D2C.tmp
//        (D:\STM32Cube_FW_F7_V1.6.0\Drivers\STM32F7xx_HAL_Driver\Src\stm32f7xx_hal.c
//        -D STM32F767xx -lb D:\Apollo\gpio\Debug\List -o
//        D:\Apollo\gpio\Debug\Obj --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M7 -e --fpu=VFPv5_d16 --dlib_config
//        "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Normal.h" -I D:\Apollo\gpio\CMSIS_header\
//        -I D:\Apollo\gpio\CMSIS_core\ -I D:\Apollo\gpio\HAL_Driver\Inc\ -Ol)
//    Locale       =  C
//    List file    =  D:\Apollo\gpio\Debug\List\stm32f7xx_hal.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN HAL_NVIC_SetPriority
        EXTERN HAL_NVIC_SetPriorityGrouping
        EXTERN HAL_SYSTICK_Config
        EXTERN SystemCoreClock

        PUBLIC HAL_DBGMCU_DisableDBGSleepMode
        PUBLIC HAL_DBGMCU_DisableDBGStandbyMode
        PUBLIC HAL_DBGMCU_DisableDBGStopMode
        PUBLIC HAL_DBGMCU_EnableDBGSleepMode
        PUBLIC HAL_DBGMCU_EnableDBGStandbyMode
        PUBLIC HAL_DBGMCU_EnableDBGStopMode
        PUBLIC HAL_DeInit
        PUBWEAK HAL_Delay
        PUBLIC HAL_DisableCompensationCell
        PUBLIC HAL_DisableFMCMemorySwapping
        PUBLIC HAL_DisableMemorySwappingBank
        PUBLIC HAL_EnableCompensationCell
        PUBLIC HAL_EnableFMCMemorySwapping
        PUBLIC HAL_EnableMemorySwappingBank
        PUBLIC HAL_GetDEVID
        PUBLIC HAL_GetHalVersion
        PUBLIC HAL_GetREVID
        PUBWEAK HAL_GetTick
        PUBWEAK HAL_IncTick
        PUBLIC HAL_Init
        PUBWEAK HAL_InitTick
        PUBWEAK HAL_MspDeInit
        PUBWEAK HAL_MspInit
        PUBWEAK HAL_ResumeTick
        PUBWEAK HAL_SuspendTick
        PUBLIC uwTick


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
uwTick:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_Init:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable15  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable15  ;; 0x40023c00
        STR      R0,[R1, #+0]
        MOVS     R0,#+3
        BL       HAL_NVIC_SetPriorityGrouping
        MOVS     R0,#+15
        BL       HAL_InitTick
        BL       HAL_MspInit
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DeInit:
        PUSH     {R7,LR}
        MOVS     R0,#-1
        LDR.N    R1,??DataTable15_1  ;; 0x40023820
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_1  ;; 0x40023820
        STR      R0,[R1, #+0]
        MOVS     R0,#-1
        LDR.N    R1,??DataTable15_2  ;; 0x40023824
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_2  ;; 0x40023824
        STR      R0,[R1, #+0]
        MOVS     R0,#-1
        LDR.N    R1,??DataTable15_3  ;; 0x40023810
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_3  ;; 0x40023810
        STR      R0,[R1, #+0]
        MOVS     R0,#-1
        LDR.N    R1,??DataTable15_4  ;; 0x40023814
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_4  ;; 0x40023814
        STR      R0,[R1, #+0]
        MOVS     R0,#-1
        LDR.N    R1,??DataTable15_5  ;; 0x40023818
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_5  ;; 0x40023818
        STR      R0,[R1, #+0]
        BL       HAL_MspDeInit
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GetHalVersion:
        MOVS     R0,#+16908288
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GetREVID:
        LDR.N    R0,??DataTable15_6  ;; 0xe0042000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GetDEVID:
        LDR.N    R0,??DataTable15_6  ;; 0xe0042000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+20       ;; ZeroExtS R0,R0,#+20,#+20
        LSRS     R0,R0,#+20
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DBGMCU_EnableDBGSleepMode:
        LDR.N    R0,??DataTable15_7  ;; 0xe0042004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable15_7  ;; 0xe0042004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DBGMCU_DisableDBGSleepMode:
        LDR.N    R0,??DataTable15_7  ;; 0xe0042004
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable15_7  ;; 0xe0042004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DBGMCU_EnableDBGStopMode:
        LDR.N    R0,??DataTable15_7  ;; 0xe0042004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable15_7  ;; 0xe0042004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DBGMCU_DisableDBGStopMode:
        LDR.N    R0,??DataTable15_7  ;; 0xe0042004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.N    R1,??DataTable15_7  ;; 0xe0042004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DBGMCU_EnableDBGStandbyMode:
        LDR.N    R0,??DataTable15_7  ;; 0xe0042004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable15_7  ;; 0xe0042004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DBGMCU_DisableDBGStandbyMode:
        LDR.N    R0,??DataTable15_7  ;; 0xe0042004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable15_7  ;; 0xe0042004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_EnableCompensationCell:
        LDR.N    R0,??DataTable15_8  ;; 0x40013820
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable15_8  ;; 0x40013820
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DisableCompensationCell:
        LDR.N    R0,??DataTable15_8  ;; 0x40013820
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable15_8  ;; 0x40013820
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_EnableFMCMemorySwapping:
        LDR.N    R0,??DataTable15_9  ;; 0x40013800
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.N    R1,??DataTable15_9  ;; 0x40013800
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DisableFMCMemorySwapping:
        LDR.N    R0,??DataTable15_9  ;; 0x40013800
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0xC00
        LDR.N    R1,??DataTable15_9  ;; 0x40013800
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_EnableMemorySwappingBank:
        LDR.N    R0,??DataTable15_9  ;; 0x40013800
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable15_9  ;; 0x40013800
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_DisableMemorySwappingBank:
        LDR.N    R0,??DataTable15_9  ;; 0x40013800
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.N    R1,??DataTable15_9  ;; 0x40013800
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0x40023c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     0x40023820

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     0x40023824

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     0x40023810

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_4:
        DC32     0x40023814

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_5:
        DC32     0x40023818

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_6:
        DC32     0xe0042000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_7:
        DC32     0xe0042004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_8:
        DC32     0x40013820

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_9:
        DC32     0x40013800

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        THUMB
HAL_MspInit:
        BX       LR               ;; return

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        THUMB
HAL_MspDeInit:
        BX       LR               ;; return

        SECTION `.text`:CODE:REORDER:NOROOT(2)
        THUMB
HAL_InitTick:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.N    R0,??HAL_InitTick_0
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        UDIV     R0,R0,R1
        BL       HAL_SYSTICK_Config
        MOVS     R2,#+0
        MOVS     R1,R4
        MOVS     R0,#-1
        BL       HAL_NVIC_SetPriority
        MOVS     R0,#+0
        POP      {R4,PC}          ;; return
        DATA
??HAL_InitTick_0:
        DC32     SystemCoreClock

        SECTION `.text`:CODE:REORDER:NOROOT(2)
        THUMB
HAL_IncTick:
        LDR.N    R0,??HAL_IncTick_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??HAL_IncTick_0
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        DATA
??HAL_IncTick_0:
        DC32     uwTick

        SECTION `.text`:CODE:REORDER:NOROOT(2)
        THUMB
HAL_GetTick:
        LDR.N    R0,??HAL_GetTick_0
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??HAL_GetTick_0:
        DC32     uwTick

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        THUMB
HAL_Delay:
        PUSH     {R0,R4,LR}
        SUB      SP,SP,#+4
        MOVS     R4,#+0
        BL       HAL_GetTick
        MOVS     R4,R0
??HAL_Delay_0:
        BL       HAL_GetTick
        SUBS     R0,R0,R4
        LDR      R1,[SP, #+4]
        CMP      R0,R1
        BCC.N    ??HAL_Delay_0
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:REORDER:NOROOT(2)
        THUMB
HAL_SuspendTick:
        LDR.N    R0,??HAL_SuspendTick_0  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.N    R1,??HAL_SuspendTick_0  ;; 0xe000e010
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??HAL_SuspendTick_0:
        DC32     0xe000e010

        SECTION `.text`:CODE:REORDER:NOROOT(2)
        THUMB
HAL_ResumeTick:
        LDR.N    R0,??HAL_ResumeTick_0  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??HAL_ResumeTick_0  ;; 0xe000e010
        STR      R0,[R1, #+0]
        BX       LR               ;; return
        Nop      
        DATA
??HAL_ResumeTick_0:
        DC32     0xe000e010

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//   4 bytes in section .bss
// 484 bytes in section .text
// 
// 346 bytes of CODE memory (+ 138 bytes shared)
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
