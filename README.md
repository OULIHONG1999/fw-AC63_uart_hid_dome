# 杰理AC632n测试程序

#### 介绍
- 启用spp_and_le dome
- 关闭部分功能，在配置头文件中
- 实现所有io定时反转
- 使用DP引脚打印输出日志






# [B站主页](https://space.bilibili.com/3546810423445874?spm_id_from=333.1387.fans.user_card.click)
# [杰理AC632N官方介绍](https://doc.zh-jieli.com/vue/#/docs/ac63)

![输入图片说明](image/AC6321.png)
## [杰理AC6321A购买连接](https://item.taobao.com/item.htm?ft=t&id=844438677259)

![输入图片说明](image/AC6323.png)
## [杰理AC6323A购买连接](https://item.taobao.com/item.htm?ft=t&id=844641938402)

## [杰理AC632N系列芯片开发环境快速搭建教程](https://www.bilibili.com/video/BV1LmqrYkEZo/?share_source=copy_web&vd_source=e72126e3b43c199d53df27684cb64c62)

## [杰理AC632n系列芯片的SDK基本介绍和程序烧录演示](https://www.bilibili.com/video/BV183XwYZELM/?share_source=copy_web&vd_source=e72126e3b43c199d53df27684cb64c62)





## 示例代码
 
  - 主函数io测试代码(apps\spp_and_le\app_main.c)
``` C
// #include "asm/gpio.h"

#define MAX_GPIO_NUM 24

unsigned char PIN[MAX_GPIO_NUM] = {
    IO_PORTA_00, IO_PORTA_01, IO_PORTA_02, IO_PORTA_03, IO_PORTA_04, IO_PORTA_05, IO_PORTA_06, IO_PORTA_07, IO_PORTA_08, IO_PORTA_09,
    IO_PORTB_00, IO_PORTB_01, IO_PORTB_02, IO_PORTB_03, IO_PORTB_04, IO_PORTB_05, IO_PORTB_06, IO_PORTB_07, IO_PORTB_08, IO_PORTB_09,
    IO_PORT_DP1, IO_PORT_DM1};

void init_gpio_pin(void)
{
    for (size_t i = 0; i < MAX_GPIO_NUM; i++)
    {
        gpio_set_direction(PIN[i], 0);
        gpio_set_pull_down(PIN[i], 1);
        gpio_set_pull_up(PIN[i], 0);
    }
}

void blink_led()
{
    static unsigned char led_state = 0;
    for (unsigned char i = 0; i < MAX_GPIO_NUM; i++)
    {
        gpio_set_output_value(PIN[i], led_state);
    }
    printf("led state: %d\n", led_state);
    led_state = !led_state;
}

extern void my_led_test(void);
void user_main()
{
    printf("Hello 杰理!\n");
    init_gpio_pin();
    // my_led_test();

    sys_s_hi_timer_add(NULL, blink_led, 200);
}
```




- 创建线程接口(include_lib\system\os\os_api.h)
``` C
/* --------------------------------------------------------------------------*/
/**
 * @brief 创建任务
 *
 * @param task 任务回调函数
 * @param p_arg 传递给任务回调函数的参数
 * @param prio 任务的优先级
 * @param stksize 任务的堆栈大小, 单位(u32)
 * @param qsize 任务的queue大小，单位(byte)
 * @param name 任务名 (名字长度不能超过configMAX_TASK_NAME_LEN字节)
 *
 * @return 错误码
 */
/* ----------------------------------------------------------------------------*/
int os_task_create(void (*task)(void *p_arg),
                   void *p_arg,
                   u8 prio,
                   u32 stksize,
                   int qsize,
                   const char *name);
```



