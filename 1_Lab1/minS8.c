#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<stdbool.h>

extern uint16_t minS8(int8_t x, int8_t y);

int main(void) {

	int8_t a = -5;
	int8_t b = -8;
	int16_t c;
	
	c = minS8(a,b);

	printf("Minimum = %d\n", c);

	return EXIT_SUCCESS;
}
