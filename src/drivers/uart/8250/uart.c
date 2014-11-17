/*
 * PL011 UART driver
 *
 * Copyright (C) 2009 B Labs Ltd.
 */
#include <l4/drivers/uart/pl011/uart.h>
#include INC_ARCH(io.h)


inline static int serial_8250_set_baudrate(u32 database, u32 baudrate)
{
	int ret = -1;
	int i;
	u16 divnum;
	u8 div_l;
    u8 div_h;
	u8 reg_data = 0;
	database = port->iobase;
	for(i=1; i<ARRY_SIZE(baudrate_arry);i++)
	{
	    if(baudrate_arry[i] == baudrate)
	    ret=0;
	}
	if(ret == 0)
	{
		divnum = 1843200/(16*baudrate);
		div_l = *(u8*)(&divnum);
		div_h = *(u8*)((u8*)&divnum +sizeof(u8));
        /*
        Ser_dbg("divnum = %0x;div_l=%0x;div_h=%0x.\n",divnum,div_l,div_h);
		*/

        reg_data = inb(database+LCR);
		reg_data |= (1<<LCR_DIVENABLEBIT);
		
        write(reg_data,database+LCR);
		write(div_l,database+DIVR_L);
		write(div_h,database+DIVR_H);
		
        reg_data &=~(1<<LCR_DIVENABLEBIT);
		
        write(reg_data,database+LCR);
	}
	return ret;
}

inline static int 
serial_8250_set_dataformat(u32 database, int databit, int stopbit, int check)
{
    u8
    reg_data = 0;
    u8 data_bit = 0;
    switch(databit)
    {
        case 5:
            data_bit= 0<<LCR_DATABIT;
            break;
        case 6:
            data_bit = 1<<LCR_DATABIT;
            break;
        case 7:
            data_bit = 2<<LCR_DATABIT;
            break;
        case 8:
            data_bit = 3<<LCR_DATABIT;
            break;
        default:
            return -1;
    }
    
    reg_data |= data_bit;

    if(stopbit == 1)
        reg_data &=~(1<<LCR_STOPBIT);
    
    if(check == no_check)
        reg_data &=~(1<<LCR_CHECKENABLE);
    else
    {
        if(check==odd_check)
            reg_data &=~(1<<LCR_CHECKBIT);
        else if(check == even_check)
            reg_data |= 1<<LCR_CHECKBIT;
            reg_data |= 1<< LCR_CHECKENABLE;
    }
    write(reg_data,database+LCR);
    return 0;
}

inline static void serial8250_set_enableinter(u32 database)
{
    u8 reg_data;
    
    reg_data = 0;
    
    reg_data |= 1<<IER_RECEVEINTE;
    reg_data |= 1<<IER_LINESTATAINTE;
    reg_data |= 1<<IER_MODESTATAINTE;
    
    write(reg_data,database+IER);

    reg_data = read(database+MCR);
    reg_data &=~(1<<MCR_SELFTEST);
    reg_data |= 1<<MCR_INTRENABLE;

    write(reg_data,database+MCR);
    
    return 0;
}

void uart_init(unsigned long uart_base)
{
	u16 divnum;
	u8 div_1;
	u8 div_h;
	u8 reg_date;
	u8 data_bit = 0;
	u32 database = (u32)uart_base;


	reg_data = 0;
	write(reg_date, database+FIFO);
	
	
	serial_8250_set_baudrate(database, 9600);

	serial_8250_set_dataformat(database, databit, stopbit, check)
	
	serial_8250_set_enableinter(database)
	
	read(database+MSR);
	read(datebase+LSR);
	read(database+RBR);

}


