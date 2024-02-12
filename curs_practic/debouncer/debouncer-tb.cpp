#include <iostream>

void debouncer(bool sw, bool &out);

int  main(){
	int status = 0;

	bool sw, out;

	std::cout << "" << std::endl;

	// oricum, cout-urile de for-uri sunt puse de mine

	for (int i = 0; i < 5000; i++) {
		sw = 0;
		debouncer(sw, out);
		if (out == 1) {
			std::cout << "(5000, 0)out = " << out << " la i = " << i << std::endl;
		}
//		std::cout << "(5000, 0)out = " << out << std::endl;
	}

	for (int i = 0; i < 250; i++) {
			sw = 0;
			debouncer(sw, out);
//			std::cout << "(250, 0)out = " << out << std::endl;
			if (out == 1) {
						std::cout << "(250, 0)out = " << out << " la i = " << i << std::endl;
			}
			sw = 1;
			debouncer(sw, out);
//			std::cout << "(250, 1)out = " << out << std::endl;
			if (out == 1) {
						std::cout << "(250, 1)out = " << out << " la i = " << i << std::endl;
			}
	}

	for (int i = 0; i < 5000; i++) {
			sw = 1;
			debouncer(sw, out);
//			std::cout << "(5000, 1)out = " << out << std::endl;
			if (out == 1) {
						std::cout << "(5000, 1)out = " << out << " la i = " << i << std::endl;
			}
	}

	//? de completat!!

	if (status == 0) {
		std::cout << "Test SUCCESS !!!";
	} else {
		std::cout << "Test FAILED !!!!";
	}
	std::cout << "" << std::endl;

	return status;
}
