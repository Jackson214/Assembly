#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "printBinary.c"

extern uint32_t shiftLeftU32(uint32_t x, uint32_t y);

int main(void) {

	uint32_t a, b, c;

	a = 12;
	b = 2;

	c = shiftLeftU32(a, b);

	printf("a = %d\n", a);
	printBinary32(a);

	printf("Shifting left by %d\n", b);

	printf("c = %d\n", c);
	printBinary32(c);

	return EXIT_SUCCESS;
}
