///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      21/Apr/2017  20:27:52
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Apollo\gpio\CMSIS_core\system_stm32f7xx.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EW95B9.tmp
//        (D:\Apollo\gpio\CMSIS_core\system_stm32f7xx.c -D STM32F767xx -lb
//        D:\Apollo\gpio\Debug\List -o D:\Apollo\gpio\Debug\Obj --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M7 -e
//        --fpu=VFPv5_d16 --dlib_config "D:\Program Files (x86)\IAR
//        Systems\Embedded Workbench 8.0\arm\INC\c\DLib_Config_Normal.h" -I
//        D:\Apollo\gpio\CMSIS_header\ -I D:\Apollo\gpio\CMSIS_core\ -I
//        D:\Apollo\gpio\HAL_Driver\Inc\ -I D:\Apollo\gpio\ -Ol)
//    Locale       =  C
//    List file    =  D:\Apollo\gpio\Debug\List\system_stm32f7xx.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC AHBPrescTable
        PUBLIC APBPrescTable
        PUBLIC SystemCoreClock
        PUBLIC SystemCoreClockUpdate
        PUBLIC SystemInit


        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
SystemCoreClock:
        DC32 16000000

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
AHBPrescTable:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
APBPrescTable:
        DC8 0, 0, 0, 0, 1, 2, 3, 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SystemInit:
        LDR.N    R0,??DataTable1  ;; 0xe000ed88
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF00000
        LDR.N    R1,??DataTable1  ;; 0xe000ed88
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable1_1  ;; 0x40023800
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable1_1  ;; 0x40023800
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_2  ;; 0x40023808
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable1_1  ;; 0x40023800
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_3  ;; 0xfef6ffff
        ANDS     R1,R0,R1
        LDR.N    R0,??DataTable1_1  ;; 0x40023800
        STR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_4  ;; 0x24003010
        LDR.N    R1,??DataTable1_5  ;; 0x40023804
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable1_1  ;; 0x40023800
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x40000
        LDR.N    R1,??DataTable1_1  ;; 0x40023800
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_6  ;; 0x4002380c
        STR      R0,[R1, #+0]
        MOVS     R0,#+134217728
        LDR.N    R1,??DataTable1_7  ;; 0xe000ed08
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SystemCoreClockUpdate:
        MOVS     R0,#+0
        MOVS     R1,#+0
        MOVS     R0,#+2
        MOVS     R0,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable1_2  ;; 0x40023808
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xC
        CMP      R0,#+0
        BEQ.N    ??SystemCoreClockUpdate_0
        CMP      R0,#+4
        BEQ.N    ??SystemCoreClockUpdate_1
        CMP      R0,#+8
        BEQ.N    ??SystemCoreClockUpdate_2
        B.N      ??SystemCoreClockUpdate_3
??SystemCoreClockUpdate_0:
        LDR.N    R0,??DataTable1_8  ;; 0xf42400
        LDR.N    R1,??DataTable1_9
        STR      R0,[R1, #+0]
        B.N      ??SystemCoreClockUpdate_4
??SystemCoreClockUpdate_1:
        LDR.N    R0,??DataTable1_10  ;; 0x17d7840
        LDR.N    R1,??DataTable1_9
        STR      R0,[R1, #+0]
        B.N      ??SystemCoreClockUpdate_4
??SystemCoreClockUpdate_2:
        LDR.N    R0,??DataTable1_5  ;; 0x40023804
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+22,#+1
        LDR.N    R1,??DataTable1_5  ;; 0x40023804
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x3F
        CMP      R0,#+0
        BEQ.N    ??SystemCoreClockUpdate_5
        LDR.N    R0,??DataTable1_10  ;; 0x17d7840
        UDIV     R1,R0,R1
        LDR.N    R0,??DataTable1_5  ;; 0x40023804
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+6,#+9
        MULS     R1,R0,R1
        B.N      ??SystemCoreClockUpdate_6
??SystemCoreClockUpdate_5:
        LDR.N    R0,??DataTable1_8  ;; 0xf42400
        UDIV     R1,R0,R1
        LDR.N    R0,??DataTable1_5  ;; 0x40023804
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+6,#+9
        MULS     R1,R0,R1
??SystemCoreClockUpdate_6:
        LDR.N    R0,??DataTable1_5  ;; 0x40023804
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+16,#+2
        ADDS     R0,R0,#+1
        LSLS     R0,R0,#+1
        UDIV     R0,R1,R0
        LDR.N    R1,??DataTable1_9
        STR      R0,[R1, #+0]
        B.N      ??SystemCoreClockUpdate_4
??SystemCoreClockUpdate_3:
        LDR.N    R0,??DataTable1_8  ;; 0xf42400
        LDR.N    R1,??DataTable1_9
        STR      R0,[R1, #+0]
??SystemCoreClockUpdate_4:
        LDR.N    R0,??DataTable1_11
        LDR.N    R1,??DataTable1_2  ;; 0x40023808
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+4,#+4
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,R0
        LDR.N    R0,??DataTable1_9
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0xe000ed88

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40023800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40023808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0xfef6ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x24003010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x40023804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x4002380c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0xe000ed08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0xf42400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     SystemCoreClock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     0x17d7840

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     AHBPrescTable

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//   4 bytes in section .data
//  24 bytes in section .rodata
// 278 bytes in section .text
// 
// 278 bytes of CODE  memory
//  24 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: none
