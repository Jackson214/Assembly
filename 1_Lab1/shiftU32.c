#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "printBinary.c"

extern uint32_t shiftU32(uint32_t x, int32_t p);

int main(void) {

	uint32_t a, c;
	int32_t b;

	a = 52;
	b = -4;

	c = shiftU32(a, b);

	printf("a = %d\n", a);
	printBinary32(a);

	printf("c = %d\n", c);
	printBinary32(c);

	return EXIT_SUCCESS;
}
