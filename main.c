#include <string.h>
#include <stdlib.h>
#include "stm32f767xx.h"
#include "main.h"


#ifdef __GNUC__
  /* With GCC, small printf (option LD Linker->Libraries->Small printf
     set to 'Yes') calls __io_putchar() */
  #define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
  #define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif /* __GNUC__ */

#define RSTR_SIZE 32


uint32_t freq=0;
UART_HandleTypeDef IUARTX;
UART_HandleTypeDef JUART2;
  
void HAL_UART_MspInit(UART_HandleTypeDef *huart)
{
  GPIO_InitTypeDef GPIO_Initure;
  if(huart->Instance == USART2)
  {
    __HAL_RCC_USART2_CLK_ENABLE();//USART2时钟使能
    __HAL_RCC_GPIOA_CLK_ENABLE();
    GPIO_Initure.Pin=GPIO_PIN_2;
    GPIO_Initure.Mode=GPIO_MODE_AF_PP;
    GPIO_Initure.Pull=GPIO_NOPULL;
    GPIO_Initure.Speed=GPIO_SPEED_FREQ_LOW;
    GPIO_Initure.Alternate=GPIO_AF7_USART2;
    HAL_GPIO_Init(GPIOA,&GPIO_Initure); 
    GPIO_Initure.Pin=GPIO_PIN_3;
    GPIO_Initure.Alternate=GPIO_AF7_USART2;
    HAL_GPIO_Init(GPIOA,&GPIO_Initure);   
  }
  else if(huart->Instance == USART1)
  {
    __HAL_RCC_USART1_CLK_ENABLE();//USART2时钟使能
    __HAL_RCC_GPIOA_CLK_ENABLE();
    GPIO_Initure.Pin=GPIO_PIN_10;
    GPIO_Initure.Mode=GPIO_MODE_AF_PP;
    GPIO_Initure.Pull=GPIO_NOPULL;
    GPIO_Initure.Speed=GPIO_SPEED_FREQ_LOW;
    GPIO_Initure.Alternate=GPIO_AF7_USART1;
    HAL_GPIO_Init(GPIOA,&GPIO_Initure);

    GPIO_Initure.Pin=GPIO_PIN_9; 
    GPIO_Initure.Alternate=GPIO_AF7_USART1;
  }
  
}

void iputc(uint8_t ch)
{ 	
	while((USART2->ISR&0X40)==0);//循环发送,直到发送完毕   
	USART2->TDR=ch;      
}

/**
* @brief  CPU L1-Cache enable.
* @param  None
* @retval None
*/
static void CPU_CACHE_Enable(void)
{
  /* Enable I-Cache */
  SCB_EnableICache();
  /* Enable D-Cache */
  SCB_EnableDCache();
  SCB->CACR|=1<<2;   //强制D-Cache透写,如不开启,实际使用中可能遇到各种问题
}

void SystemClock_Config(void)
{
    HAL_StatusTypeDef ret = HAL_OK;
    RCC_OscInitTypeDef RCC_OscInitStructure; 
    RCC_ClkInitTypeDef RCC_ClkInitStructure;
	
    __HAL_RCC_PWR_CLK_ENABLE(); //使能PWR时钟
 
    __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);//设置调压器输出电压级别，以便在器件未以最大频率工作
      
    RCC_OscInitStructure.OscillatorType=RCC_OSCILLATORTYPE_HSE;    //时钟源为HSE
    RCC_OscInitStructure.HSEState=RCC_HSE_ON;                      //打开HSE
    RCC_OscInitStructure.PLL.PLLState=RCC_PLL_ON;				   //打开PLL
    RCC_OscInitStructure.PLL.PLLSource=RCC_PLLSOURCE_HSE;          //PLL时钟源选择HSE
    RCC_OscInitStructure.PLL.PLLM=25;	//主PLL和音频PLL分频系数(PLL之前的分频)
    RCC_OscInitStructure.PLL.PLLN=432; //主PLL倍频系数(PLL倍频)
    RCC_OscInitStructure.PLL.PLLP=2; //系统时钟的主PLL分频系数(PLL之后的分频)
    RCC_OscInitStructure.PLL.PLLQ=9; //USB/SDIO/随机数产生器等的主PLL分频系数(PLL之后的分频)
    ret=HAL_RCC_OscConfig(&RCC_OscInitStructure);//初始化
    if(ret!=HAL_OK) while(1);
    
    ret=HAL_PWREx_EnableOverDrive(); //开启Over-Driver功能
    if(ret!=HAL_OK) while(1);
    
    //选中PLL作为系统时钟源并且配置HCLK,PCLK1和PCLK2
    RCC_ClkInitStructure.ClockType=(RCC_CLOCKTYPE_SYSCLK|RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2);
    RCC_ClkInitStructure.SYSCLKSource=RCC_SYSCLKSOURCE_PLLCLK;//设置系统时钟时钟源为PLL
    RCC_ClkInitStructure.AHBCLKDivider=RCC_SYSCLK_DIV1;//AHB分频系数为1
    RCC_ClkInitStructure.APB1CLKDivider=RCC_HCLK_DIV4;//APB1分频系数为4
    RCC_ClkInitStructure.APB2CLKDivider=RCC_HCLK_DIV2;//APB2分频系数为2
    
    ret=HAL_RCC_ClockConfig(&RCC_ClkInitStructure,FLASH_LATENCY_7);//同时设置FLASH延时周期为7WS，也就是8个CPU周期。
    if(ret!=HAL_OK) while(1);
}

