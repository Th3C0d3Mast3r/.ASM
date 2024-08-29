DATA SEGMENT
DATA ENDS

EXTRA SEGMENT
EXTRA ENDS

ASSUME CS:CODE, DS:DATA, ES:EXTRA
CODE SEGMENT
START:
MOV AX, 1000H
MOV DS, AX

MOV AX, 2000H                           ; this is the other segment where we are moving the numbers
MOV ES, AX

MOV SI, 0000H
MOV DI, 0000H
MOV CL, 0AH                             ; the counter is set for 10numbers, thus we will be moving only 10numbers 

xyz: MOV AX, [SI]                       ; the brackets [] specify they are the values
     MOV ES:[DI], AX                    ; ES:[DI] is needed because we show, it is ES's DI we are referring to
     ADD SI, 02
     ADD DI, 02
     DEC CL
     JNZ xyz   

MOV AH, 4Ch
INT 21h

CODE ENDS
END START
