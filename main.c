#include "apollo.h"

extern UART_HandleTypeDef IUART;
extern TIM_HandleTypeDef ITIM;
extern ADC_HandleTypeDef IADC;
extern uint8_t rstr[RSTR_SIZE]; 
extern uint32_t led_flag;
int sscanf_i = 0;
int main()
{ 
  char stemp[32];
  char ctemp='q';
  int dtemp;
  uint32_t uitemp;
  float ftemp;
  
  HAL_Init();
  LED_init();  
  KEY_init();
  HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_1);
  HAL_NVIC_EnableIRQ(EXTI2_IRQn);
  HAL_NVIC_SetPriority(EXTI2_IRQn, 0x0, 1);
  HAL_NVIC_EnableIRQ(EXTI3_IRQn);
  HAL_NVIC_SetPriority(EXTI3_IRQn, 0x0, 1);

  UART_init(&IUART);
  TIM_init(&ITIM);
  //HAL_NVIC_EnableIRQ(USART2_IRQn);
  //HAL_NVIC_SetPriority(USART2_IRQn, 0x0, 0); 
  //LED_on();
  //HAL_Delay(1000);//延时1000ms
  /* Output a message on Hyperterminal using printf function */
  printf("\r\n*****Welocome to Apollo's world!*****\n\r");
  TPAD_init();
  printf("\r\n*****Tempetuarate&TIM2 init finished!*****\n\r");
  //LED_on();
  //HAL_Delay(1000);//延时1000ms
  //LED_off();
  HAL_ADC_Start(&IADC);//准换开始
  
  while(1){
  HAL_ADC_PollForConversion(&IADC,HAL_MAX_DELAY);
  uitemp=HAL_ADC_GetValue(&IADC);
  ftemp=((float)uitemp)/4095*3300;
  //ftemp=((ftemp-760.0)/2.5)+25;
  sprintf((char *)rstr,"tempture is %f**%d.\n\r",ftemp,led_flag);
  printf("%s",rstr);
  HAL_Delay(1000);  
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
