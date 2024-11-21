DATA SEGMENT
    userName db "username", "$"     ; the username that is in the database
    password db "passwords", "$"    ; the passwords associated with the username

    userInput db 20 dup(?)           ; holds the user's input for the userInput
    passInput db 20 dup(?)           ; holds the user's input for the userPass

    promptUser db "Enter the Username Below:- ", "$"
    promptPass db "Enter Password:- ","$"

    alertUser db "Wrong Username!", "$"
    alertPass db "Wrong Passwords!", "$"
DATA ENDS

ASSUME DS:DATA, CS:CODE
CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    ; NOW WE HIT A PROMPT FOR ENTERING USERNAME
    LEA DX, promptUser
    MOV AH, 09h
    INT 21h

    LEA DX, userInput               ; and stores it in userInput
    MOV AH, 0Ah                     ; takes the input from the user
    INT 21h

    LEA SI, username                ; checking whether the username input by the person is correct or no
    LEA DI, userInput+1

    MOV CX, 20
    REPE CMPSB          
    JNZ wrongUserName               ; if the username is wrong, we go from here to the wrongUsername

    ; NOW WE HIT A PROMPT FOR ENTERING PASSWORD
    LEA DX, promptPass
    MOV AH, 09h
    INT 21h

    ; TURN OFF THE ECHO ON THE SCREEN OF PASSWORD
    LEA DX, passInput               ; and stores it in passInput
    MOV AH, 07h                     ; takes the input from the user (without echo)
    INT 21h

    LEA SI, password                ; checking whether the username input by the person is correct or no
    LEA DI, passInput+1

    MOV CX, 20
    REPE CMPSB          
    JNZ wrongPassword

    JMP terminator

    wrongUserName:
        LEA DX, alertUser
        MOV AH, 09h
        INT 21h
        JMP terminator
    wrongPassword:
        LEA DX, alertUser
        MOV AH, 09h
        INT 21h
        JMP terminator
    
    terminator:

        MOV AH, 4Ch
        INT 21h
CODE ENDS
END START

