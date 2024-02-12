#include "sc2-tb.h"
#include <iostream>
int main() {
int status = 0;
bool a, b, c, d[8];
bool d_golden[8] = {1, 0, 1, 0, 1, 0, 1, 1};
int k = 0;
for (int ca = 0; ca < 2; ca++) {
	for (int cb = 0; cb < 2; cb++) {
		for (int cc = 0; cc < 2; cc++) {
			a = (bool)ca;
			b = (bool)cb;
			c = (bool)cc;
			sc2(a, b, c, &d[k++]);
		}
	}
}
for (int i = 0; i < 7; i++) {
	if (d[i] != d_golden[i]) {
		std::cout << "Err at " << i << " d[" << i << "] = " << d[i] << " != d_golden[" << i << "] = " << d_golden[i] << std::endl;
		status = 1;
		break;
	}
	std::cout << "Data at " << i << " d[" << i << "] = " << d[i] << " == d_golden[" << i << "] = " << d_golden[i] << std::endl;
}
if (status == 0) {
	std::cout << "Test with SUCCES !!!!" << std::endl;
} else {
	std::cout<<"Test FAIL !!!!!" << std::endl;
}
return status;
}
