#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<stdbool.h>

extern bool isEqualU16(uint16_t x, uint16_t y);

int main(void) {

	uint16_t a, b;
	
	a = 5;
	b = 4;

	if(isEqualU16(a, b)) {
		printf("Equal\n");
	}
	else {
		printf("NOT Equal\n");
	}
	return EXIT_SUCCESS;
}
