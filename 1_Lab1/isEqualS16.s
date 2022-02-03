.global isEqualS16

.text 

isEqualS16:
	CMP R0, R1
	MOV R0, #1
	BEQ END
	MOV R0, #0

END:
	BX LR
