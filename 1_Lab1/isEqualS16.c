#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<stdbool.h>

extern bool isEqualS16(int16_t x, int16_t y);

int main(void) {

	int16_t a, b;
	
	a = -5;
	b = -5;

	if(isEqualS16(a, b)) {
		printf("Equal\n");
	}
	else {
		printf("NOT Equal\n");
	}
	return EXIT_SUCCESS;
}
