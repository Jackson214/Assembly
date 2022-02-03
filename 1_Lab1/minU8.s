.global minU8

.text 

minU8:
	CMP R0, R1
	BLS negative
	MOV R0, R1

negative:
	BX LR