PUTCHAR_PROTOTYPE
{
  /* Place your implementation of fputc here */
  /* e.g. write a character to the EVAL_COM1 and Loop until the end of transmission */
  HAL_UART_Transmit(&JUART2, (uint8_t *)&ch, 1, 0xFFFF); 

  return ch;
}

int main()
{  
  uint8_t *istr="hello china.";
  uint8_t *rstr;
  UART_HandleTypeDef *IUART2;
  rstr=(uint8_t *)malloc(RSTR_SIZE*sizeof(uint8_t));
  IUART2=(UART_HandleTypeDef *)malloc(sizeof(UART_HandleTypeDef));
  memset(&JUART2,0,sizeof(UART_HandleTypeDef));
  GPIO_InitTypeDef GPIO_Initure;

  //UART_InitTypeDef UART_Initure;
  /* Enable the CPU Cache */
  //CPU_CACHE_Enable();
  
  HAL_Init();
  /* Configure the system clock to 216 MHz */
  //SystemClock_Config();
  
  __HAL_RCC_GPIOB_CLK_ENABLE();		//开启GPIOB时钟
  	
  GPIO_Initure.Pin=GPIO_PIN_0|GPIO_PIN_1; //PB0,1
  GPIO_Initure.Mode=GPIO_MODE_OUTPUT_PP;  //推挽输出
  GPIO_Initure.Pull=GPIO_PULLUP;          //上拉
  GPIO_Initure.Speed=GPIO_SPEED_HIGH;     //高速
  HAL_GPIO_Init(GPIOB,&GPIO_Initure);     //初始化GPIOB.0和GPIOB.1

   __HAL_RCC_GPIOH_CLK_ENABLE();	
  GPIO_Initure.Pin=GPIO_PIN_2|GPIO_PIN_3;
  GPIO_Initure.Mode=GPIO_MODE_IT_RISING;
  GPIO_Initure.Pull=GPIO_PULLUP;
  GPIO_Initure.Speed=GPIO_SPEED_HIGH;
  HAL_GPIO_Init(GPIOH,&GPIO_Initure);
  HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_1);
  HAL_NVIC_EnableIRQ(EXTI2_IRQn);
  HAL_NVIC_SetPriority(EXTI2_IRQn, 0x0, 1);
  HAL_NVIC_EnableIRQ(EXTI3_IRQn);
  HAL_NVIC_SetPriority(EXTI3_IRQn, 0x0, 1);
  
  JUART2.Instance=USART2;
  /*UART_Initure.BaudRate=9600;
  UART_Initure.WordLength=UART_WORDLENGTH_8B;
  UART_Initure.Parity=UART_PARITY_NONE;
  UART_Initure.StopBits=UART_STOPBITS_1;
  UART_Initure.Mode=UART_MODE_TX_RX;
  UART_Initure.HwFlowCtl=UART_HWCONTROL_NONE;
  memcpy(&(IUART2.Init),&UART_Initure,sizeof(UART_Initure));*/
  JUART2.Init.BaudRate=9600;
  JUART2.Init.WordLength=UART_WORDLENGTH_8B;
  JUART2.Init.StopBits=UART_STOPBITS_1;
  JUART2.Init.Parity=UART_PARITY_NONE;
  JUART2.Init.Mode=UART_MODE_TX_RX;
  JUART2.Init.HwFlowCtl=UART_HWCONTROL_NONE;

  HAL_UART_Init(&JUART2);
  HAL_NVIC_EnableIRQ(USART2_IRQn);
  HAL_NVIC_SetPriority(USART2_IRQn, 0x0, 0); 
  
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_SET);	//PB0置1,熄灭
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_1,GPIO_PIN_RESET);	//PB1置0,点亮
  /* Output a message on Hyperterminal using printf function */
  printf("\n\rApollo UART Printf Example: retarget the C library printf function to the UART\n\r");
  HAL_UART_Transmit_IT(&JUART2, istr, strlen(istr)); 
  while(1){
  
  if(0==HAL_UART_Receive_IT(&JUART2, rstr, RSTR_SIZE))
    HAL_UART_Transmit_IT(&JUART2, rstr, RSTR_SIZE); 
  //HAL_UART_Transmit(&JUART2, istr, strlen(istr), 1000);
  HAL_Delay(1000);                                      //延时1000ms
  }
  free(IUART2);
}

void USART2_IRQHandler(void) {
  HAL_UART_IRQHandler(&JUART2);
}

void EXTI2_IRQHandler(void) {
  __HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_2);
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_SET);	//PB0置1,熄灭
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_1,GPIO_PIN_SET);	//PB1置0,点亮  
}

void EXTI3_IRQHandler(void) {
  __HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_3);
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_RESET);	//PB0置1,熄灭
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_1,GPIO_PIN_RESET);	//PB1置0,点亮 
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
  if(GPIO_Pin == EXTI2_IRQn)
    EXTI2_IRQHandler();
  else if(GPIO_Pin == EXTI3_IRQn)
    EXTI3_IRQHandler();
}
