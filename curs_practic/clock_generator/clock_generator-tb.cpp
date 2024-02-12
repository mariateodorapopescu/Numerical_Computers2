#include "clock_generator-tb.h"
#include <iostream>
int main(){

	int status = 0;

	bool slow_clock_tmp;

	std::cout << " " << std::endl;

	for (int i = 0; i < 200; i++) {
		clock_generator(slow_clock_tmp);
		std::cout << " slow_clock_tmp = " << slow_clock_tmp << std::endl;
	}

	std::cout << " " << std::endl;

	return status;
}
