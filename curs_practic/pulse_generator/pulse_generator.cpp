#include "pulse_generator.h"

typedef enum{ w1, w0 }pulse_gen_state_type;

void pulse_generator(bool input, bool &pulse) {
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=ap_none port=pulse
#pragma HLS INTERFACE mode=ap_none port=input
	static pulse_gen_state_type state = w1;
	static pulse_gen_state_type next_state;
	bool next_pulse;

	switch (state) {
	case w1:
		if (input == 1) {
			next_state = w0;
			next_pulse = 1;
		} else {
			next_state = w1;
			next_pulse = 0;
		}
		break;
	case w0:
		if (input == 1) {
			next_state = w0;
			next_pulse = 0;
		} else {
			next_state = w1;
			next_pulse = 0;
		}
		break;
	default:
		break;
	}
	//update
	state = next_state;
	pulse = next_pulse;
}
