#include "cla_16bit_adder-tb.h"
#include <iostream>
#include <ap_int.h>
// POPESCU MARIA-TEODORA, 332CC
int main() {

	int status = 0;
	std::cout << " " << std::endl;

	int16 a, b;
	bool cin;
	int16 c;
	int16 sum;
	bool coutt;

	std::cout << "Test 1 -> cin = 0, nu e cu 1 in minte:";
	a = 3;
	b = 5;
	cin = 0;
	cla_adder_16bit(a, b, cin, c, sum, coutt);
	std::cout << " sum = " << sum;
	if (sum == 8) {
		std :: cout << " == 8 -> SUCCES !!!" << std::endl;
	} else {
		std :: cout << " != 8 -> FAILED !!!!" << std::endl;
	}

	std::cout << "Test 2 -> cin = 1, nu e cu 1 in minte:";
		a = 2;
		b = 4;
		cin = 1;
		cla_adder_16bit(a, b, cin, c, sum, coutt);
		std::cout << " sum = " << sum;
		if (sum == 6) {
			std :: cout << " == 6 -> SUCCES !!!" << std::endl;
		} else {
			std :: cout << " != 6 -> FAILED !!!!" << std::endl;
		}

		std::cout << "Test 3 -> cin = 1, peste 10:";
		a = 7;
		b = 4;
		cin = 1;
		cla_adder_16bit(a, b, cin, c, sum, coutt);
		std::cout << " sum = " << sum;
		if (sum == 11) {
			std :: cout << " == 11 -> SUCCES !!!" << std::endl;
		} else {
			std :: cout << " != 11 -> FAILED !!!!" << std::endl;
		}

		std::cout << "Test 4 -> cin = 0, peste 10:";
		a = 7;
		b = 4;
		cin = 0;
		cla_adder_16bit(a, b, cin, c, sum, coutt);
		std::cout << " sum = " << sum;
		if (sum == 11) {
			std :: cout << " == 11 -> SUCCES !!!" << std::endl;
		} else {
			std :: cout << " != 11 -> FAILED !!!!" << std::endl;
		}

		std::cout << "Test 5 -> cin = 0, numere negative:";
		a = -7;
		b = 4;
		cin = 0;
		cla_adder_16bit(a, b, cin, c, sum, coutt);
		std::cout << " sum = " << sum;
		if (sum == -3) {
			std :: cout << " == -3 -> SUCCES !!!" << std::endl;
		} else {
			std :: cout << " != -3 -> FAILED !!!!" << std::endl;
		}

		std::cout << "Test 6 -> cin = 1, numere negative:";
		a = -7;
		b = 4;
		cin = 1;
		cla_adder_16bit(a, b, cin, c, sum, coutt);
		std::cout << " sum = " << sum;
		if (sum == -3) {
			std :: cout << " == -3 -> SUCCES !!!" << std::endl;
		} else {
			std :: cout << " != -3 -> FAILED !!!!" << std::endl;
		}

		std::cout << "Test 7 -> cin = 1, numere negative:";
		a = -7;
		b = -4;
		cin = 1;
		cla_adder_16bit(a, b, cin, c, sum, coutt);
		std::cout << " sum = " << sum;
		if (sum == -11) {
			std :: cout << " == -11 -> SUCCES !!!" << std::endl;
		} else {
			std :: cout << " != -11 -> FAILED !!!!" << std::endl;
		}

		std::cout << "Test 8 -> cin = 0 numere negative:";
		a = -7;
		b = -4;
		cin = 0;
		cla_adder_16bit(a, b, cin, c, sum, coutt);
		std::cout << " sum = " << sum;
		if (sum == -11) {
			std :: cout << " == -11 -> SUCCES !!!" << std::endl;
		} else {
			std :: cout << " != -11 -> FAILED !!!!" << std::endl;
		}

	std::cout << " " << std::endl;
	return status;
}
