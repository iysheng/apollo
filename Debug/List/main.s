///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      20/Apr/2017  09:36:11
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Apollo\gpio\main.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EW5D1C.tmp
//        (D:\Apollo\gpio\main.c -D STM32F767xx -lb D:\Apollo\gpio\Debug\List
//        -o D:\Apollo\gpio\Debug\Obj --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M7 -e --fpu=VFPv5_d16 --dlib_config
//        "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Normal.h" -I D:\Apollo\gpio\CMSIS_header\
//        -I D:\Apollo\gpio\CMSIS_core\ -I D:\Apollo\gpio\HAL_Driver\Inc\ -Ol)
//    Locale       =  C
//    List file    =  D:\Apollo\gpio\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN HAL_GPIO_Init
        EXTERN HAL_GPIO_WritePin
        EXTERN HAL_Init

        PUBLIC main


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
main:
        PUSH     {LR}
        SUB      SP,SP,#+28
        BL       HAL_Init
        LDR.N    R0,??main_0      ;; 0x40023830
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??main_0      ;; 0x40023830
        STR      R0,[R1, #+0]
        LDR.N    R0,??main_0      ;; 0x40023830
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x2
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        MOVS     R0,#+3
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+1
        STR      R0,[SP, #+12]
        MOVS     R0,#+3
        STR      R0,[SP, #+16]
        ADD      R1,SP,#+4
        LDR.N    R0,??main_0+0x4  ;; 0x40020400
        BL       HAL_GPIO_Init
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??main_0+0x4  ;; 0x40020400
        BL       HAL_GPIO_WritePin
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??main_0+0x4  ;; 0x40020400
        BL       HAL_GPIO_WritePin
??main_1:
        B.N      ??main_1
        Nop      
        DATA
??main_0:
        DC32     0x40023830
        DC32     0x40020400

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 88 bytes in section .text
// 
// 88 bytes of CODE memory
//
//Errors: none
//Warnings: 1
