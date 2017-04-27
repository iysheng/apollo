#include "apollo.h"

extern UART_HandleTypeDef IUART;
extern TIM_HandleTypeDef ITIM;
extern TIM_HandleTypeDef ITIM5;
extern TIM_OC_InitTypeDef IConfig;
extern ADC_HandleTypeDef IADC;
extern uint8_t rstr[RSTR_SIZE]; 
extern uint32_t led_flag;
extern TIM_IC_InitTypeDef IC_Config;
extern uint64_t hole_ic_value;
extern uint32_t ic_value;
extern uint8_t ic_state;
extern uint32_t SystemCoreClock;//该系统变量实时等于系统时钟sysclock
int sscanf_i = 0;

int main()
{ 
  uint32_t uitemp;
  float ftemp;
  
  HAL_Init();
  //CPU_CACHE_Enable();
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
  
  while(1){
  if((ic_state&0x80)==0x80)
  {
    ic_state&=0x3f;
    hole_ic_value=ic_state*(0xffffffff);
    hole_ic_value+=ic_value;
    ic_value=hole_ic_value/1000;
    sprintf((char *)rstr,"value=%dms,hole_value=%lldus.\n\r",ic_value,hole_ic_value);
    printf("%s",rstr);
    ic_state=0x00;
  }
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
}
