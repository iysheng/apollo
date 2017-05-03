#include "apollo.h"
#include "rgb.h"
#include "xiong.h"
#include "touch.h"
#include "math.h"

extern UART_HandleTypeDef IUART;
extern TIM_HandleTypeDef ITIM3;
extern TIM_HandleTypeDef ITIM5;
extern TIM_OC_InitTypeDef IConfig;
extern ADC_HandleTypeDef IADC,ICEKONG;
extern DMA_HandleTypeDef IDMA_ADC;
extern char rstr[RSTR_SIZE]; 
extern uint32_t led_flag;
extern TIM_IC_InitTypeDef IC_Config;
extern SDRAM_HandleTypeDef ISDRAM;
extern FMC_SDRAM_TimingTypeDef ISDRAM_Timing;
extern uint64_t hole_ic_value;
extern uint32_t ic_value;
extern uint8_t ic_state;
extern _ltdc_dev lcdltdc;
extern uint32_t POINT_COLOR;		//画笔颜色
extern uint32_t BACK_COLOR;
extern uint32_t SystemCoreClock;//该系统变量实时等于系统时钟sysclock
extern uint8_t lcd_led_flag;
extern _touch_dev tp_dev;
extern uint16_t dma_adc_flag;
int sscanf_i = 0;

//uint8_t mpudata[128] __attribute__((at(0x20002000)));
//__root uint8_t sdramdata[16] @ 0xc0000000;
uint8_t *mpudata=(uint8_t *)(0x20002000);

uint8_t * mpup;
uint8_t sdram_test[16];
uint16_t raw_icekong[IDAC_COUNT];
int main()
{ 
  uint32_t uitemp;
  uint16_t uline;
  float ftemp;
  uint8_t i=0;

  HAL_Init();
  CPU_CACHE_Enable();
  SystemClock_Config();//APB1:54MHZ APB2:108MHZ AHB:216MHZ
  LED_init();  
  KEY_init();
  HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_1);
  HAL_NVIC_EnableIRQ(EXTI2_IRQn);
  HAL_NVIC_SetPriority(EXTI2_IRQn, 0x0, 1);
  HAL_NVIC_EnableIRQ(EXTI3_IRQn);
  HAL_NVIC_SetPriority(EXTI3_IRQn, 0x0, 1);  

  UART_init(&IUART);

  IC_init(&ITIM5,&IC_Config,TIM_CHANNEL_1);
  //HAL_NVIC_EnableIRQ(USART2_IRQn);
  //HAL_NVIC_SetPriority(USART2_IRQn, 0x0, 0); 
  
  /* Output a message on Hyperterminal using printf function */
  printf("\r\n*****Welocome to iysheng's land!*****\n\r");
  CEKONG_init();
  TIM2_init();//导致无法输出PWM
  TIM3_init();//为什么TIM3的初始化要放在TIM2之后才可以正常工作?

  MPU_init();
  SDRAM_init();
  
  LCD_Init();
  tp_dev.init();
  HAL_NVIC_EnableIRQ(EXTI9_5_IRQn);//初始化触摸屏按键中断
  HAL_NVIC_SetPriority(EXTI9_5_IRQn, 0x0, 1);
 
  BACK_COLOR=WHITE;
  LTDC_Clear(WHITE);
  POINT_COLOR=RED;
  APPOLO_RGB(0,0,gImage_xiong);
  
  HAL_ADC_Start_DMA(&ICEKONG,(uint32_t *)raw_icekong,IDAC_COUNT);
  while(1)
  {
    /*ADC转换完成*/
    if(dma_adc_flag<<7){
    dma_adc_flag=0X00;
    while(uline<4){
    switch(uline)
    {
    case 0:{sprintf((char *)rstr,"PA4:%4dKg",raw_icekong[1]);break;}
    case 1:{sprintf((char *)rstr,"PA5:%4dN.m",raw_icekong[2]);break;}
    case 2:{sprintf((char *)rstr,"PA6:%4dcm",raw_icekong[3]);break;}
    case 3:{uitemp=raw_icekong[0];ftemp=((float)uitemp)/4095*3300;ftemp=((ftemp-760.0)/2.5)+25;
            sprintf((char *)rstr,"%0.3f",ftemp);break;}
    default:break;
    }
    LCD_ShowString(120,130+uline*80,strlen(rstr)*16,32,32,(uint8_t *)rstr);
    printf("%s\r\n",rstr);
    uline++;
    }
    uline=0;
    }
    /*捕获PWM输入*/
    if((ic_state&0x80)==0x80)
    {
      mpudata[0]++;
      ic_state&=0x3f;
      hole_ic_value=ic_state*(0xffffffff);
      hole_ic_value+=ic_value;
      ic_value=hole_ic_value/1000;
      sprintf((char *)rstr,"PWM:%6dms...%9lldus",ic_value,hole_ic_value);
      LCD_ShowString(120,50,strlen(rstr)*16,32,32,(uint8_t *)rstr);
      printf("%s\r\n",rstr);
      ic_state=0x00;
    }
    /*有按键按下*/
    if(tp_dev.sta!=0)
    {
      tp_dev.sta&=0x1f;
      while(tp_dev.sta&0x01){
        i++;
        tp_dev.sta>>=1;
      }
      for(tp_dev.sta=0;tp_dev.sta<i;tp_dev.sta++)
      {
      sprintf((char *)rstr,"%dtouchpoint,x=%3d,y=%3d",tp_dev.sta,(uint16_t)tp_dev.x[tp_dev.sta],(uint16_t)tp_dev.y[tp_dev.sta]);
      printf("%s\r\n",rstr);}
      LCD_ShowString(300,50+3*80,32*16,32,32,(uint8_t *)rstr);
      i=0;
      tp_dev.sta=0;
    }    
  }  
 /* scanf("%c",&ctemp);
  printf("%c",ctemp);
  if(ctemp != '\r')
  {
    sprintf(rstr+sscanf_i,"%c",ctemp);
    sscanf_i++;
  }
  else
  {
    printf("\n\r%s\n\r",rstr); 
    sscanf_i=0;
    memset((uint8_t*)rstr, 0, strlen(rstr));
  }*/
}
