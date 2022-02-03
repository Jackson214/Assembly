#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "printBinary.c"

extern int32_t shiftS32(int32_t x, int32_t p);

int main(void) {

	int32_t a, b, c;

	a = -12;
	b = 3;

	c = shiftS32(a, b);

	printf("a = %d\n", a);
	printBinary32(a);

	printf("c = %d\n", c);
	printBinary32(c);

	return EXIT_SUCCESS;
}
