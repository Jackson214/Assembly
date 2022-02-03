.global sortDecendingInPlace
.global sumF32
.global prodF64
.global dotpF64
.global maxF32
.global absSumF64
.global sqrtSumF64
.global getDirection
.global getAddNo
.global getCity

.text

sortDecendingInPlace:
	MOV R2, #0
	MOV R3, #0
	MOV R4, #1

sortLoop1:
	CMP R2, R1
	ADD R2, #1
	BLO sortLoop2
	B sortEnd

sortLoop2:
	CMP R4, R1
	BLO sortLoop3
	MOV R3, #0
	MOV R4, #1
	B sortLoop1

sortLoop3:
	LSL R5, R3, #2
	LSL R6, R4, #2
	ADD R5, R5, R0
	ADD R6, R6, R0
	LDR R7, [R5]
	LDR R8, [R6]
	CMP R7, R8
	ADD R3, R3, #1
	ADD R4, R4, #1
	BLT sortSwitch
	B sortLoop2

sortSwitch:
	STR R8, [R5]
	STR R7, [R6]

sortEnd:
	MOV R1, #0
	MOV R2, #0
	MOV R3, #0
	MOV R4, #0
	BX LR
@----------------------------------------
sumF32:
	MOV R2, #0
	VMOV S0, R2

sumLoop:
	CMP R1, #0
	BEQ sumEnd
	VLDR.F32 S1, [R0]
	VADD.F32 S0, S0, S1
	SUB R1, R1, #1
	ADD R0, R0, #4
	B sumLoop

sumEnd:
	VMOV R0, S0
	BX LR
@----------------------------------------
prodF64:
	MOV R2, #0
	VMOV.F64 D0, R2, R2
	VLDR.F64 D1, [R0]
	VADD.F64 D0, D0, D1

prodLoop:
	CMP R1, #1
	BEQ prodEnd
	ADD R0, R0, #8
	VLDR.F64 D1, [R0]
	VMUL.F64 D0, D1
	SUB R1, R1, #1
	B prodLoop

prodEnd:
	VMOV R0, R1, D0
	BX LR
@----------------------------------------
dotpF64:
	MOV R3, #0
	VMOV D2, R3, R3
	VMOV D3, R3, R3

dotpLoop:
	CMP R2, #0
	BEQ dotpExit
	VLDR.F64 D0, [R0]
	ADD R0, R0, #8
	VLDR.F64 D1, [R1]
	ADD R1, R1, #8
	VMUL.F64 D2, D0, D1
	VADD.F64 D3, D3, D2
	SUB R2, R2, #1
	B dotpLoop

dotpExit:
	VMOV.F64 D0, D3
	BX LR
@----------------------------------------
maxF32:
	VLDR.F32 S0, [R0]

MaxLoop:
	ADD R0, R0, #4
	VLDR.F32 S1, [R0]
	VCMP.F32 S1, S0
	VMRS APSR_nzcv, FPSCR
	BGE MaxSave
	BLT MaxCounter

MaxSave:
	VMOV S0, S1
	B MaxCounter

MaxCounter:
	SUB R1, R1, #1
	CMP R1, #0
	BEQ MaxExit
	B MaxLoop

MaxExit:
	VMOV R0, S0
	BX LR
@----------------------------------------
absSumF64:
	MOV R2, #0
	VMOV D0, R2, R2
	VMOV D2, R2, R2
	VMOV D3, R2, R2

absSumLoop:
	CMP R1, #0
	BEQ abs
	VLDR.F64 D1, [R0]
	VADD.F64 D0, D0, D1
	ADD R0, R0, #8
	SUB R1, R1, #1
	B absSumLoop

abs:
	VCMP.F64 D0, D3
	VMRS APSR_nzcv, FPSCR
	BGT absSumEnd
	VMOV.F64 D2, D0
	VSUB.F64 D0, D0
	VSUB.F64 D0, D0, D2
	B absSumEnd

absSumEnd:
	BX LR
@----------------------------------------
sqrtSumF64:
	MOV R2, #0
	VMOV D0, R2, R2
	VMOV D2, R2, R2
	VMOV D3, R2, R2

sqrtSumLoop:
	CMP R1, #0
	BEQ sqrtSumEnd
	VLDR.F64 D1, [R0]
	VADD.F64 D0, D0, D1
	ADD R0, R0, #8
	SUB R1, R1, #1
	B sqrtSumLoop

sqrtSumEnd:
	VSQRT.F64 D0, D0
	BX LR
@----------------------------------------
getDirection:
	MOV R3, #120
	MUL R2, R1, R3
	ADD R0, R0, #44
	ADD R0, R0, R2
	LDR R0, [R0]
	BX LR
@----------------------------------------
getAddNo:
	MOV R3, #120
	MUL R2, R1, R3
	ADD R0, R0, #40
	ADD R0, R0, R2
	LDR R0, [R0]
	BX LR
@----------------------------------------
getCity:
	MOV R3, #120
	MUL R2, R1, R3
	ADD R0, R0, #78
	ADD R0, R0, R2
	BX LR
