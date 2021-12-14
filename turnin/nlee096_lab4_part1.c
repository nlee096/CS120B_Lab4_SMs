/*	Author: Nathan Lee nlee096@ucr.edu
 *  Partner(s) Name: none
 *	Lab Section: 022
 *	Assignment: Lab #4 Exercise #1
 *	Exercise Description: 2 LED alternating. 1 button
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

enum States {Start, OFF_RELEASE, ON_PRESS, ON_RELEASE, OFF_PRESS} state;
unsigned char tmpB;

void Tick() {
    switch(state){ // Transitions...
        case Start:
            tmpB = 0x01;
            state = OFF_RELEASE;
            break;
        case OFF_RELEASE:
            if(PINA == 0x01){
                tmpB = 0x02;
                state = ON_PRESS;
            }
            else{
                state = OFF_RELEASE;
            }
            break;
        case OFF_PRESS:
            if(PINA == 0x01){
                state = OFF_PRESS;
            }
            else{
                state = OFF_RELEASE;
            }
            break;
        case ON_PRESS:
            if(PINA == 0x01){
                state = ON_PRESS;
            }
            else{
                state = ON_RELEASE;
            }
            break;
        case ON_RELEASE:
            if(PINA == 0x01){
                tmpB = 0x01;
                state = OFF_PRESS;
            }
            else{
                state = ON_RELEASE;
            }
            break;
        default:
            break;

    } 
    //switch(state){ // State actions... 
    //}
}

int main(void) {
    /* Insert DDR and PORT initializations */
    DDRA = 0x00; PORTA = 0x00;
    DDRB = 0xFF; PORTB = 0xFF;
    /* Insert your solution below */
    tmpB = 0x00;
    state = Start;
    while (1) { 
        Tick();
        PORTB = tmpB;
    }
    return 1;
}

