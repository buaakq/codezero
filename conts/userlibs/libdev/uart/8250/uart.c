/*
 * COM1 NS16550 support
 * originally from linux source (arch/ppc/boot/ns16550.c)
 * modified to use CONFIG_SYS_ISA_MEM and new defines
 */

/*#include <config.h>
*/

#include <dev/uart.h>
#include <dev/io.h>
#include "uart.h"

#define UART_LCRVAL UART_LCR_8N1		/* 8 data, 1 stop, no parity */
#define UART_MCRVAL (UART_MCR_DTR | \
		     UART_MCR_RTS)		/* RTS/DTR */
#define UART_FCRVAL (UART_FCR_FIFO_EN |	\
		     UART_FCR_RXSR |	\
		     UART_FCR_TXSR)		/* Clear & enable FIFOs */

#define MODE_X_DIV 16

static long  cal_divisor(unsigned int baudrate);
static long  cal_divisor(unsigned int baudrate);
static void NS16550_init (NS16550_t com_port, unsigned int baud_divisor);
static void NS16550_putc (NS16550_t com_port, char c); 
static char NS16550_getc (NS16550_t com_port);

void uart_init(unsigned long uart_base)
{
    unsigned int baud_divisor, baudrate = 115200;
    baud_divisor = cal_divisor(baudrate);
    NS16550_init((NS16550_t)uart_base, baud_divisor);
}

char uart_rx_char(unsigned long uart_base)
{
    return NS16550_getc((NS16550_t)uart_base);
}

void uart_tx_char(unsigned long uart_base, char c)
{
    NS16550_putc((NS16550_t)uart_base, c);
}

void uart_set_baudrate(unsigned long uart_base, unsigned int val)
{
    unsigned int baud_divisor;
    baud_divisor = cal_divisor(val);
    NS16550_t com_port = (NS16550_t)uart_base;
    
	com_port->dll = baud_divisor & 0xff;
	com_port->dlm = (baud_divisor >> 8) & 0xff;
}

static long  cal_divisor(unsigned int baudrate)
{
    const unsigned int clk = 24000000;
    return (clk + (baudrate * (MODE_X_DIV / 2))) / (MODE_X_DIV * baudrate);   
}

static void NS16550_init (NS16550_t com_port, unsigned int baud_divisor)
{
	com_port->ier = 0x00;
/*
#if defined(CONFIG_OMAP) && !defined(CONFIG_OMAP3_ZOOM2)
	com_port->mdr1 = 0x7;	
#endif
*/
	com_port->lcr = UART_LCR_BKSE | UART_LCRVAL;
	com_port->dll = 0;
	com_port->dlm = 0;
	com_port->lcr = UART_LCRVAL;
	com_port->mcr = UART_MCRVAL;
	com_port->fcr = UART_FCRVAL;
	com_port->lcr = UART_LCR_BKSE | UART_LCRVAL;
	com_port->dll = baud_divisor & 0xff;
	com_port->dlm = (baud_divisor >> 8) & 0xff;
	com_port->lcr = UART_LCRVAL;
/*
#if defined(CONFIG_OMAP) && !defined(CONFIG_OMAP3_ZOOM2)
#if defined(CONFIG_APTIX)
	com_port->mdr1 = 3;	
#else
	com_port->mdr1 = 0;	
#endif
#endif 
*/
}

/*
#ifndef CONFIG_NS16550_MIN_FUNCTIONS
*/
/*
static void NS16550_reinit (NS16550_t com_port, int baud_divisor)
{
	com_port->ier = 0x00;
	com_port->lcr = UART_LCR_BKSE | UART_LCRVAL;
	com_port->dll = 0;
	com_port->dlm = 0;
	com_port->lcr = UART_LCRVAL;
	com_port->mcr = UART_MCRVAL;
	com_port->fcr = UART_FCRVAL;
	com_port->lcr = UART_LCR_BKSE;
	com_port->dll = baud_divisor & 0xff;
	com_port->dlm = (baud_divisor >> 8) & 0xff;
	com_port->lcr = UART_LCRVAL;
}
*/
/*
#endif
*/
/* CONFIG_NS16550_MIN_FUNCTIONS */

static void NS16550_putc (NS16550_t com_port, char c)
{
	while ((com_port->lsr & UART_LSR_THRE) == 0);
	com_port->thr = c;
}

/*
#ifndef CONFIG_NS16550_MIN_FUNCTIONS
*/
static char NS16550_getc (NS16550_t com_port)
{
	while ((com_port->lsr & UART_LSR_DR) == 0) {
/*
#ifdef CONFIG_USB_TTY
*/
/*
        extern void usbtty_poll(void);
		usbtty_poll();
*/
/*
#endif
*/
	}
	return (com_port->rbr);
}

/*
static int NS16550_tstc (NS16550_t com_port)
{
	return ((com_port->lsr & UART_LSR_DR) != 0);
}
*/

/*
#endif
*/

unsigned long uart_print_base;

void platform_init(void)
{
    uart_print_base = SS8250_BASE ;

#if defined(VARIANT_BAREMETAL)    
    uart_init(uart_print_base);
#endif


}



