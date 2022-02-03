.global shiftS32

.text 

shiftS32:
	CMP R1, #0
	BLT RightShift
	BGE SLeftShift

SLeftShift:
	MOV R0, R0, ASL R1
	BX LR

RightShift:
	NEGMI R1, R1
	MOV R0, R0, ASR R1
	BX LR
	