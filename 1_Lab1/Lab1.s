.global add64
.global sub64
.global minU8
.global minS8
.global isLessThanU32
.global isLessThanS32
.global shiftLeftU32
.global shiftU32
.global shiftS32
.global isEqualU16
.global isEqualS16
.global stringCopy
.global stringCat

.text

add64:
	ADDS R0, R0, R2
	ADC R1, R1, R3
	BX LR

sub64:
	SUBS R0, R0, R2
	SBC R1, R1, R3
	BX LR

minU8:
	CMP R0, R1
	BLS END
	MOV R0, R1

minS8:
	CMP R0, R1
	BLE END
	MOV R0, R1

isLessThanU32:
	CMP R0, R1
	MOV R0, #1
	BLO END
	MOV R0, #0

isLessThanS32:
	CMP R0, R1
	MOV R0, #1
	BLT END
	MOV R0, #0

shiftLeftU32:
	MOV R0, R0, LSL R1
	BX LR

shiftU32:
	CMP R1, #0
	BLT RightShift
	BGE ULeftShift

shiftS32:
	CMP R1, #0
	BLT RightShift
	BGE SLeftShift

isEqualU16:
	CMP R0, R1
	MOV R0, #1
	BEQ END
	MOV R0, #0

isEqualS16:
	CMP R0, R1
	MOV R0, #1
	BEQ END
	MOV R0, #0

stringCopy:
	LDRB R2, [R1], #1
	STRB R2, [R0], #1
	CMP R2, #0
	BNE stringCopy
	BX LR

stringCat:
	MOV R2, R1

loop1:
	LDRB R3, [R2], #1
	CMP R3, #0
	BNE loop1    
	SUB R2, R2, #1

loop2:
	LDRB R3, [R0], #1
	STRB R3, [R2], #1
	CMP R3, #0
	BNE loop2
	BX LR

ULeftShift:
	MOV R0, R0, LSL R1
	BX LR

SLeftShift:
	MOV R0, R0, ASL R1
	BX LR

RightShift:
	NEGMI R1, R1
	MOV R0, R0, ASR R1
	BX LR

END:
	BX LR
