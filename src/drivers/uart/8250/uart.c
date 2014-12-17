/*
 * COM1 NS16550 support
 * originally from linux source (arch/ppc/boot/ns16550.c)
 * modified to use CONFIG_SYS_ISA_MEM and new defines
 */

/*#include <config.h>
*/

#include <l4/drivers/uart/8250/uart.h>
#include "uart_am1808.h"

void uart_init(unsigned long uart_base)
{
}

char uart_rx_char(unsigned long uart_base)
{
    return 'a';
}

void uart_tx_char(unsigned long uart_base, char c)
{
    UARTCharPut(uart_base, c);
}

void uart_set_baudrate(unsigned long uart_base, unsigned int val)
{
}

