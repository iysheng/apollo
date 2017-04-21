#include <string.h>
#include "stm32f767xx.h"
#include "main.h"

uint32_t freq=0;
UART_HandleTypeDef IUART2;

  
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

int main()
{  
  uint8_t *istr="hello china.";
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

  IUART2.Instance=USART2;
  /*UART_Initure.BaudRate=9600;
  UART_Initure.WordLength=UART_WORDLENGTH_8B;
  UART_Initure.Parity=UART_PARITY_NONE;
  UART_Initure.StopBits=UART_STOPBITS_1;
  UART_Initure.Mode=UART_MODE_TX_RX;
  UART_Initure.HwFlowCtl=UART_HWCONTROL_NONE;
  memcpy(&(IUART2.Init),&UART_Initure,sizeof(UART_Initure));*/
  IUART2.Init.BaudRate=9600;
  IUART2.Init.WordLength=UART_WORDLENGTH_8B;
  IUART2.Init.StopBits=UART_STOPBITS_1;
  IUART2.Init.Parity=UART_PARITY_NONE;
  IUART2.Init.Mode=UART_MODE_TX_RX;
  IUART2.Init.HwFlowCtl=UART_HWCONTROL_NONE;
  HAL_UART_Init(&IUART2);  

  while(1){
  //HAL_UART_Transmit_IT(&IUART2, istr, sizeof(istr)); 
  HAL_UART_Transmit(&IUART2, istr, strlen(istr), 1000);
  //iputc('i');
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_SET);	//PB0置1,熄灭
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_1,GPIO_PIN_SET);	//PB1置0,点亮
  HAL_Delay(1000);                                      //延时1000ms
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_RESET);	//PB0置1,熄灭
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_1,GPIO_PIN_RESET);	//PB1置0,点亮
  HAL_Delay(1000);
  }
}
