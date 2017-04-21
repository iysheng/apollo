///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      21/Apr/2017  22:23:25
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Apollo\gpio\main.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EW5EE4.tmp
//        (D:\Apollo\gpio\main.c -D STM32F767xx -lb D:\Apollo\gpio\Debug\List
//        -o D:\Apollo\gpio\Debug\Obj --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M7 -e --fpu=VFPv5_d16 --dlib_config
//        "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Normal.h" -I D:\Apollo\gpio\CMSIS_header\
//        -I D:\Apollo\gpio\CMSIS_core\ -I D:\Apollo\gpio\HAL_Driver\Inc\ -I
//        D:\Apollo\gpio\ -Ol)
//    Locale       =  C
//    List file    =  D:\Apollo\gpio\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN HAL_Delay
        EXTERN HAL_GPIO_Init
        EXTERN HAL_GPIO_WritePin
        EXTERN HAL_Init
        EXTERN HAL_PWREx_EnableOverDrive
        EXTERN HAL_RCC_ClockConfig
        EXTERN HAL_RCC_OscConfig
        EXTERN HAL_UART_Init
        EXTERN HAL_UART_Transmit
        EXTERN strlen

        PUBLIC HAL_UART_MspInit
        PUBLIC IUART2
        PUBLIC SystemClock_Config
        PUBLIC freq
        PUBLIC iputc
        PUBLIC main


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
freq:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
IUART2:
        DS8 112

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HAL_UART_MspInit:
        PUSH     {LR}
        SUB      SP,SP,#+28
        LDR      R1,[R0, #+0]
        LDR.N    R2,??DataTable3  ;; 0x40004400
        CMP      R1,R2
        BNE.N    ??HAL_UART_MspInit_0
        LDR.N    R0,??DataTable3_1  ;; 0x40023840
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable3_1  ;; 0x40023840
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_1  ;; 0x40023840
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x20000
        STR      R0,[SP, #+20]
        LDR      R0,[SP, #+20]
        LDR.N    R0,??DataTable3_2  ;; 0x40023830
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable3_2  ;; 0x40023830
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_2  ;; 0x40023830
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x1
        STR      R0,[SP, #+20]
        LDR      R0,[SP, #+20]
        MOVS     R0,#+4
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+7
        STR      R0,[SP, #+16]
        MOV      R1,SP
        LDR.N    R0,??DataTable3_3  ;; 0x40020000
        BL       HAL_GPIO_Init
        MOVS     R0,#+8
        STR      R0,[SP, #+0]
        MOVS     R0,#+7
        STR      R0,[SP, #+16]
        MOV      R1,SP
        LDR.N    R0,??DataTable3_3  ;; 0x40020000
        BL       HAL_GPIO_Init
        B.N      ??HAL_UART_MspInit_1
??HAL_UART_MspInit_0:
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_4  ;; 0x40011000
        CMP      R0,R1
        BNE.N    ??HAL_UART_MspInit_1
        LDR.N    R0,??DataTable3_5  ;; 0x40023844
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable3_5  ;; 0x40023844
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_5  ;; 0x40023844
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x10
        STR      R0,[SP, #+20]
        LDR      R0,[SP, #+20]
        LDR.N    R0,??DataTable3_2  ;; 0x40023830
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable3_2  ;; 0x40023830
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_2  ;; 0x40023830
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x1
        STR      R0,[SP, #+20]
        LDR      R0,[SP, #+20]
        MOV      R0,#+1024
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+7
        STR      R0,[SP, #+16]
        MOV      R1,SP
        LDR.N    R0,??DataTable3_3  ;; 0x40020000
        BL       HAL_GPIO_Init
        MOV      R0,#+512
        STR      R0,[SP, #+0]
        MOVS     R0,#+7
        STR      R0,[SP, #+16]
??HAL_UART_MspInit_1:
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
iputc:
??iputc_0:
        LDR.N    R1,??DataTable3_6  ;; 0x4000441c
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+25
        BPL.N    ??iputc_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable3_7  ;; 0x40004428
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SystemClock_Config:
        PUSH     {LR}
        SUB      SP,SP,#+76
        MOVS     R0,#+0
        LDR.N    R0,??DataTable3_1  ;; 0x40023840
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable3_1  ;; 0x40023840
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_1  ;; 0x40023840
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x10000000
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDR.N    R0,??DataTable3_8  ;; 0x40007000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xC000
        LDR.N    R1,??DataTable3_8  ;; 0x40007000
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_8  ;; 0x40007000
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xC000
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        MOVS     R0,#+1
        STR      R0,[SP, #+24]
        MOVS     R0,#+65536
        STR      R0,[SP, #+28]
        MOVS     R0,#+2
        STR      R0,[SP, #+48]
        MOVS     R0,#+4194304
        STR      R0,[SP, #+52]
        MOVS     R0,#+25
        STR      R0,[SP, #+56]
        MOV      R0,#+432
        STR      R0,[SP, #+60]
        MOVS     R0,#+2
        STR      R0,[SP, #+64]
        MOVS     R0,#+9
        STR      R0,[SP, #+68]
        ADD      R0,SP,#+24
        BL       HAL_RCC_OscConfig
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SystemClock_Config_0
??SystemClock_Config_1:
        B.N      ??SystemClock_Config_1
??SystemClock_Config_0:
        BL       HAL_PWREx_EnableOverDrive
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SystemClock_Config_2
??SystemClock_Config_3:
        B.N      ??SystemClock_Config_3
??SystemClock_Config_2:
        MOVS     R0,#+15
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOV      R0,#+5120
        STR      R0,[SP, #+16]
        MOV      R0,#+4096
        STR      R0,[SP, #+20]
        MOVS     R1,#+7
        ADD      R0,SP,#+4
        BL       HAL_RCC_ClockConfig
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SystemClock_Config_4
??SystemClock_Config_5:
        B.N      ??SystemClock_Config_5
??SystemClock_Config_4:
        ADD      SP,SP,#+76
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
main:
        PUSH     {R4,LR}
        SUB      SP,SP,#+24
        LDR.N    R4,??DataTable3_9
        BL       HAL_Init
        LDR.N    R0,??DataTable3_2  ;; 0x40023830
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_2  ;; 0x40023830
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_2  ;; 0x40023830
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
        LDR.N    R0,??DataTable3_10  ;; 0x40020400
        BL       HAL_GPIO_Init
        LDR.N    R0,??DataTable3  ;; 0x40004400
        LDR.N    R1,??DataTable3_11
        STR      R0,[R1, #+0]
        MOV      R0,#+9600
        LDR.N    R1,??DataTable3_11
        STR      R0,[R1, #+4]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_11
        STR      R0,[R1, #+8]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_11
        STR      R0,[R1, #+12]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_11
        STR      R0,[R1, #+16]
        MOVS     R0,#+12
        LDR.N    R1,??DataTable3_11
        STR      R0,[R1, #+20]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_11
        STR      R0,[R1, #+24]
        LDR.N    R0,??DataTable3_11
        BL       HAL_UART_Init
??main_0:
        MOVS     R0,R4
        BL       strlen
        MOV      R3,#+1000
        MOVS     R2,R0
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_11
        BL       HAL_UART_Transmit
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??DataTable3_10  ;; 0x40020400
        BL       HAL_GPIO_WritePin
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable3_10  ;; 0x40020400
        BL       HAL_GPIO_WritePin
        MOV      R0,#+1000
        BL       HAL_Delay
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable3_10  ;; 0x40020400
        BL       HAL_GPIO_WritePin
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable3_10  ;; 0x40020400
        BL       HAL_GPIO_WritePin
        MOV      R0,#+1000
        BL       HAL_Delay
        B.N      ??main_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40023840

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x40023830

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x40023844

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x4000441c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x40004428

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x40007000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x40020400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     IUART2

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "hello china."
        DC8 0, 0, 0

        END
// 
// 116 bytes in section .bss
//  16 bytes in section .rodata
// 620 bytes in section .text
// 
// 620 bytes of CODE  memory
//  16 bytes of CONST memory
// 116 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
