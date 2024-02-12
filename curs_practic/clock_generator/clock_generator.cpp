#include "clock_generator.h"

#define CLOCK_FREQUENCY_DIVISOR 20

typedef enum {zero, one}clock_state_type;

void clock_generator(bool &slow_clock) {
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=ap_none port=slow_clock

	static clock_state_type state = zero;
	static unsigned int counter = CLOCK_FREQUENCY_DIVISOR / 2 - 1;

	clock_state_type next_state;
	unsigned int next_counter;
	bool slow_clock_tmp;

	switch(state){
	case zero:
		if (counter == 0) {
			next_counter = CLOCK_FREQUENCY_DIVISOR;
			next_state = one;
		} else {
			next_counter = counter - 1;
			next_state = zero;
		}
		slow_clock_tmp = zero;
		break;
	case one:
			if (counter == 0) {
				next_counter = CLOCK_FREQUENCY_DIVISOR;
				next_state = zero;
			} else {
				next_counter = counter - 1;
				next_state = one;
			}
			slow_clock_tmp = one;
			break;
	default:
		break;
	}

	state = next_state;
	counter = next_counter;
	slow_clock = slow_clock_tmp;
}
