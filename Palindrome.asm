; THIS IS THE CODE FOR PALINDROME STRING IN ASM
DATA SEGMENT
String1 db "ABCD","$"
String2 db 1 dup(?)
palin db "PALINDROME", "$"
npalin db "NOT PALINDROME", "$"
DATA ENDS


ASSUME DS:DATA, CS:CODE
CODE SEGMENT
START:
	MOV AX, DATA
	MOV DS, AX
	MOV CL, 04
	
	LEA SI, String1
	LEA DI, String2

	ADD DI, CL
	MOV BYTE PTR [DI], '$'
	DEC DI

rev:
	MOV AL, [SI]
	MOV [DI], AL
	INC SI
	DEC DI
	DEC CL
	JNZ rev

; TILL HERE IS THE SIMILAR CODE AS THAT WE HAVE FOR STRING REVERSAL

	LEA SI, String1     ; We bring the pointers back to the start of where the string is stored
	LEA DI, String2
	
	MOV CX, 04
	CLD                 ; direction flag is set back to zero-so that we check from left to right
	REPE CMPSB
	JNZ notty
	
	LEA DX, palin
	MOV AH, 09H
	INT 21h
	JMP terminator

notty:
	LEA DX, npalin
	MOV AH, 09H
	INT 21h
	JMP terminator

terminator:
	MOV AH, 4Ch
	INT 21H
CODE ENDS
END START