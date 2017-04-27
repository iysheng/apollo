///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.11.1.13263/W32 for ARM      27/Apr/2017  18:57:46
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Apollo\gpio\main.c
//    Command line =  
//        -f C:\Users\iysheng\AppData\Local\Temp\EW9609.tmp
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

        EXTERN HAL_ADC_Start
        EXTERN HAL_Delay
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
        EXTERN MPU_set_protection
        EXTERN SystemClock_Config
        EXTERN TEMP_init
        EXTERN UART_init
        EXTERN __aeabi_uldivmod
        EXTERN hole_ic_value
        EXTERN ic_state
        EXTERN ic_value
        EXTERN printf
        EXTERN rstr
        EXTERN sprintf

        PUBLIC main
        PUBLIC mpudata
        PUBLIC mpup
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

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
main:
        PUSH     {LR}
        SUB      SP,SP,#+12
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
??main_1:
        LDR.N    R0,??main_0+0x24
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BMI.N    ??main_2
??main_3:
        LDR.N    R0,??main_0+0x4
        LDR      R0,[R0, #+0]
        LDRB     R2,[R0, #+0]
        LDR.N    R1,??main_0+0x28
        LDR.N    R0,??main_0+0x2C
        BL       sprintf
        LDR.N    R1,??main_0+0x2C
        ADR.N    R0,??main_0      ;; 0x25, 0x73, 0x00, 0x00
        BL       printf
        B.N      ??main_4
??main_2:
        LDR.N    R0,??main_0+0x4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??main_0+0x4
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+0]
        LDR.N    R0,??main_0+0x24
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??main_0+0x24
        STRB     R0,[R1, #+0]
        LDR.N    R0,??main_0+0x24
        LDRB     R0,[R0, #+0]
        MOVS     R1,#-1
        MULS     R0,R1,R0
        MOVS     R1,#+0
        LDR.N    R2,??main_0+0x30
        STRD     R0,R1,[R2, #+0]
        LDR.N    R0,??main_0+0x30
        LDRD     R2,R3,[R0, #+0]
        LDR.N    R0,??main_0+0x34
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        ADDS     R0,R2,R0
        ADCS     R1,R3,R1
        LDR.N    R2,??main_0+0x30
        STRD     R0,R1,[R2, #+0]
        LDR.N    R0,??main_0+0x30
        LDRD     R0,R1,[R0, #+0]
        MOV      R2,#+1000
        MOVS     R3,#+0
        BL       __aeabi_uldivmod
        LDR.N    R1,??main_0+0x34
        STR      R0,[R1, #+0]
        LDR.N    R0,??main_0+0x30
        LDRD     R0,R1,[R0, #+0]
        STRD     R0,R1,[SP, #+0]
        LDR.N    R0,??main_0+0x34
        LDR      R2,[R0, #+0]
        LDR.N    R1,??main_0+0x38
        LDR.N    R0,??main_0+0x2C
        BL       sprintf
        MOVS     R3,#+6
        MOVS     R2,#+0
        MOVS     R1,#+10
        MOVS     R0,#+536879104
        BL       MPU_set_protection
        LDR.N    R1,??main_0+0x2C
        ADR.N    R0,??main_0      ;; 0x25, 0x73, 0x00, 0x00
        BL       printf
        MOVS     R0,#+0
        LDR.N    R1,??main_0+0x24
        STRB     R0,[R1, #+0]
??main_4:
        MOV      R0,#+1000
        BL       HAL_Delay
        B.N      ??main_1
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
        DC32     ic_state
        DC32     ?_4
        DC32     rstr
        DC32     hole_ic_value
        DC32     ic_value
        DC32     ?_2

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
        DC8 "value=%dms,hole_value=%lldus.\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%s"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_4:
        DC8 "value=%d.\012\015"

        END
// 
//   8 bytes in section .bss
//   4 bytes in section .data
// 140 bytes in section .rodata
// 356 bytes in section .text
// 
// 356 bytes of CODE  memory
// 140 bytes of CONST memory
//  12 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
