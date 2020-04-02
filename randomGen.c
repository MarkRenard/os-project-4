// randomGen.c was created by Mark Renard on 3/26/2020
//
// This file contains functions for generating random numbers of various types.
// These should be used in a program where srand was called at some point.
//
// randUnsigned inpired by:
// https://bytes.com/topic/c/answers/135812-random-number-if-range-greater-than-rand_max

#include <stdlib.h>
#include <stdio.h>

#define RAND_DOUBLE_PRECISION 1000.0

// Random int in range overlaping with [0, (RAND_MAX + 1) * RAND_MAX + RAND_MAX]
unsigned int randUnsigned(unsigned int min, unsigned int max){
	unsigned int rawRandom;	// Biased raw output from rand

	// The number of possible return values
	unsigned int rangeSize = max - min + 1;

	// The maximum value output by (RANDMAX + 1) * rand() + rand()
	unsigned int maxRawRandom = \
		((unsigned int)RAND_MAX + 1) * RAND_MAX + RAND_MAX;

	// Throws out overrepresented values to de-bias PRNG
	do {
		rawRandom = ((unsigned int)RAND_MAX + 1) * rand() + rand();
	} while (rawRandom > maxRawRandom - maxRawRandom % rangeSize);

	return rawRandom % rangeSize + min;
}

// Returns a 1 with specified probability, 0 otherwise
int randBinary(double probability){
	int threshold = (int)(RAND_MAX * probability);

	return rand() < threshold ? 1 : 0;
}
/*
// Returns a double in range [min, max];
double randDouble(double min, double max){
	double rangeSize = max - min;
	int rangeSizeInt = (int)(rangeSize * RAND_DOUBLE_PRECISION) + 1;

	printf("\nrangeSize: %f\n", rangeSize);
	printf("rangeSizeInt: %d\n", rangeSizeInt);
	
	int rawRandom;

	// Throws out overrepresented values to de-bias PRNG
	do {
		rawRandom = rand();
	} while (rawRandom > RAND_MAX - RAND_MAX % rangeSizeInt);

	printf("\nrawRandom: %d\n", rawRandom);

	printf("(double)(rawRandom % rangeSizeInt): %f\n", (double)(rawRandom % rangeSizeInt));
	printf("(double) RAND_DOUBLE_PRECISION + min: %f\n\n", (double) RAND_DOUBLE_PRECISION + min);

	return ((double)(rawRandom % rangeSizeInt))/((double)RAND_DOUBLE_PRECISION) + min;
}*/
