/*
 * Ties up platform's uart driver functions with printf
 *
 * Copyright (C) 2009 B Labs Ltd.
 */
#include <stdio.h>
#include <l4/config.h>
#include <dev/uart.h>

void UARTCharPut(unsigned int, char);

int __fputc(int c, FILE *stream)
{
	/*uart_tx_char(uart_print_base, c);*/
    UARTCharPut(0x01d0d000, c+'\0');
	return 0;
}

