#include <msp430.h>

void sleep(unsigned volatile int delay) {
  while (delay) {
    delay--;
  }
}

void light_red_and_green() {
  P1OUT = 0b01000001; // 01000001
}

void light_red() { P1OUT = 0b00000001; }

void light_green() { P1OUT = 0b01000000; }

void lights_out() { P1OUT = 0x00; }

int main(void) {
  WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer

  P1DIR = 0x00;        // Clear p1
  P1DIR |= 0b01000001; // Make p1.0 and p1.6 out
  P1OUT = 0x00;        // init them as off

  while (1) {
    // light_red();

    // light_green();

    light_red_and_green();
    __delay_cycles(2000000);

    lights_out();
    __delay_cycles(2000000);
  }
}
