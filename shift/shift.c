#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "printBinary.c"

extern uint32_t shiftLeftU32(uint32_t x, uint32_t y);

int main(void) {

	uint32_t a, b, c;

	a = 16;
	b = 2;

	c = shiftBy(a, b);

	printf("a = %d\n", a);
	printBinary32(a);

	printf("b = %d\n", b);
	printBinary32(b);

	printf("c = %d\n", c);
	printBinary32(c);

	return EXIT_SUCCESS;
}
