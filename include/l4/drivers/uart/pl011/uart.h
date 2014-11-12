/*
 * PL011 UART Generic driver implementation.
 * Copyright Bahadir Balban (C) 2009
 */
#ifndef __PL011_H__
#define __PL011_H__

#include INC_ARCH(io.h)
#include INC_PLAT(offsets.h)

/* Register offsets */
#define PL011_UARTDR		0x00
#define PL011_UARTRSR		0x04
#define PL011_UARTECR		0x04
#define PL011_UARTFR		0x18
#define PL011_UARTILPR		0x20
#define PL011_UARTIBRD		0x24
#define PL011_UARTFBRD		0x28
#define PL011_UARTLCR_H		0x2C
#define PL011_UARTCR		0x30
#define PL011_UARTIFLS		0x34
#define PL011_UARTIMSC		0x38
#define PL011_UARTRIS		0x3C
#define PL011_UARTMIS		0x40
#define PL011_UARTICR		0x44
#define PL011_UARTDMACR		0x48

#define databit 8
#define stopbit 1
#define ARRY_SIZE(arry) sizeof((arry))/sizeof((arry)[0])

typedef unsigned short  u8
typedef unsigned short  u16
typedef unsigned int    u32 


static unsigned long
static in check = no_check;

baudrate_arry[]={110,300,600,1200,2400,4800,9600,14400,19200,38400,57600,115200,230400,380400,460800,921600};

enum reg_type
{
	RBR=0,
    THR=0,
    DIVR_L=0,
    DIVR_H=1,
    IER=1,
    IIR,
    LCR,
    MCR,
    LSR,
    MSR,
    FIFO,
    MAX_REG,
};

enum check_type
{
	odd_check;
	even_check;
	no_check;
};


#define LCR_DIVENABLEBIT 7
#define LCR_DATABIT 0
#define LCR_STOPBIT 2
#define LCR_CHECKENABLE 3
#define LCR_CHECKBIT 4


#define IER_RECEVEINTE 0
#define IER_SENTEMPTYINTE 1
#define IER_LINESTATAINTE 2
#define IER_MODESTATAINTE 3


#define MCR_SELFTEST 4
#define MCR_INTRENABLE 3 


#define IIR_ISINTR 0
#define IIR_INTERIDENT 1


void uart_tx_char(unsigned long uart_base, char c);
char uart_rx_char(unsigned long uart_base);
void uart_init(unsigned long base);


#endif /* __PL011__UART__ */

