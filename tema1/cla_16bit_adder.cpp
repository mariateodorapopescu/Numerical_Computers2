#include "cla_16bit_adder.h"
// POPESCU MARIA-TEODORA, 332CC
void cla_adder_16bit(int16 a, int16 b, bool cin, int16 &c, int16 &sum, bool &coutt) {
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=ap_none port=a
#pragma HLS INTERFACE mode=ap_none port=b
#pragma HLS INTERFACE mode=ap_none port=cin
#pragma HLS INTERFACE mode=ap_none port=c
#pragma HLS INTERFACE mode=ap_none port=sum
#pragma HLS INTERFACE mode=ap_none port=coutt
#pragma HLS WAVE

    int16 P[16], G[16];
    bool extend;

    for (int i = 0; i < 16; i++) {
        P[i] = a[i] | b[i];
        G[i] = a[i] & b[i];
    }
#pragma HLS PIPELINE II=1 // cautat pe internet;
    // trebuie sa fie pipelined, chiar daca in mod normal la co-simulare nu trebuie pipelined, dar altfel dadea eroare la co-simulare


    c[0] = cin;
    for (int i = 1; i < 16; i++) {
        c[i] = G[i-1] | (P[i-1] & c[i-1]);
    }
#pragma HLS PIPELINE II=1

    coutt = c[15];

    for (int i = 0; i < 16; i++) {
        sum[i] = a[i] ^ b[i] ^ c[i];
    }
#pragma HLS PIPELINE II=1

    extend = G[3] & P[3];
    sum = sum - extend;

    if (cin == 1) {
        int16 one = 1;
        sum = sum - one;
    }
    if (a < 0 && b < 0) {
    	sum = sum + 1;
    }
}
