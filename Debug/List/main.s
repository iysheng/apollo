///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      03/May/2017  19:30:40
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Apollo\gpio\main.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EWCA49.tmp
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

        EXTERN CEKONG_init
        EXTERN CPU_CACHE_Enable
        EXTERN HAL_ADC_Start_DMA
        EXTERN HAL_Init
        EXTERN HAL_NVIC_EnableIRQ
        EXTERN HAL_NVIC_SetPriority
        EXTERN HAL_NVIC_SetPriorityGrouping
        EXTERN ICEKONG
        EXTERN IC_Config
        EXTERN IC_init
        EXTERN IConfig
        EXTERN ITIM3
        EXTERN ITIM5
        EXTERN IUART
        EXTERN KEY_init
        EXTERN LED_init
        EXTERN MPU_init
        EXTERN PWM_init
        EXTERN SDRAM_init
        EXTERN SystemClock_Config
        EXTERN TIM2_init
        EXTERN UART_init
        EXTERN dma_adc_flag
        EXTERN printf
        EXTERN rstr
        EXTERN sprintf

        PUBLIC main
        PUBLIC mpudata
        PUBLIC mpup
        PUBLIC raw_icekong
        PUBLIC sdram_test
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

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
raw_icekong:
        DS8 8

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
main:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R0,#+0
        LDR.N    R0,??main_0+0x4
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x8
        STR      R0,[R1, #+0]
        BL       HAL_Init
        BL       CPU_CACHE_Enable
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
        MOVS     R2,#+12
        LDR.N    R1,??main_0+0x10
        LDR.N    R0,??main_0+0x14
        BL       PWM_init
        MOVS     R2,#+0
        LDR.N    R1,??main_0+0x18
        LDR.N    R0,??main_0+0x1C
        BL       IC_init
        LDR.N    R0,??main_0+0x20
        BL       printf
        BL       TIM2_init
        BL       CEKONG_init
        LDR.N    R0,??main_0+0x24
        BL       printf
        BL       MPU_init
        BL       SDRAM_init
        MOVS     R2,#+4
        LDR.N    R1,??main_0+0x40
        LDR.N    R0,??main_0+0x28
        BL       HAL_ADC_Start_DMA
??main_1:
        LDR.N    R0,??main_0+0x2C
        LDRB     R0,[R0, #+0]
        AND      R0,R0,#0xFF
        CMP      R0,#+1
        BNE.N    ??main_1
        MOVS     R0,#+0
        LDR.N    R1,??main_0+0x2C
        STRH     R0,[R1, #+0]
        LDR.N    R0,??main_0+0x40
        LDRH     R0,[R0, #+0]
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        VLDR.W   S1,??main_0+0x30  ;; 0x457ff000
        VDIV.F32 S0,S0,S1
        VLDR.W   S1,??main_0+0x34  ;; 0x454e4000
        VMUL.F32 S0,S0,S1
        VCVT.F64.F32 D0,S0
        VLDR.W   D2,??main_0+0x38
        VADD.F64 D0,D0,D2
        VMOV.F64 D2,#2.5
        VDIV.F64 D0,D0,D2
        VMOV.F64 D2,#25.0
        VADD.F64 D0,D0,D2
        VCVT.F32.F64 S0,D0
        LDR.N    R0,??main_0+0x40
        LDRH     R0,[R0, #+6]
        STR      R0,[SP, #+16]
        LDR.N    R0,??main_0+0x40
        LDRH     R0,[R0, #+4]
        STR      R0,[SP, #+12]
        LDR.N    R0,??main_0+0x40
        LDRH     R0,[R0, #+2]
        STR      R0,[SP, #+8]
        VCVT.F64.F32 D0,S0
        VSTR     D0,[SP, #+0]
        LDR.N    R0,??main_0+0x40
        LDRH     R2,[R0, #+0]
        LDR.N    R1,??main_0+0x44
        LDR.N    R0,??main_0+0x48
        BL       sprintf
        LDR.N    R1,??main_0+0x48
        LDR.N    R0,??main_0
        BL       printf
        B.N      ??main_1
        Nop      
        DATA
??main_0:
        DC32     ?_3
        DC32     mpudata
        DC32     mpup
        DC32     IUART
        DC32     IConfig
        DC32     ITIM3
        DC32     IC_Config
        DC32     ITIM5
        DC32     ?_0
        DC32     ?_1
        DC32     ICEKONG
        DC32     dma_adc_flag
        DC32     0x457ff000
        DC32     0x454e4000
        DC32     0x0,0xC087C000
        DC32     raw_icekong
        DC32     ?_2
        DC32     rstr

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
        DC8 "temp:raw%d--%0.4f...pa4:%d...pa5:%d...pa6:%d\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_3:
        DC8 "%s\015\012"
        DC8 0, 0, 0

        END
// 
//  32 bytes in section .bss
//   4 bytes in section .data
// 148 bytes in section .rodata
// 340 bytes in section .text
// 
// 340 bytes of CODE  memory
// 148 bytes of CONST memory
//  36 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
