#include "apollo.h"

extern UART_HandleTypeDef IUART;
extern uint8_t rstr[RSTR_SIZE];  
int sscanf_i = 0;
int main()
{  
  char ctemp='q';
  //rstr=(uint8_t *)malloc(RSTR_SIZE*sizeof(uint8_t));
  
  HAL_Init();
  LED_init();  
  KEY_init();
  HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_1);
  HAL_NVIC_EnableIRQ(EXTI2_IRQn);
  HAL_NVIC_SetPriority(EXTI2_IRQn, 0x0, 1);
  HAL_NVIC_EnableIRQ(EXTI3_IRQn);
  HAL_NVIC_SetPriority(EXTI3_IRQn, 0x0, 1);

  UART_init(&IUART);
  //HAL_NVIC_EnableIRQ(USART2_IRQn);
  //HAL_NVIC_SetPriority(USART2_IRQn, 0x0, 0); 
  LED_on();
  HAL_Delay(1000);//—” ±1000ms
  /* Output a message on Hyperterminal using printf function */
  printf("*****Welocome to Apollo's world!*****\n\r");
  LED_on();
  HAL_Delay(1000);//—” ±1000ms
  LED_off();
  while(1){
  scanf("%c",&ctemp);
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
  }
  }
}
