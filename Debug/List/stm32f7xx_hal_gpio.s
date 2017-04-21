///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      21/Apr/2017  20:27:49
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\STM32Cube_FW_F7_V1.6.0\Drivers\STM32F7xx_HAL_Driver\Src\stm32f7xx_hal_gpio.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EW885C.tmp
//        (D:\STM32Cube_FW_F7_V1.6.0\Drivers\STM32F7xx_HAL_Driver\Src\stm32f7xx_hal_gpio.c
//        -D STM32F767xx -lb D:\Apollo\gpio\Debug\List -o
//        D:\Apollo\gpio\Debug\Obj --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M7 -e --fpu=VFPv5_d16 --dlib_config
//        "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Normal.h" -I D:\Apollo\gpio\CMSIS_header\
//        -I D:\Apollo\gpio\CMSIS_core\ -I D:\Apollo\gpio\HAL_Driver\Inc\ -I
//        D:\Apollo\gpio\ -Ol)
//    Locale       =  C
//    List file    =  D:\Apollo\gpio\Debug\List\stm32f7xx_hal_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC HAL_GPIO_DeInit
        PUBWEAK HAL_GPIO_EXTI_Callback
        PUBLIC HAL_GPIO_EXTI_IRQHandler
        PUBLIC HAL_GPIO_Init
        PUBLIC HAL_GPIO_LockPin
        PUBLIC HAL_GPIO_ReadPin
        PUBLIC HAL_GPIO_TogglePin
        PUBLIC HAL_GPIO_WritePin


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GPIO_Init:
        PUSH     {R3-R6}
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R3,#+0
        B.N      ??HAL_GPIO_Init_0
??HAL_GPIO_Init_1:
        MOVS     R6,#+10
        B.N      ??HAL_GPIO_Init_2
??HAL_GPIO_Init_3:
        LDR.W    R2,??DataTable2  ;; 0x40022400
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_Init_1
        MOVS     R6,#+9
