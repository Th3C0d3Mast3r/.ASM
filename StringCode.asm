EXTRA SEGMENT
String2 db "COALAB", "$"            ; this is an extra segment where string2 is stored
EXTRA ENDS

DATA SEGMENT
String1 db "COALAB", "$"            ; this is where the string1 is stored
equals db "EQUAL", "$"              ; here we initialzed a variable which has the value of EQUALS
nequals db "NOT EQUAL", "$"         ; and here, we initialized to NOT EQUAL
DATA ENDS

ASSUME CS:CODE, DS:DATA, ES:EXTRA
CODE SEGMENT
START:
	MOV AX, DATA
	MOV DS, AX
	
	MOV AX, EXTRA
	MOV ES, AX
	
	LEA SI, String1                 ; the LEA statement is same as MOV. Just that, LEA is for String
	LEA DI, String2
	
	MOV CX, 06                      ; this is an imp statment. Tells the program the length of our STRING(in data segment)
	CLD                             ; Command to clear DATA FLAG
	REPE CMPSB                      ; this means REPEATED COMPARE STRING BYTE
	JNZ noty
	
	LEA dx, equals                  ; the 09h is the interrupt which allows the printing of custom String
	MOV AH, 09h
	INT 21H
	JMP terminator


	noty:	LEA dx, nequals
		MOV AH, 09h
		INT 21H
		JMP terminator

	terminator:	MOV AH, 4Ch
			    INT 21H
CODE ENDS
END START