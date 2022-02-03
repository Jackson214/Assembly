#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<stdbool.h>

extern uint16_t minU8(int8_t x, int8_t y);

int main(void) {

	int8_t a = 2;
	int8_t b = 5;
	int16_t c;
	
	c = minU8(a,b);

	printf("Minimum = %d\n", c);

	return EXIT_SUCCESS;
}