??HAL_GPIO_Init_2:
??HAL_GPIO_Init_4:
??HAL_GPIO_Init_5:
??HAL_GPIO_Init_6:
??HAL_GPIO_Init_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ANDS     R2,R3,#0x3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+2
        LSLS     R6,R6,R2
        ORRS     R5,R6,R5
        LDR.W    R2,??DataTable2_1  ;; 0x40013808
        MOVS     R6,R3
        LSRS     R6,R6,#+2
        STR      R5,[R2, R6, LSL #+2]
        LDR.W    R2,??DataTable2_2  ;; 0x40013c00
        LDR      R5,[R2, #+0]
        BICS     R5,R5,R4
        LDR      R2,[R1, #+4]
        LSLS     R2,R2,#+15
        BPL.N    ??HAL_GPIO_Init_8
        ORRS     R5,R4,R5
??HAL_GPIO_Init_8:
        LDR.W    R2,??DataTable2_2  ;; 0x40013c00
        STR      R5,[R2, #+0]
        LDR.W    R2,??DataTable2_3  ;; 0x40013c04
        LDR      R5,[R2, #+0]
        BICS     R5,R5,R4
        LDR      R2,[R1, #+4]
        LSLS     R2,R2,#+14
        BPL.N    ??HAL_GPIO_Init_9
        ORRS     R5,R4,R5
??HAL_GPIO_Init_9:
        LDR.W    R2,??DataTable2_3  ;; 0x40013c04
        STR      R5,[R2, #+0]
        LDR.W    R2,??DataTable2_4  ;; 0x40013c08
        LDR      R5,[R2, #+0]
        BICS     R5,R5,R4
        LDR      R2,[R1, #+4]
        LSLS     R2,R2,#+11
        BPL.N    ??HAL_GPIO_Init_10
        ORRS     R5,R4,R5
??HAL_GPIO_Init_10:
        LDR.W    R2,??DataTable2_4  ;; 0x40013c08
        STR      R5,[R2, #+0]
        LDR.W    R2,??DataTable2_5  ;; 0x40013c0c
        LDR      R5,[R2, #+0]
        BICS     R5,R5,R4
        LDR      R2,[R1, #+4]
        LSLS     R2,R2,#+10
        BPL.N    ??HAL_GPIO_Init_11
        ORRS     R4,R4,R5
        MOVS     R5,R4
??HAL_GPIO_Init_11:
        LDR.W    R2,??DataTable2_5  ;; 0x40013c0c
        STR      R5,[R2, #+0]
??HAL_GPIO_Init_12:
        ADDS     R3,R3,#+1
??HAL_GPIO_Init_0:
        CMP      R3,#+16
        BCS.W    ??HAL_GPIO_Init_13
        MOVS     R2,#+1
        LSLS     R2,R2,R3
        LDR      R4,[R1, #+0]
        ANDS     R4,R2,R4
        CMP      R4,R2
        BNE.N    ??HAL_GPIO_Init_12
        LDR      R2,[R1, #+4]
        CMP      R2,#+2
        BEQ.N    ??HAL_GPIO_Init_14
        LDR      R2,[R1, #+4]
        CMP      R2,#+18
        BNE.N    ??HAL_GPIO_Init_15
??HAL_GPIO_Init_14:
        MOVS     R2,R3
        LSRS     R2,R2,#+3
        ADD      R2,R0,R2, LSL #+2
        LDR      R5,[R2, #+32]
        MOVS     R6,#+15
        ANDS     R2,R3,#0x7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+2
        LSLS     R6,R6,R2
        BICS     R5,R5,R6
        LDR      R6,[R1, #+16]
        ANDS     R2,R3,#0x7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+2
        LSLS     R6,R6,R2
        ORRS     R5,R6,R5
        MOVS     R2,R3
        LSRS     R2,R2,#+3
        ADD      R2,R0,R2, LSL #+2
        STR      R5,[R2, #+32]
??HAL_GPIO_Init_15:
        LDR      R5,[R0, #+0]
        MOVS     R6,#+3
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+1
        LSLS     R6,R6,R2
        BICS     R5,R5,R6
        LDRB     R6,[R1, #+4]
        ANDS     R6,R6,#0x3
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+1
        LSLS     R6,R6,R2
        ORRS     R5,R6,R5
        STR      R5,[R0, #+0]
        LDR      R2,[R1, #+4]
        CMP      R2,#+1
        BEQ.N    ??HAL_GPIO_Init_16
        LDR      R2,[R1, #+4]
        CMP      R2,#+2
        BEQ.N    ??HAL_GPIO_Init_16
        LDR      R2,[R1, #+4]
        CMP      R2,#+17
        BEQ.N    ??HAL_GPIO_Init_16
        LDR      R2,[R1, #+4]
        CMP      R2,#+18
        BNE.N    ??HAL_GPIO_Init_17
??HAL_GPIO_Init_16:
        LDR      R5,[R0, #+8]
        MOVS     R6,#+3
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+1
        LSLS     R6,R6,R2
        BICS     R5,R5,R6
        LDR      R6,[R1, #+12]
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+1
        LSLS     R6,R6,R2
        ORRS     R5,R6,R5
        STR      R5,[R0, #+8]
        LDR      R5,[R0, #+4]
        MOVS     R2,#+1
        LSLS     R2,R2,R3
        BICS     R5,R5,R2
        LDR      R2,[R1, #+4]
        UBFX     R2,R2,#+4,#+1
        LSLS     R2,R2,R3
        ORRS     R5,R2,R5
        STR      R5,[R0, #+4]
??HAL_GPIO_Init_17:
        LDR      R5,[R0, #+12]
        MOVS     R6,#+3
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+1
        LSLS     R6,R6,R2
        BICS     R5,R5,R6
        LDR      R6,[R1, #+8]
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+1
        LSLS     R6,R6,R2
        ORRS     R5,R6,R5
        STR      R5,[R0, #+12]
        LDR      R2,[R1, #+4]
        LSLS     R2,R2,#+3
        BPL.N    ??HAL_GPIO_Init_12
        LDR.N    R2,??DataTable2_6  ;; 0x40023844
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x4000
        LDR.N    R5,??DataTable2_6  ;; 0x40023844
        STR      R2,[R5, #+0]
        LDR.N    R2,??DataTable2_6  ;; 0x40023844
        LDR      R2,[R2, #+0]
        ANDS     R2,R2,#0x4000
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        LDR.N    R2,??DataTable2_1  ;; 0x40013808
        MOVS     R5,R3
        LSRS     R5,R5,#+2
        LDR      R5,[R2, R5, LSL #+2]
        MOVS     R6,#+15
        ANDS     R2,R3,#0x3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+2
        LSLS     R6,R6,R2
        BICS     R5,R5,R6
        LDR.N    R2,??DataTable2_7  ;; 0x40020000
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_Init_18
        MOVS     R6,#+0
        B.N      ??HAL_GPIO_Init_7
??HAL_GPIO_Init_18:
        LDR.N    R2,??DataTable2_8  ;; 0x40020400
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_Init_19
        MOVS     R6,#+1
        B.N      ??HAL_GPIO_Init_7
??HAL_GPIO_Init_19:
        LDR.N    R2,??DataTable2_9  ;; 0x40020800
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_Init_20
        MOVS     R6,#+2
        B.N      ??HAL_GPIO_Init_6
??HAL_GPIO_Init_20:
        LDR.N    R2,??DataTable2_10  ;; 0x40020c00
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_Init_21
        MOVS     R6,#+3
        B.N      ??HAL_GPIO_Init_6
??HAL_GPIO_Init_21:
        LDR.N    R2,??DataTable2_11  ;; 0x40021000
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_Init_22
        MOVS     R6,#+4
        B.N      ??HAL_GPIO_Init_5
??HAL_GPIO_Init_22:
        LDR.N    R2,??DataTable2_12  ;; 0x40021400
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_Init_23
        MOVS     R6,#+5
        B.N      ??HAL_GPIO_Init_5
??HAL_GPIO_Init_23:
        LDR.N    R2,??DataTable2_13  ;; 0x40021800
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_Init_24
        MOVS     R6,#+6
        B.N      ??HAL_GPIO_Init_4
??HAL_GPIO_Init_24:
        LDR.N    R2,??DataTable2_14  ;; 0x40021c00
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_Init_25
        MOVS     R6,#+7
        B.N      ??HAL_GPIO_Init_4
??HAL_GPIO_Init_25:
        LDR.N    R2,??DataTable2_15  ;; 0x40022000
        CMP      R0,R2
        BNE.W    ??HAL_GPIO_Init_3
        MOVS     R6,#+8
        B.N      ??HAL_GPIO_Init_2
??HAL_GPIO_Init_13:
        POP      {R0,R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GPIO_DeInit:
        PUSH     {R4-R7}
        MOVS     R2,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R3,#+0
        B.N      ??HAL_GPIO_DeInit_0
??HAL_GPIO_DeInit_1:
        MOVS     R6,#+10
        B.N      ??HAL_GPIO_DeInit_2
??HAL_GPIO_DeInit_3:
        LDR.N    R2,??DataTable2  ;; 0x40022400
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_DeInit_1
        MOVS     R6,#+9
??HAL_GPIO_DeInit_2:
??HAL_GPIO_DeInit_4:
??HAL_GPIO_DeInit_5:
??HAL_GPIO_DeInit_6:
??HAL_GPIO_DeInit_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ANDS     R2,R3,#0x3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+2
        LSLS     R6,R6,R2
        CMP      R5,R6
        BNE.N    ??HAL_GPIO_DeInit_8
        MOVS     R2,#+15
        ANDS     R5,R3,#0x3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R5,R5,#+2
        LSLS     R5,R2,R5
        LDR.N    R2,??DataTable2_1  ;; 0x40013808
        MOVS     R6,R3
        LSRS     R6,R6,#+2
        LDR      R2,[R2, R6, LSL #+2]
        BICS     R5,R2,R5
        LDR.N    R2,??DataTable2_1  ;; 0x40013808
        MOVS     R6,R3
        LSRS     R6,R6,#+2
        STR      R5,[R2, R6, LSL #+2]
        LDR.N    R2,??DataTable2_2  ;; 0x40013c00
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R4
        LDR.N    R5,??DataTable2_2  ;; 0x40013c00
        STR      R2,[R5, #+0]
        LDR.N    R2,??DataTable2_3  ;; 0x40013c04
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R4
        LDR.N    R5,??DataTable2_3  ;; 0x40013c04
        STR      R2,[R5, #+0]
        LDR.N    R2,??DataTable2_4  ;; 0x40013c08
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R4
        LDR.N    R5,??DataTable2_4  ;; 0x40013c08
        STR      R2,[R5, #+0]
        LDR.N    R2,??DataTable2_5  ;; 0x40013c0c
        LDR      R2,[R2, #+0]
        BICS     R4,R2,R4
        LDR.N    R2,??DataTable2_5  ;; 0x40013c0c
        STR      R4,[R2, #+0]
??HAL_GPIO_DeInit_8:
        ADDS     R3,R3,#+1
??HAL_GPIO_DeInit_0:
        CMP      R3,#+16
        BCS.N    ??HAL_GPIO_DeInit_9
        MOVS     R2,#+1
        LSLS     R2,R2,R3
        ANDS     R4,R2,R1
        CMP      R4,R2
        BNE.N    ??HAL_GPIO_DeInit_8
        LDR      R5,[R0, #+0]
        MOVS     R6,#+3
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+1
        LSLS     R6,R6,R2
        BICS     R5,R5,R6
        STR      R5,[R0, #+0]
        MOVS     R2,R3
        LSRS     R2,R2,#+3
        ADD      R5,R0,R2, LSL #+2
        MOVS     R2,R3
        LSRS     R2,R2,#+3
        ADD      R2,R0,R2, LSL #+2
        LDR      R6,[R2, #+32]
        MOVS     R7,#+15
        ANDS     R2,R3,#0x7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+2
        LSLS     R7,R7,R2
        BICS     R6,R6,R7
        STR      R6,[R5, #+32]
        LDR      R5,[R0, #+8]
        MOVS     R6,#+3
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+1
        LSLS     R6,R6,R2
        BICS     R5,R5,R6
        STR      R5,[R0, #+8]
        LDR      R2,[R0, #+4]
        MOVS     R5,#+1
        LSLS     R5,R5,R3
        BICS     R2,R2,R5
        STR      R2,[R0, #+4]
        LDR      R5,[R0, #+12]
        MOVS     R6,#+3
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+1
        LSLS     R6,R6,R2
        BICS     R5,R5,R6
        STR      R5,[R0, #+12]
        LDR.N    R2,??DataTable2_1  ;; 0x40013808
        MOVS     R5,R3
        LSRS     R5,R5,#+2
        LDR      R5,[R2, R5, LSL #+2]
        MOVS     R6,#+15
        ANDS     R2,R3,#0x3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+2
        LSLS     R6,R6,R2
        ANDS     R5,R6,R5
        LDR.N    R2,??DataTable2_7  ;; 0x40020000
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_DeInit_10
        MOVS     R6,#+0
        B.N      ??HAL_GPIO_DeInit_7
??HAL_GPIO_DeInit_10:
        LDR.N    R2,??DataTable2_8  ;; 0x40020400
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_DeInit_11
        MOVS     R6,#+1
        B.N      ??HAL_GPIO_DeInit_7
??HAL_GPIO_DeInit_11:
        LDR.N    R2,??DataTable2_9  ;; 0x40020800
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_DeInit_12
        MOVS     R6,#+2
        B.N      ??HAL_GPIO_DeInit_6
??HAL_GPIO_DeInit_12:
        LDR.N    R2,??DataTable2_10  ;; 0x40020c00
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_DeInit_13
        MOVS     R6,#+3
        B.N      ??HAL_GPIO_DeInit_6
??HAL_GPIO_DeInit_13:
        LDR.N    R2,??DataTable2_11  ;; 0x40021000
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_DeInit_14
        MOVS     R6,#+4
        B.N      ??HAL_GPIO_DeInit_5
??HAL_GPIO_DeInit_14:
        LDR.N    R2,??DataTable2_12  ;; 0x40021400
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_DeInit_15
        MOVS     R6,#+5
        B.N      ??HAL_GPIO_DeInit_5
??HAL_GPIO_DeInit_15:
        LDR.N    R2,??DataTable2_13  ;; 0x40021800
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_DeInit_16
        MOVS     R6,#+6
        B.N      ??HAL_GPIO_DeInit_4
??HAL_GPIO_DeInit_16:
        LDR.N    R2,??DataTable2_14  ;; 0x40021c00
        CMP      R0,R2
        BNE.N    ??HAL_GPIO_DeInit_17
        MOVS     R6,#+7
        B.N      ??HAL_GPIO_DeInit_4
??HAL_GPIO_DeInit_17:
        LDR.N    R2,??DataTable2_15  ;; 0x40022000
        CMP      R0,R2
        BNE.W    ??HAL_GPIO_DeInit_3
        MOVS     R6,#+8
        B.N      ??HAL_GPIO_DeInit_2
??HAL_GPIO_DeInit_9:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GPIO_ReadPin:
        LDR      R0,[R0, #+16]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        TST      R0,R1
        BEQ.N    ??HAL_GPIO_ReadPin_0
        MOVS     R0,#+1
        B.N      ??HAL_GPIO_ReadPin_1
??HAL_GPIO_ReadPin_0:
        MOVS     R0,#+0
??HAL_GPIO_ReadPin_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GPIO_WritePin:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??HAL_GPIO_WritePin_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+24]
        B.N      ??HAL_GPIO_WritePin_1
??HAL_GPIO_WritePin_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R1,R1,#+16
        STR      R1,[R0, #+24]
??HAL_GPIO_WritePin_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GPIO_TogglePin:
        LDR      R2,[R0, #+20]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        EORS     R1,R1,R2
        STR      R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GPIO_LockPin:
        SUB      SP,SP,#+4
        MOVS     R2,#+65536
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R2,R1,R2
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        STR      R2,[R0, #+28]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+28]
        LDR      R1,[SP, #+0]
        STR      R1,[R0, #+28]
        LDR      R1,[R0, #+28]
        STR      R1,[SP, #+0]
        LDR      R0,[R0, #+28]
        LSLS     R0,R0,#+15
        BPL.N    ??HAL_GPIO_LockPin_0
        MOVS     R0,#+0
        B.N      ??HAL_GPIO_LockPin_1
??HAL_GPIO_LockPin_0:
        MOVS     R0,#+1
??HAL_GPIO_LockPin_1:
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_GPIO_EXTI_IRQHandler:
        PUSH     {R7,LR}
        LDR.N    R1,??DataTable2_16  ;; 0x40013c14
        LDR      R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        TST      R1,R0
        BEQ.N    ??HAL_GPIO_EXTI_IRQHandler_0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable2_16  ;; 0x40013c14
        STR      R0,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       HAL_GPIO_EXTI_Callback
??HAL_GPIO_EXTI_IRQHandler_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40022400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40013808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40013c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x40013c04

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x40013c08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x40013c0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x40023844

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x40020400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x40020800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x40020c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0x40021400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x40021800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0x40021c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     0x40022000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     0x40013c14

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        THUMB
HAL_GPIO_EXTI_Callback:
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 1 048 bytes in section .text
// 
// 1 046 bytes of CODE memory (+ 2 bytes shared)
//
//Errors: none
//Warnings: none
