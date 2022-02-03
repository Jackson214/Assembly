.global minS8

.text 

minS8:
	CMP R0, R1
	BLE negative
	MOV R0, R1

negative:
	BX LR
