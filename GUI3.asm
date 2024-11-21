; this is the code that is for printing a SQUARE
; the logic being, in triangle, the horizontal length went on increasing-here it wont increase

DATA SEGMENT
    message db 'Press any Key To View Gray Triangle. . . $'
DATA ENDS

STACK SEGMENT STACK
    DB 100H DUP(?)
STACK ENDS

ASSUME DS:DATA, CS:CODE, SS:STACK

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    MOV AX, STACK
    MOV SS, AX
    MOV SP, 100H

    MOV AH, 09H                     ; Print string
    LEA DX, message
    INT 21H

    MOV AH, 01H                     ; Wait for key press
    INT 21H

    MOV AL, 13H                     ; Set 320x200 video mode
    MOV AH, 0
    INT 10H

    ; Initialize starting coordinates and base width
    MOV CX, 160                     ; Center X-coordinate
    MOV DX, 50                      ; Starting Y-coordinate
    MOV BX, 50                       ; Initial base width (1 pixel)

triangles:
    PUSH CX                         ; Save the center position
    PUSH BX                         ; Save the base width

drawLines:
    MOV AH, 0Ch
    MOV AL, 08H                     ; Gray color
    INT 10H                         ; Plot pixel at (CX, DX)
    INC CX                          ; Move to the next pixel in the row
    JNZ drawLines                   ; Loop until the row is complete

    POP BX                          ; Restore base width
    POP CX                          ; Restore center position
    DEC CX                          ; Shift starting X left for symmetry
    INC DX                          ; Move down to the next row
    CMP DX, 150                     ; Limit to 100 rows (half screen height)
    JL triangles                    ; Continue if not done

    MOV AH, 01H                    ; Wait for key press to end
    INT 21H

    MOV AL, 03H                    ; Reset to text mode
    MOV AH, 0
    INT 10H

    MOV AH, 4Ch                    ; Exit
    INT 21H
CODE ENDS
END START
