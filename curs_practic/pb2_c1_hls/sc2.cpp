void sc2(
		bool a, bool b, bool c,
		bool *d){
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=ap_none port=a
#pragma HLS INTERFACE mode=ap_none port=b
#pragma HLS INTERFACE mode=ap_none port=c
#pragma HLS INTERFACE mode=ap_none port=d

	*d = (a && b) || !c;
}
