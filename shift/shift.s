.global shiftBy

.text 

shiftBy:
	MOV R0, R0, LSL R1
	BX LR
	