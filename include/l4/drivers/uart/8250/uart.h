/*
 * NS16550 Serial Port
 * originally from linux source (arch/ppc/boot/ns16550.h)
 *
 * Cleanup and unification
 * (C) 2009 by Detlev Zundel, DENX Software Engineering GmbH
 *
 * modified slightly to
 * have addresses as offsets from CONFIG_SYS_ISA_BASE
 * added a few more definitions
 * added prototypes for ns16550.c
 * reduced no of com ports to 2
 * modifications (c) Rob Taylor, Flying Pig Systems. 2000.
 *
 * added support for port on 64-bit bus
 * by Richard Danter (richard.danter@windriver.com), (C) 2005 Wind River Systems
 */

/*
 * Note that the following macro magic uses the fact that the compiler
 * will not allocate storage for arrays of size 0
 */
#ifndef __8250_H__
#define __8250_H__

void uart_tx_char(unsigned long uart_base, char c);
char uart_rx_char(unsigned long uart_base);
void uart_init(unsigned long base);

#define SS8250_BASE 0x01d0d0000

#endif


