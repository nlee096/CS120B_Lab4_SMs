/*	Author: Nathan Lee nlee096@ucr.edu
 *  Partner(s) Name: none
 *	Lab Section: 022
 *	Assignment: Lab #4 Exercise #4
 *	Exercise Description: #Y code door lock (lock + unlock using same code)
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

enum States {Start, LOCK, LOCK_A2, LOCK_READY, UNLOCK, UNLOCK_A2, UNLOCK_READY} state;
unsigned char status;

void Tick() {
    switch(state){ // Transitions...
        case Start:
            status = 0x00;
            state = LOCK;
            break;
        case LOCK:
            if(PINA == 0x04){
                state = LOCK_A2;
            }
            else{
                state = LOCK;
            }
            break;
        case LOCK_A2:
            if(PINA == 0x04){
                state = LOCK_A2;
            }
            else if(PINA == 0x00){
                state = LOCK_READY;
            }
            else{
                state = LOCK;
            }
            break;
        case LOCK_READY:
            if(PINA == 0x02){
                status = 0x01;
                state = UNLOCK;
            }
            else if(PINA == 0x00){
                state = LOCK_READY;
            }
            else{
                state = LOCK;
            }
            break;
        case UNLOCK:
            if(PINA == 0x80){
                status = 0x00;
                state = LOCK;
            }
            else if(PINA == 0x04){
                state = UNLOCK_A2;
            }
            else{
                state = UNLOCK;
            }
            break;
        case UNLOCK_A2:
            if(PINA == 0x04){
                state = UNLOCK_A2;
            }
            else if(PINA == 0x00){
                state = UNLOCK_READY;
            }
            else if(PINA == 0x80){
                state = LOCK;
            }
            else{
                state = UNLOCK;
            }
            break;
        case UNLOCK_READY:
            if(PINA == 0x02){
                status = 0x00;
                state = LOCK;
            }
            else if(PINA == 0x00){
                state = UNLOCK_READY;
            }
            else if(PINA == 0x80){
                state = LOCK;
            }
            else{
                state = UNLOCK;
            }
            break;
        default:
            break;

    } 
    switch(state){ // State actions... 
        case LOCK:
            status = 0x00;
            break;
        case LOCK_A2:
            status = 0x00;
            break;
        case LOCK_READY:
            status = 0x00;
            break;
        case UNLOCK:
            status = 0x01;
            break;
        case UNLOCK_A2:
            status = 0x01;
            break;
        case UNLOCK_READY:
            status = 0x01;
            break;
        default:
            break;
    }
}

int main(void) {
    /* Insert DDR and PORT initializations */
    DDRA = 0x00; PORTA = 0x00;
    DDRB = 0xFF; PORTB = 0xFF;
    DDRC = 0xFF; PORTC = 0xFF;
    /* Insert your solution below */
    status = 0x00;
    state = Start;
    while (1) { 
        Tick();
        PORTB = status;
        switch(state){
            case LOCK:
                PORTC = 0x00;
                break;
            case LOCK_A2:
                PORTC = 0x01;
                break;
            case LOCK_READY:
                PORTC = 0x02;
                break;
            case UNLOCK:
                PORTC = 0x03;
                break;
            case UNLOCK_A2:
                PORTC = 0x04;
                break;
            case UNLOCK_READY:
                PORTC = 0x05;
            case Start:
                PORTC = 0x06;
                break;
            default:
                break;
        }
    }
    return 1;
}

