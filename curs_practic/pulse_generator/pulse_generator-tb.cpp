#include "pulse_generator-tb.h"
#include <iostream>

int main(){

	int status = 0;

	bool pulse;

//	std::cout << "pulse = " << std::endl;

	for (int i = 0; i < 5; i++) {
		pulse_generator(0, pulse);
		std::cout << " pulse = " << pulse << std::endl;
	}
	for (int i = 0; i < 5; i++) {
			pulse_generator(1, pulse);
			std::cout << " pulse = " << pulse << std::endl;
	}
	for (int i = 0; i < 5; i++) {
			pulse_generator(0, pulse);
			std::cout << " pulse = " << pulse << std::endl;
	}

	return status;
}
