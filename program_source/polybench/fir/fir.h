#ifndef __FIR_H_
#define __FIR_H_

#define NUM_TAPS 20

typedef float DTYPE;

void fir(int input, int *output, int taps[NUM_TAPS]);

#endif
