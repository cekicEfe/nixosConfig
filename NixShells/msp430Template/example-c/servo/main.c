#include <msp430.h>

int main(void) {
	WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer
	BCSCTL1 = CALBC1_1MHZ;
	DCOCTL = CALDCO_1MHZ;

	//PWM period
	// We use the p1.6 to control the servo
	P1DIR |= BIT6 | BIT1;
	P1SEL |= BIT6 | BIT1;

	while(1){
		TACCR0 = 20000; //PWM per
		TACCR1 = 350;   // CCR1 PWM Duty cycle min 350 max 2600 angle 190,
		// 350 2350-180 degrees

		TACCTL1 = OUTMOD_7;
		TACTL = TASSEL_2|MC_1;

		__delay_cycles(1500000);

		TACCR1 = 2350;
		TACCTL1 = OUTMOD_7;
		TACTL = TASSEL_2|MC_1;


		__delay_cycles(1500000);
	}
	
	return 0;
}
