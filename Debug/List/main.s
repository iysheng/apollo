///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      24/Apr/2017  15:28:48
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Apollo\gpio\main.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EW35BB.tmp
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

        EXTERN HAL_ADC_GetValue
        EXTERN HAL_ADC_PollForConversion
        EXTERN HAL_ADC_Start
        EXTERN HAL_Delay
        EXTERN HAL_Init
        EXTERN HAL_NVIC_EnableIRQ
        EXTERN HAL_NVIC_SetPriority
        EXTERN HAL_NVIC_SetPriorityGrouping
        EXTERN IADC
        EXTERN IUART
        EXTERN KEY_init
        EXTERN LED_init
        EXTERN LED_on
        EXTERN TEMP_init
        EXTERN UART_init
        EXTERN printf
        EXTERN rstr
        EXTERN sprintf

        PUBLIC main
        PUBLIC sscanf_i


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
sscanf_i:
        DS8 4

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
main:
        PUSH     {R7,LR}
        MOVS     R0,#+113
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
        BL       TEMP_init
        LDR.N    R0,??main_0+0xC
        BL       printf
        LDR.N    R0,??main_0+0x10
        BL       HAL_ADC_Start
??main_1:
        MOVS     R1,#-1
        LDR.N    R0,??main_0+0x10
        BL       HAL_ADC_PollForConversion
        LDR.N    R0,??main_0+0x10
        BL       HAL_ADC_GetValue
        VMOV     S0,R0
        VCVT.F32.U32 S0,S0
        VLDR.W   S1,??main_0+0x14  ;; 0x457ff000
        VDIV.F32 S0,S0,S1
        VLDR.W   S1,??main_0+0x18  ;; 0x454e4000
        VMUL.F32 S0,S0,S1
        VCVT.F64.F32 D0,S0
        VLDR.W   D2,??main_0+0x1C
        VADD.F64 D0,D0,D2
        VMOV.F64 D2,#2.5
        VDIV.F64 D0,D0,D2
        VMOV.F64 D2,#25.0
        VADD.F64 D0,D0,D2
        VCVT.F32.F64 S0,D0
        VCVT.F64.F32 D0,S0
        VMOV     R2,R3,D0
        LDR.N    R1,??main_0+0x24
        LDR.N    R0,??main_0+0x28
        BL       sprintf
        LDR.N    R1,??main_0+0x28
        ADR.N    R0,??main_0      ;; 0x25, 0x73, 0x00, 0x00
        BL       printf
        MOV      R0,#+1000
        BL       HAL_Delay
        B.N      ??main_1
        DATA
??main_0:
        DC8      0x25, 0x73, 0x00, 0x00
        DC32     IUART
        DC32     ?_0
        DC32     ?_1
        DC32     IADC
        DC32     0x457ff000
        DC32     0x454e4000
        DC32     0x0,0xC087C000
        DC32     ?_2
        DC32     rstr

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
?_1:
        DC8 "\015\012*****Tempurate init finished!*****\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "the tempture is %f.\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%s"
        DC8 0

        END
// 
//   4 bytes in section .bss
// 108 bytes in section .rodata
// 244 bytes in section .text
// 
// 244 bytes of CODE  memory
// 108 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: 4
