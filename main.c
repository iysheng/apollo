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
    __HAL_RCC_USART2_CLK_ENABLE();//USART2ʱ��ʹ��
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
    __HAL_RCC_USART1_CLK_ENABLE();//USART2ʱ��ʹ��
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
	while((USART2->ISR&0X40)==0);//ѭ������,ֱ���������   
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
  SCB->CACR|=1<<2;   //ǿ��D-Cache͸д,�粻����,ʵ��ʹ���п���������������
}

void SystemClock_Config(void)
{
    HAL_StatusTypeDef ret = HAL_OK;
    RCC_OscInitTypeDef RCC_OscInitStructure; 
    RCC_ClkInitTypeDef RCC_ClkInitStructure;
	
    __HAL_RCC_PWR_CLK_ENABLE(); //ʹ��PWRʱ��
 
    __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);//���õ�ѹ�������ѹ�����Ա�������δ�����Ƶ�ʹ���
      
    RCC_OscInitStructure.OscillatorType=RCC_OSCILLATORTYPE_HSE;    //ʱ��ԴΪHSE
    RCC_OscInitStructure.HSEState=RCC_HSE_ON;                      //��HSE
    RCC_OscInitStructure.PLL.PLLState=RCC_PLL_ON;				   //��PLL
    RCC_OscInitStructure.PLL.PLLSource=RCC_PLLSOURCE_HSE;          //PLLʱ��Դѡ��HSE
    RCC_OscInitStructure.PLL.PLLM=25;	//��PLL����ƵPLL��Ƶϵ��(PLL֮ǰ�ķ�Ƶ)
    RCC_OscInitStructure.PLL.PLLN=432; //��PLL��Ƶϵ��(PLL��Ƶ)
    RCC_OscInitStructure.PLL.PLLP=2; //ϵͳʱ�ӵ���PLL��Ƶϵ��(PLL֮��ķ�Ƶ)
    RCC_OscInitStructure.PLL.PLLQ=9; //USB/SDIO/������������ȵ���PLL��Ƶϵ��(PLL֮��ķ�Ƶ)
    ret=HAL_RCC_OscConfig(&RCC_OscInitStructure);//��ʼ��
    if(ret!=HAL_OK) while(1);
    
    ret=HAL_PWREx_EnableOverDrive(); //����Over-Driver����
    if(ret!=HAL_OK) while(1);
    
    //ѡ��PLL��Ϊϵͳʱ��Դ��������HCLK,PCLK1��PCLK2
    RCC_ClkInitStructure.ClockType=(RCC_CLOCKTYPE_SYSCLK|RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2);
    RCC_ClkInitStructure.SYSCLKSource=RCC_SYSCLKSOURCE_PLLCLK;//����ϵͳʱ��ʱ��ԴΪPLL
    RCC_ClkInitStructure.AHBCLKDivider=RCC_SYSCLK_DIV1;//AHB��Ƶϵ��Ϊ1
    RCC_ClkInitStructure.APB1CLKDivider=RCC_HCLK_DIV4;//APB1��Ƶϵ��Ϊ4
    RCC_ClkInitStructure.APB2CLKDivider=RCC_HCLK_DIV2;//APB2��Ƶϵ��Ϊ2
    
    ret=HAL_RCC_ClockConfig(&RCC_ClkInitStructure,FLASH_LATENCY_7);//ͬʱ����FLASH��ʱ����Ϊ7WS��Ҳ����8��CPU���ڡ�
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
  
  __HAL_RCC_GPIOB_CLK_ENABLE();		//����GPIOBʱ��
  	
  GPIO_Initure.Pin=GPIO_PIN_0|GPIO_PIN_1; //PB0,1
  GPIO_Initure.Mode=GPIO_MODE_OUTPUT_PP;  //�������
  GPIO_Initure.Pull=GPIO_PULLUP;          //����
  GPIO_Initure.Speed=GPIO_SPEED_HIGH;     //����
  HAL_GPIO_Init(GPIOB,&GPIO_Initure);     //��ʼ��GPIOB.0��GPIOB.1

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
  
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_SET);	//PB0��1,Ϩ��
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_1,GPIO_PIN_RESET);	//PB1��0,����
  /* Output a message on Hyperterminal using printf function */
  printf("\n\rApollo UART Printf Example: retarget the C library printf function to the UART\n\r");
  HAL_UART_Transmit_IT(&JUART2, istr, strlen(istr)); 
  while(1){
  
  if(0==HAL_UART_Receive_IT(&JUART2, rstr, RSTR_SIZE))
    HAL_UART_Transmit_IT(&JUART2, rstr, RSTR_SIZE); 
  //HAL_UART_Transmit(&JUART2, istr, strlen(istr), 1000);
  HAL_Delay(1000);                                      //��ʱ1000ms
  }
  free(IUART2);
}

void USART2_IRQHandler(void) {
  HAL_UART_IRQHandler(&JUART2);
}

void EXTI2_IRQHandler(void) {
  __HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_2);
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_SET);	//PB0��1,Ϩ��
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_1,GPIO_PIN_SET);	//PB1��0,����  
}

void EXTI3_IRQHandler(void) {
  __HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_3);
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_RESET);	//PB0��1,Ϩ��
  HAL_GPIO_WritePin(GPIOB,GPIO_PIN_1,GPIO_PIN_RESET);	//PB1��0,���� 
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
  if(GPIO_Pin == EXTI2_IRQn)
    EXTI2_IRQHandler();
  else if(GPIO_Pin == EXTI3_IRQn)
    EXTI3_IRQHandler();
}
