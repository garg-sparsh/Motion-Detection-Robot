#include<avr/io.h>

#include<util/delay.h>
#include"lcd_16.h"
#include"lcd_16.c"

void usart_init(int x)
{
UBRRL=x;
UCSRB=(1<<RXEN)|(1<<TXEN);
UCSRC=(1<<URSEL)|(1<<UCSZ0)|(1<<UCSZ1);
}

void usart_write(unsigned char data)
{
UDR=data;
while(!(UCSRA&(1<<UDRE)));
}

char usart_read()
{
while(!(UCSRA&(1<<RXC)));
return UDR;
}
main()
{
DDRB=0xff;

unsigned char data;
lcd_init(LCD_DISP_ON);
usart_init(77);

while(1)
{
data=usart_read();
if(data=='w')
{
lcd_gotoxy(0,0);
lcd_puts("Forward");
PORTB=0b00001001;
}
if(data=='a')
{
lcd_clrscr();
lcd_gotoxy(0,0);
lcd_puts("Left");
PORTB=0b00000001;
}
if(data=='s')
{
lcd_clrscr();
lcd_gotoxy(0,0);
lcd_puts("Back");

PORTB=0b00000110;
}
if(data=='d')
{
lcd_clrscr();
lcd_gotoxy(0,0);
lcd_puts("Right");
PORTB=0b00001000;
}
}
}
