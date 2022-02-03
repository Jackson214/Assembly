#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<stdbool.h>

extern bool isLessThanU32(uint32_t x, uint32_t y);

int main(void) {

	uint32_t a, b;
	
	a = 10;
	b = 15;

	if (isLessThanU32(a, b)) {
		printf("1\n");
	} else {
		printf("0\n");
	}
	return EXIT_SUCCESS;
}
