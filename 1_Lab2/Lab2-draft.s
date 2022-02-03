.global sumS32
.global sumS8
.global sumU32_64
.global countNegative
.global countNonNegative
.global countMatches
.global uint8ToBinaryString
.global int16ToBinaryString
.global getParity
.global returnMax
.global returnMin

.text

sumS32:
	LDR R3, [R0], #4
	ADD R4, R4, R3
	SUB R1, R1, #1
	CMP R1, #0
	BNE sumS32
	MOV R0, R4
	MOV R3, #0
	MOV R4, #0
	BX LR
@----------------------------------------
sumS8:
	LDRB R3, [R0], #1
	ADD R4, R4, R3
	SUB R1, R1, #1
	CMP R1, #0
	BNE sumS8
	MOV R0, R4
	MOV R3, #0
	MOV R4, #0
	BX LR
@----------------------------------------
sumU32_64:
	MOV R5, R1
	MOV R2, R0
	MOV R0, #0
	MOV R1, #0

sumU32_64Loop:
	LDR R3, [R2], #4
	ADDS R0, R0, R3
	ADC R1, R1, R4
	SUB R5, R5, #1
	CMP R5, #0
	BNE sumU32_64Loop
	BX LR
@----------------------------------------
countNegative:
	MOV R2, R0
	MOV R0, #0

countNegativeLoop:
	LDR R3, [R2], #4
	CMP R3, #0
	BLT countNegativereturnMaxCounter
	SUB R1, R1, #1
	CMP R1, #0
	BNE countNegativeLoop
	BEQ end

countNegativereturnMaxCounter:
	ADD R0, R0, #1
	SUB R1, R1, #1
	CMP R1, #0
	BNE countNegativeLoop
	BEQ end
@----------------------------------------
countNonNegative:
	MOV R2, R0
	MOV R0, #0

countNonNegativeLoop:
	LDR R3, [R2], #4
	CMP R3, #0
	BGE countNonNegativereturnMaxCounter
	SUB R1, R1, #1
	CMP R1, #0
	BNE countNonNegativeLoop
	BEQ end

countNonNegativereturnMaxCounter:
	ADD R0, R0, #1
	SUB R1, R1, #1
	CMP R1, #0
	BNE countNonNegativeLoop
	BEQ end
@----------------------------------------
countMatches:
	MOV R2, R0
	MOV R0, #0

matchLoop:
	LDRB R3, [R2], #1
	CMP R3, R1
	BEQ matchreturnMaxCounter
	CMP R3, #0
	BNE matchLoop
	CMP R0, #0
	BEQ NoMatches
	BNE end

NoMatches:
	SUB R0, R0, #1
	BX LR

matchreturnMaxCounter:
	ADD R0, R0, #1
	CMP R3, #0
	BNE matchLoop
@----------------------------------------
uint8ToBinaryString:
	MOV R2, #0x80

uint8ToBinaryStringLoop:
	TST R1, R2
	MOVNE R3, #'1'
	MOVEQ R3, #'0'
	STRB R3, [R0], #1
	MOVS R2, R2, LSR #1
	BNE uint8ToBinaryStringLoop
	MOV R3, #0
	STRB R3, [R0]
	BX LR
@----------------------------------------
int16ToBinaryString:
	MOV R2, #0x8000

int16ToBinaryStringLoop:
	TST R1, R2
	MOVNE R3, #'1'
	MOVEQ R3, #'0'
	STRB R3, [R0], #1
	MOVS R2, R2, LSR #1
	BNE int16ToBinaryStringLoop
	MOV R3, #0
	STRB R3, [R0]
	BX LR
@----------------------------------------
getParity:
	MOV R2, #1
	MOV R1, R0
	MOV R5, #0
	AND R3, R1, R2
	CMP R3, #1
	BEQ getParityreturnMaxCounter
	
getParityLoop:
	MOV R1, R1, LSR #1
	AND R3, R1, R2
	CMP R3, #1
	BEQ getParityreturnMaxCounter
	AND R0, R5, R2
	BX LR

getParityreturnMaxCounter:
	ADD R5, R5, #1
	B getParityLoop
@----------------------------------------
returnMax:
	LDR R3, [R0], #4

returnMaxLoop:
	LDR R4, [R0], #4
	CMP R4, R3
	BGE returnMaxSave
	BLT returnMaxCounter

returnMaxSave:
	MOV R3, R4
	B returnMaxCounter

returnMaxCounter:
	SUB R1, R1, #1
	CMP R1, #0
	BEQ returnMaxExit
	B returnMaxLoop

returnMaxExit:
	MOV R0, R3
	BX LR
@----------------------------------------
returnMin:
	LDR R3, [R0], #4

returnMinLoop:
	LDR R4, [R0], #4
	CMP R3, R4
	BGE returnMinSave
	BLT returnMinCounter

returnMinSave:
	MOV R3, R4
	B returnMinCounter

returnMinCounter:
	SUB R1, R1, #1
	CMP R1, #0
	BEQ returnMinExit
	B returnMinLoop

returnMinExit:
	MOV R0, R3
	BX LR
@----------------------------------------
end:
	BX LR
