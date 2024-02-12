#include "myFnctions.h"
bool function1(bool a, bool b, bool c, bool d) {
	return a && b;
}
bool function2(bool a, bool b, bool c, bool d) {
	return (a ^ b) && !(c && d);
}
bool function3(bool a, bool b, bool c, bool d) {
	return !(a && b) && (c && d);
}
bool function4(bool a, bool b, bool c, bool d) {
	return !(a || b) && (c ^ d);
}
bool function5(bool a, bool b, bool c, bool d) {
// #pragma HLS UNROLL
	return !(a || b) && !(c || d);
}
void sc1(bool a, bool b, bool c, bool d, bool &out1, bool &out2) {
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=ap_none port=a
#pragma HLS INTERFACE mode=ap_none port=b
#pragma HLS INTERFACE mode=ap_none port=c
#pragma HLS INTERFACE mode=ap_none port=d
#pragma HLS INTERFACE mode=ap_none port=out1
#pragma HLS INTERFACE mode=ap_none port=out2
	bool var1 = function1(a, b, c, d);
	bool var2 = function2(a, b, c, d);
	bool var3 = function3(a, b, c, d);
	bool var4 = function4(a, b, c, d);
	bool var5 = function5(a, b, c, d);
	out1 = var1 || var2 || var3;
	out2 = var3 || var4;
}
