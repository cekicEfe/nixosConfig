#include <msp430g2553.h>

#define DISPLAY_A 0b00000001
#define DISPLAY_B 0b00000010
#define DISPLAY_C 0b00000100
#define DISPLAY_D 0b00001000
#define DISPLAY_E 0b00010000
#define DISPLAY_F 0b00100000
#define DISPLAY_G 0b01000000
#define DISPLAY_DOT 0b10000000

void count() {

  // 1
  P1OUT = DISPLAY_B | DISPLAY_C;
  __delay_cycles(2000000);

  // 2
  P1OUT = DISPLAY_A | DISPLAY_E | DISPLAY_F | DISPLAY_B | DISPLAY_D;
  __delay_cycles(2000000);

  // 3
  P1OUT = DISPLAY_A | DISPLAY_F | DISPLAY_B | DISPLAY_C | DISPLAY_D;
  __delay_cycles(2000000);

  // 4
  P1OUT = DISPLAY_B | DISPLAY_C | DISPLAY_G | DISPLAY_F;
  __delay_cycles(2000000);

  // 5
  P1OUT = DISPLAY_A | DISPLAY_F | DISPLAY_G | DISPLAY_C | DISPLAY_D;
  __delay_cycles(2000000);

  // 6
  P1OUT = DISPLAY_A | DISPLAY_F | DISPLAY_G | DISPLAY_E | DISPLAY_D | DISPLAY_C;
  __delay_cycles(2000000);

  // 7
  P1OUT = DISPLAY_A | DISPLAY_B | DISPLAY_C;
  __delay_cycles(2000000);

  // 8
  P1OUT = DISPLAY_A | DISPLAY_B | DISPLAY_C | DISPLAY_D | DISPLAY_E |
          DISPLAY_F | DISPLAY_G;
  __delay_cycles(2000000);

  // 9
  P1OUT = DISPLAY_A | DISPLAY_B | DISPLAY_C | DISPLAY_D | DISPLAY_F | DISPLAY_G;
  __delay_cycles(2000000);

  // dot
  P1OUT = DISPLAY_DOT;
  __delay_cycles(2000000);
}

void count_new(){

  //1
  P1OUT = 0b00000110;
  __delay_cycles(2000000);

  //2
  P1OUT = 0b01011011;
  __delay_cycles(2000000);

  //3
  // P1OUT = 0x00000110
  // __delay_cycles(2000000);

  //4
  // P1OUT = 0x00000110
  // __delay_cycles(2000000);

  //5
  // P1OUT = 0x00000110
  // __delay_cycles(2000000);

  //6
  // P1OUT = 0x00000110
  // __delay_cycles(2000000);

  //7
  // P1OUT = 0x00000110
  // __delay_cycles(2000000);

  //8
  // P1OUT = 0x00000110
  // __delay_cycles(2000000);

  //dot
  P1OUT = 0b10000000;
  __delay_cycles(2000000);
}

int main(void) {
  WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer

  P1DIR = 0x00;        // Clear p1
  P1DIR |= 0b11111111; // Make p1.0 and p1.6 out
  P1OUT = 0x00;        // init them as off
  // P1OUT = 0b00000001; example light this lights p1.0

  while (1) {
    count();
    // count_new();
  }
}
