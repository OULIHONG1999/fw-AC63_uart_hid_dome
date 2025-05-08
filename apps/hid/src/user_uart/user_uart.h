#ifndef _USER_UART_H_
#define _USER_UART_H_

#include "system/includes.h"

#define TX IO_PORTA_01
#define RX IO_PORTA_02

void user_uart_init(u32 baud);
void uart_callback_register(void (*callback)(unsigned char *, unsigned short));
void user_uart_send(u8 *buf, u8 len);

#endif // !_USER_UART_H_
