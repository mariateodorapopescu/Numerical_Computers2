void sc1(unsigned char in1, unsigned char *out1){
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=ap_none port=in1
#pragma HLS INTERFACE mode=ap_none port=out1

	*out1 = in1;
}
