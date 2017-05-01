#include "apollo.h"
#include "rgb.h"
#include "xiong.h"
#include "test1.h"


extern UART_HandleTypeDef IUART;
extern TIM_HandleTypeDef ITIM;
extern TIM_HandleTypeDef ITIM5;
extern TIM_OC_InitTypeDef IConfig;
extern ADC_HandleTypeDef IADC;
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
int sscanf_i = 0;

//uint8_t mpudata[128] __attribute__((at(0x20002000)));
//__root uint8_t sdramdata[16] @ 0xc0000000;
uint8_t *mpudata=(uint8_t *)(0x20002000);
//uint8_t *sdramdata=(uint8_t *)(0xc0000000);

uint8_t * mpup;
uint8_t sdram_test[16];
int main()
{ 
  static uint32_t uitemp[3];
  static uint16_t piex;
  float ftemp;
  mpup=mpudata;

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
  //TIM_init(&ITIM);
  //PWM_init(&ITIM,&IConfig,TIM_CHANNEL_4);
  IC_init(&ITIM5,&IC_Config,TIM_CHANNEL_1);
  //HAL_NVIC_EnableIRQ(USART2_IRQn);
  //HAL_NVIC_SetPriority(USART2_IRQn, 0x0, 0); 
  //LED_on();
  //HAL_Delay(1000);//延时1000ms
  /* Output a message on Hyperterminal using printf function */
  printf("\r\n*****Welocome to Apollo's world!*****\n\r");
  TEMP_init();
  printf("\r\n*****Tempetuarate&TIM2 init finished!*****\n\r");
  HAL_ADC_Start(&IADC);//转换开始
  mpudata[0]=10;
  MPU_init();
  SDRAM_init();
  LCD_Init();
  /*for(uitemp=0;uitemp<16;uitemp++)
  {
    sdram_test[uitemp]=uitemp*2;
  }
  for(uitemp=0;uitemp<16;uitemp++)
  {
  sprintf((char *)rstr,"beforevalue=%d--%d.\n\r",uitemp,sdramdata[uitemp]);
  printf("%s",rstr);
  }
  FMC_SDRAM_WriteBuffer(sdram_test,0x00,16);
  for(uitemp=0;uitemp<16;uitemp++)
  {
  sprintf((char *)rstr,"aftervalue=%d--%d.\n\r",uitemp,sdramdata[uitemp]);
  printf("%s",rstr);
  }*/
  //FMC_SDRAM_ReadBuffer(sdram_test+1,0x00,16);
  //sprintf((char *)rstr,"value=%d--%d.\n\r",sdram_test[0],sdram_test[1]);
  //printf("%s",rstr);
  BACK_COLOR=BLUE;
  LTDC_Clear(BLUE);
  POINT_COLOR=RED;
  sprintf((char *)rstr,"%s","https://github.com/iysheng/apollo");
  LCD_ShowString(0,272,10+strlen(rstr)*16,32,32,rstr); 

    for(uitemp[0]=0;uitemp[0]<240;uitemp[0]++)
    {
      for(uitemp[1]=0;uitemp[1]<480;)
      {
      //piex=((gImage_xiong[480*uitemp[0]+uitemp[1]]+1)<<8)|(gImage_xiong[480*uitemp[0]+uitemp[1]]);
      piex=((gImage_xiong[480*uitemp[0]+uitemp[1]])<<8)|(gImage_xiong[480*uitemp[0]+uitemp[1]+1]);
      LTDC_Draw_Point(uitemp[0],uitemp[1]/2,(uint32_t)(piex));
      uitemp[1]+=2;
      }
    }
  HAL_Delay(1000);  
    for(uitemp[0]=0;uitemp[0]<426;uitemp[0]++)
    {
      for(uitemp[1]=0;uitemp[1]<480;)
      {
      //piex=((gImage_xiong[480*uitemp[0]+uitemp[1]]+1)<<8)|(gImage_xiong[480*uitemp[0]+uitemp[1]]);
      piex=((gImage_test1[480*uitemp[0]+uitemp[1]])<<8)|(gImage_test1[480*uitemp[0]+uitemp[1]+1]);
      LTDC_Draw_Point(uitemp[0]+240,uitemp[1]/2,(uint32_t)(piex));
      uitemp[1]+=2;
      }
    }
HAL_Delay(1000);
    APPOLO_RGB(0,0,gImage_xiong);
    while(1)
  {
    
    HAL_Delay(1000);
  }
  
#if 0
  while(1){
  if((ic_state&0x80)==0x80)
  {
    mpudata[0]++;
    ic_state&=0x3f;
    hole_ic_value=ic_state*(0xffffffff);
    hole_ic_value+=ic_value;
    ic_value=hole_ic_value/1000;
    sprintf((char *)rstr,"value=%dms,hole_value=%lldus.\n\r",ic_value,hole_ic_value);
    MPU_set_protection(0x20002000,10,MPU_REGION_NUMBER0,MPU_REGION_PRIV_RO_URO );
    printf("%s",rstr);
    ic_state=0x00;
  }
  else
  {sprintf((char *)rstr,"value=%d.\n\r",mpudata[0]);
  printf("%s",rstr);}
  HAL_Delay(1000);
    
  /*
  (IConfig.Pulse)++;
  HAL_TIM_PWM_ConfigChannel(&ITIM,&IConfig,TIM_CHANNEL_4);
  HAL_TIM_PWM_Start(&ITIM,TIM_CHANNEL_4);  
  if(IConfig.Pulse>195)
    IConfig.Pulse=1;
  HAL_Delay(100);    
  */
  /*HAL_ADC_PollForConversion(&IADC,HAL_MAX_DELAY);
  uitemp=HAL_ADC_GetValue(&IADC);
  ftemp=((float)uitemp)/4095*3300;
  ftemp=((ftemp-760.0)/2.5)+25;
  sprintf((char *)rstr,"tem=%f**sclk=%d.\n\r",ftemp,SystemCoreClock);
  printf("%s",rstr);
  */ 
  //HAL_Delay(1000);  
  /*scanf("%s",stemp);
  printf("%s",stemp);
  memset(stemp, 0, strlen(stemp));*/
    
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
#endif
}
