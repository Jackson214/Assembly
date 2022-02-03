.global shiftU32

.text 

shiftU32:
	CMP R1, #0
	BLT RightShift
	BGE LeftShift

LeftShift:
	MOV R0, R0, LSL R1
	BX LR

RightShift:
	NEGMI R1, R1
	MOV R0, R0, ASR R1
	BX LR
	