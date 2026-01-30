#include <msp430.h>

void initState() {
  WDTCTL = WDTPW | WDTHOLD; // Stop watchdog timer
  P1DIR = 0x00;             // Reset P1DIR
  P1DIR |= BIT0 | BIT1 | BIT2 | BIT3 | BIT4 |
           BIT6; // Red and green on the board are output
                 //  P1DIR = 0101 1111 --> 1.s are output rest are input
  P1OUT = 0x00;  // Dont light anything

  P2DIR &= ~(BIT0 | BIT1 | BIT2 |
             BIT3); // Set P2.0 , P2.1 , P2.2 and P2.3 (button) as input

  P2IE |= (BIT0 | BIT1 | BIT2 | BIT3); // Enable interrupt
  P2IES |= (BIT0 | BIT1 | BIT2 | BIT3);  // Set interrupt on rising edge
  // P2IES |= 0x00;                         // Set interrupt on low to high edge
  P2OUT |= (BIT0 | BIT1 | BIT2 | BIT3);  // Set p2.0 1 2 3 as pull up res
  P2IFG &= ~(BIT0 | BIT1 | BIT2 | BIT3); // Clear interrupt flag

  __bis_SR_register(GIE); // Enable all interrupts
}

volatile int get_out_pre_game = 0;
void preGame() {
  P1OUT = BIT0 | BIT6;
  __delay_cycles(2000000);
  P1OUT = BIT6;
  __delay_cycles(2000000);
  P1OUT = BIT0;
  __delay_cycles(2000000);
  P1OUT = 0;
  __delay_cycles(2000000);

}

void gameStart();
void youWon();
void restart();
void easterEgg();

int main(void) {

  initState();

  while (1) {
    if (!get_out_pre_game) {
      preGame();
    } else {
      while(1){
    P1OUT |= BIT1;
    __delay_cycles(2000000);
    P1OUT ^= BIT1;
        
      }
    }
  }

  return 0;
}

#pragma vector=PORT2_VECTOR
__interrupt void Port_2(void) {

  if ((P2IN & BIT0) == 0) // check if button A is pressed
  {
    P2IFG &= ~BIT0; // clear interrupt flag
    get_out_pre_game = 1;
  }

  else if ((P2IN & BIT1) == 0) // check if button B is pressed
  {
    P2IFG &= ~BIT1; // clear interrupt flag
  }

  else if ((P2IN & BIT2) == 0) // check if button C is pressed
  {
    P2IFG &= ~BIT2; // clear interrupt flag
  }

  else if ((P2IN & BIT3) == 0) // check if button D is pressed
  {
    P2IFG &= ~BIT3; // clear interrupt flag
  }
}
