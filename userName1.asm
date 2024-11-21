DATA SEGMENT
username db "usernamess", 0   ; this is of size 11 (null-terminated)
password db "passwordss", 0    ; this is of size 11 (null-terminated)

prompt1 db "ENTER USERNAME BELOW:-","$"
prompt2 db "PASSWORD:-","$"

output1 db "LOGGED IN","$"
output2 db "INTRUDER ALERT","$"

String1 db 11 dup(0)  ; buffer for username input
String2 db 11 dup(0)  ; buffer for password input

DATA ENDS

ASSUME DS:DATA, CS:CODE
CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

; NOW COMES THE LOGIC OF TAKING INPUT FROM THE USER

    LEA SI, String1

    CLD
    LEA DX, prompt1    ; prompt for writing the username
    MOV AH, 09h
    INT 21h

user:    
    MOV AH, 01H        ; this is for the username input
    INT 21h
    CMP AL, 0DH        ; Check for carriage return (Enter key)
    JE  end_user_input ; Jump to end if Enter key pressed
    MOV [SI], AL       ; Store the input character
    INC SI             ; Move to the next position
    JMP user           ; Repeat for the next character

end_user_input:
    MOV BYTE PTR [SI], 0 ; Null-terminate the string

    ; Compare the username
    LEA SI, String1     ; Reset pointer to the start of String1
    LEA DI, username
    
    MOV CX, 11          ; Compare up to 11 characters
    CLD                 ; direction flag is set back to zero
    REPE CMPSB
    JNZ notty           ; Jump if not equal

; LOGIC FOR PASSWORD AUTHENTICATION

    LEA SI, String2

    CLD
    LEA DX, prompt2    ; prompt for password input
    MOV AH, 09h
    INT 21h

pas:
    MOV AH, 07H        ; this is for the password input
    INT 21h
    CMP AL, 0DH        ; Check for carriage return (Enter key)
    JE  end_pass_input ; Jump to end if Enter key pressed
    MOV [SI], AL       ; Store the input character
    INC SI             ; Move to the next position
    JMP pas            ; Repeat for the next character

end_pass_input:
    MOV BYTE PTR [SI], 0 ; Null-terminate the string

    ; Compare the password
    LEA SI, String2     ; Reset pointer to the start of String2
    LEA DI, password
    
    MOV CX, 11          ; Compare up to 11 characters
    CLD                 ; direction flag is set back to zero
    REPE CMPSB
    JNZ notty           ; Jump if not equal

    ; If both username and password are correct
    LEA DX, output1     ; Output logged in message
    MOV AH, 09H
    INT 21h
    JMP terminator

notty: 
    LEA DX, output2     ; Output intruder alert message
    MOV AH, 09H
    INT 21h

terminator:
    MOV AH, 4Ch
    INT 21H
    
CODE ENDS
END START
