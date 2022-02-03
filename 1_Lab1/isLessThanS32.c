#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<stdbool.h>

extern bool isLessThanS32(int32_t x, int32_t y);

int main(void) {

	int32_t a, b;
	
	a = -16;
	b = -11;

	if (isLessThanS32(a, b)) {
		printf("1\n");
	} else {
		printf("0\n");
	}
	return EXIT_SUCCESS;
}
