#include "apollo.h"
#include "delay.h"

uint32_t systick_init(void)
{
  HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);
  return HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);/*1msµÄsystick¶¨Ê±ÅäÖÃ*/
}

void delay_ms(uint32_t micsec)
{
  uint32_t old_uwTick,new_uwTick;
  old_uwTick=HAL_GetTick();
  if ((0xffffffff-old_uwTick)>=micsec)
    new_uwTick=old_uwTick+micsec;
  else
  {
    new_uwTick=0xffffffff-old_uwTick;
    new_uwTick=micsec-new_uwTick;
  }
    
  while(HAL_GetTick()!=new_uwTick);  
}

/**
  * @brief  Retargets the C library printf function to the USART.
  * @param  None
  * @retval None
  */
