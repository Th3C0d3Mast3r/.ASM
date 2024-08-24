; the below code is for ADDING 2 16-BIT integers
DATA SEGMENT
num1 dw 1234h
num2 dw 4567h
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
MOV CX, 000H
JNC xyz
INC CX

xyz: MOV result, AX
     MOV [result+2], CX

MOV AH, 4Ch
INT 21H

CODE ENDS
END START
