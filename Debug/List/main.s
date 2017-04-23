///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      23/Apr/2017  23:06:45
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Apollo\gpio\main.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EW9697.tmp
//        (D:\Apollo\gpio\main.c -D STM32F767xx -lb D:\Apollo\gpio\Debug\List
//        -o D:\Apollo\gpio\Debug\Obj --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M7 -e --fpu=VFPv5_d16 --dlib_config
//        "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Full.h" -I D:\Apollo\gpio\CMSIS_header\ -I
//        D:\Apollo\gpio\CMSIS_core\ -I D:\Apollo\gpio\HAL_Driver\Inc\ -I
//        D:\Apollo\gpio\ -I D:\Apollo\gpio\Bsp\ -Ol)
//    Locale       =  C
//    List file    =  D:\Apollo\gpio\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN HAL_Delay
        EXTERN HAL_Init
        EXTERN HAL_NVIC_EnableIRQ
        EXTERN HAL_NVIC_SetPriority
        EXTERN HAL_NVIC_SetPriorityGrouping
        EXTERN IUART
        EXTERN KEY_init
        EXTERN LED_init
        EXTERN LED_off
        EXTERN LED_on
        EXTERN UART_init
        EXTERN __aeabi_memset
        EXTERN printf
        EXTERN rstr
        EXTERN scanf
        EXTERN sprintf
        EXTERN strlen

        PUBLIC main
        PUBLIC sscanf_i


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
sscanf_i:
        DS8 4

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
main:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R0,#+113
        STRB     R0,[SP, #+0]
        BL       HAL_Init
        BL       LED_init
        BL       KEY_init
        MOVS     R0,#+6
        BL       HAL_NVIC_SetPriorityGrouping
        MOVS     R0,#+8
        BL       HAL_NVIC_EnableIRQ
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+8
        BL       HAL_NVIC_SetPriority
        MOVS     R0,#+9
        BL       HAL_NVIC_EnableIRQ
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+9
        BL       HAL_NVIC_SetPriority
        LDR.N    R0,??main_0+0x4
        BL       UART_init
        BL       LED_on
        MOV      R0,#+1000
        BL       HAL_Delay
        LDR.N    R0,??main_0+0x8
        BL       printf
        BL       LED_on
        MOV      R0,#+1000
        BL       HAL_Delay
        BL       LED_off
        B.N      ??main_1
??main_2:
        LDRB     R2,[SP, #+0]
        ADR.N    R1,??main_0      ;; 0x25, 0x63, 0x00, 0x00
        LDR.N    R0,??main_0+0xC
        LDR.N    R3,??main_0+0x10
        LDR      R3,[R3, #+0]
        ADD      R0,R0,R3
        BL       sprintf
        LDR.N    R0,??main_0+0x10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??main_0+0x10
        STR      R0,[R1, #+0]
??main_1:
        MOV      R1,SP
        ADR.N    R0,??main_0      ;; 0x25, 0x63, 0x00, 0x00
        BL       scanf
        LDRB     R1,[SP, #+0]
        ADR.N    R0,??main_0      ;; 0x25, 0x63, 0x00, 0x00
        BL       printf
        LDRB     R0,[SP, #+0]
        CMP      R0,#+13
        BNE.N    ??main_2
        LDR.N    R1,??main_0+0xC
        LDR.N    R0,??main_0+0x14
        BL       printf
        MOVS     R0,#+0
        LDR.N    R1,??main_0+0x10
        STR      R0,[R1, #+0]
        LDR.N    R0,??main_0+0xC
        BL       strlen
        MOVS     R2,#+0
        LDR.N    R4,??main_0+0xC
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_memset
        B.N      ??main_1
        Nop      
        DATA
??main_0:
        DC8      0x25, 0x63, 0x00, 0x00
        DC32     IUART
        DC32     ?_0
        DC32     rstr
        DC32     sscanf_i
        DC32     ?_2

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "*****Welocome to Apollo's world!*****\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%c"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "\012\015%s\012\015"
        DC8 0

        END
// 
//   4 bytes in section .bss
//  52 bytes in section .rodata
// 216 bytes in section .text
// 
// 216 bytes of CODE  memory
//  52 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
