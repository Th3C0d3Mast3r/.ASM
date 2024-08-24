; the below code is for ADDING two 8-BIT numbers
DATA SEGMENT
num1 dw 03h
num2 dw 04h
result dw 01 dup(?)
DATA ENDs



ASSUME CS:CODE, DS:DATA
CODE SEGMENT
START:
MOV AX, DATA
MOV DS, AX
MOV AX, num1
MOV BX, num2
ADD AX, BX
MOV result, AX

MOV AH, 4Ch
INT 21H

CODE ENDS
END START
