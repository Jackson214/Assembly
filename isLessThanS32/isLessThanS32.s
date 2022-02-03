.global isLessThanS32

.text

isLessThanS32:
	CMP R0, R1
	MOV R0, #1
	BLT END
	MOV R0, #0

END:
	BX LR
