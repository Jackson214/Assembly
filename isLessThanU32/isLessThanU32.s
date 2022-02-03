.global isLessThanU32

.text

isLessThanU32:
	CMP R0, R1
	MOV R0, #1
	BLO END
	MOV R0, #0

END:
	BX LR
