#include <msp430.h>

#define LED1 BIT0
#define BUTTON BIT3

int main(void) {
  WDTCTL = WDTPW | WDTHOLD; // Stop WDT

  P1DIR |= LED1;
  P1DIR &= ~BUTTON;
  P1DIR |= BUTTON;
  P1OUT |= BUTTON;
  P1OUT &= LED1;

  _enable_interrupts();

  P1IES |= BUTTON;
  P1IE |= BUTTON;
  P1IFG = 0x00;

  while (1)
    ;

  return 0;
}

#pragma vector=TIMERA0_VECTOR
__interrupt void PORT1_ISR(void) {
  P1OUT ^= LED1;
  P1IFG = 0x00;
}
