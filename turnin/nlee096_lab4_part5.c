/*	Author: Nathan Lee nlee096@ucr.edu
 *  Partner(s) Name: none
 *	Lab Section: 022
 *	Assignment: Lab #4 Exercise #5
 *	Exercise Description: #XYX code door lock (lock + unlock using same code)
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

enum States {Start, INPUT, RELEASE} state;
unsigned char status;
unsigned char i;
unsigned char input[4];

void Tick() {
    switch(state){ // Transitions...
        case Start:
            status = 0x00;
            input[0] = 0x04;
            input[1] = 0x01;
            input[2] = 0x02;
            input[3] = 0x01;
            i= 0;
            state = INPUT;
            break;
        case INPUT:
            if(PINA == 0x00){
                state = INPUT;
            }
            else if(PINA == 0x80){
                status = 0x00;
                i = 0;
                state = INPUT;
            }
            else if(i < 3){
                if(PINA == input[i]){
                    i = i+1;
                    state = RELEASE;
                }
                else{
                    state = INPUT;
                }
            }
            else{
                if(PINA == 0x01){
                    if(status == 0x00){
                        status = 0x01;
                    }
                    else{
                        status = 0x00;
                    }
                }
                i = 0;
                state = INPUT;
                //state = CHECK;
            }
            break;
        case RELEASE:
            if(PINA == 0x80){
                status = 0x00;
                i = 0;
                state = INPUT;
            }
            else if(PINA == 0x00){
                state = INPUT;
            }
            else{
                state = RELEASE;
            }
            break;
        //case CHECK:
        //    state = INPUT;
        //    break;
        default:
            break;

    } 
    /*switch(state){ // State actions... 
        case INPUT:
            
            break;
        case RELEASE:
            
            break;
        case CHECK:
            
            
            break;
        case SWITCH:
            
            break;
        default:
            break;
    }*/
}

int main(void) {
    /* Insert DDR and PORT initializations */
    DDRA = 0x00; PORTA = 0x00;
    DDRB = 0xFF; PORTB = 0xFF;
    DDRC = 0xFF; PORTC = 0xFF;
    /* Insert your solution below */
    status = 0x00;
    i = 0;
    input[0] = 0;
            input[1] = 0;
            input[2] = 0;
            input[3] = 0;
    state = Start;
    while (1) { 
        Tick();
        PORTB = status;
        /*switch(state){
            case INPUT:
                PORTC = 0x00;
                break;
            case RELEASE:
                PORTC = 0x01;
                break;
            case CHECK:
                PORTC = 0x02;
                break;
            case SWITCH:
                PORTC = 0x03;
                break;
            case Start:
                PORTC = 0x04;
                break;
            default:
                break;
        }*/
    }
    return 1;
}

