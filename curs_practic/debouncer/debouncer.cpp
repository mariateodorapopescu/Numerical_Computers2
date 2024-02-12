//#define DELAY_COUNTER 500000 L
#define DELAY_COUNTER 500L // doar ptr simulare

typedef enum { transfer, delay }debouncer_state_type;

void debouncer(bool sw, bool &out){
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=ap_none port=out
#pragma HLS INTERFACE mode=ap_none port=switcher
	static debouncer_state_type state = transfer;
	static unsigned long long int counter = DELAY_COUNTER;

	static bool previous_switch = 0;
	unsigned long long int next_counter = 0; // ?
	static debouncer_state_type next_state; // ? registru
	bool out_tmp = 0;

	switch(state) {
	case transfer:
		if (previous_switch != sw) {
			next_state = delay;
		} else {
			next_state = transfer;
		}
		next_counter = DELAY_COUNTER;
		out_tmp = sw;
		break;

	case delay:
		if (counter == 0) {
			next_state = transfer;
			next_counter = DELAY_COUNTER;
		} else {
			next_counter = next_counter - 1;
			next_state = delay;
		}
		out_tmp = previous_switch;
		break;
	default:
		break;
	}
	previous_switch = out_tmp;
	state = next_state;
	counter = next_counter;
	out = out_tmp;
}
