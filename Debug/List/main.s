///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      28/Apr/2017  20:11:33
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Apollo\gpio\main.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EWF56D.tmp
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

        EXTERN FMC_SDRAM_WriteBuffer
        EXTERN HAL_ADC_Start
        EXTERN HAL_Init
        EXTERN HAL_NVIC_EnableIRQ
        EXTERN HAL_NVIC_SetPriority
        EXTERN HAL_NVIC_SetPriorityGrouping
        EXTERN IADC
        EXTERN IC_Config
        EXTERN IC_init
        EXTERN ITIM5
        EXTERN IUART
        EXTERN KEY_init
        EXTERN LED_init
        EXTERN MPU_init
        EXTERN SDRAM_init
        EXTERN SystemClock_Config
        EXTERN TEMP_init
        EXTERN UART_init
        EXTERN printf
        EXTERN rstr
        EXTERN sprintf

        PUBLIC main
        PUBLIC mpudata
        PUBLIC mpup
        PUBLIC sdram_test
        PUBLIC sdramdata
        PUBLIC sscanf_i


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
sscanf_i:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
mpudata:
        DC32 20002000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
mpup:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
sdram_test:
        DS8 16

        ASEGN `.bss`:DATA:ROOT,0c0000000H
        DATA
sdramdata:
        DS8 16

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
main:
        PUSH     {R4,LR}
        LDR.N    R0,??main_0+0x4
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x8
        STR      R0,[R1, #+0]
        BL       HAL_Init
        BL       SystemClock_Config
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
        LDR.N    R0,??main_0+0xC
        BL       UART_init
        MOVS     R2,#+0
        LDR.N    R1,??main_0+0x10
        LDR.N    R0,??main_0+0x14
        BL       IC_init
        LDR.N    R0,??main_0+0x18
        BL       printf
        BL       TEMP_init
        LDR.N    R0,??main_0+0x1C
        BL       printf
        LDR.N    R0,??main_0+0x20
        BL       HAL_ADC_Start
        MOVS     R0,#+10
        LDR.N    R1,??main_0+0x4
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+0]
        BL       MPU_init
        BL       SDRAM_init
        MOVS     R4,#+0
        B.N      ??main_1
??main_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+1
        LDR.N    R1,??main_0+0x24
        STRB     R0,[R1, R4]
        ADDS     R4,R4,#+1
??main_1:
        CMP      R4,#+16
        BCC.N    ??main_2
        MOVS     R4,#+0
        B.N      ??main_3
??main_4:
        MOVS     R0,#-1073741824
        LDRB     R3,[R0, R4]
        MOVS     R2,R4
        LDR.N    R1,??main_0+0x28
        LDR.N    R0,??main_0+0x2C
        BL       sprintf
        LDR.N    R1,??main_0+0x2C
        ADR.N    R0,??main_0      ;; 0x25, 0x73, 0x00, 0x00
        BL       printf
        ADDS     R4,R4,#+1
??main_3:
        CMP      R4,#+16
        BCC.N    ??main_4
        MOVS     R2,#+16
        MOVS     R1,#+0
        LDR.N    R0,??main_0+0x24
        BL       FMC_SDRAM_WriteBuffer
        MOVS     R4,#+0
        B.N      ??main_5
??main_6:
        MOVS     R0,#-1073741824
        LDRB     R3,[R0, R4]
        MOVS     R2,R4
        LDR.N    R1,??main_0+0x30
        LDR.N    R0,??main_0+0x2C
        BL       sprintf
        LDR.N    R1,??main_0+0x2C
        ADR.N    R0,??main_0      ;; 0x25, 0x73, 0x00, 0x00
        BL       printf
        ADDS     R4,R4,#+1
??main_5:
        CMP      R4,#+16
        BCC.N    ??main_6
??main_7:
        B.N      ??main_7
        Nop      
        DATA
??main_0:
        DC8      0x25, 0x73, 0x00, 0x00
        DC32     mpudata
        DC32     mpup
        DC32     IUART
        DC32     IC_Config
        DC32     ITIM5
        DC32     ?_0
        DC32     ?_1
        DC32     IADC
        DC32     sdram_test
        DC32     ?_2
        DC32     rstr
        DC32     ?_4
        REQUIRE sdramdata

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 "\015\012*****Welocome to Apollo's world!*****\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 "\015\012*****Tempetuarate&TIM2 init finished!*****\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "beforevalue=%d--%d.\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%s"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_4:
        DC8 "aftervalue=%d--%d.\012\015"
        DC8 0, 0, 0

        END
// 
//  24 bytes in section .bss
//  16 bytes in section .bss    (abs)
//   4 bytes in section .data
// 144 bytes in section .rodata
// 272 bytes in section .text
// 
// 272 bytes of CODE  memory
// 144 bytes of CONST memory
//  44 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
