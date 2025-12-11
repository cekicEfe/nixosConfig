// #include <msp430f20x3.h>

// void main(void) {
//   WDTCTL = WDTPW + WDTHOLD;         // Stop watchdog timer
//   P1DIR |= 0x01;                    // Set P1.0 to output direction
//   SD16CTL = SD16REFON + SD16SSEL_1; // 1.2V ref, SMCLK
//   SD16INCTL0 = SD16INCH_1;          // A1+/-
//   SD16CCTL0 = SD16UNI + SD16IE;     // 256OSR, unipolar, interrupt enable
//   SD16AE = SD16AE2;                 // P1.1 A1+, A1- = VSS
//   SD16CCTL0 |= SD16SC;              // Set bit to start conversion
//   _BIS_SR(LPM0_bits + GIE);
// }
// #pragma vector = SD16_VECTOR
// __interrupt void SD16ISR(void) {
//   if (SD16MEM0 < 0x7FFF) // SD16MEM0 > 0.3V?, clears IFG
//     P1OUT &= ~0x01;
//   else
//     P1OUT |= 0x01;
// }
