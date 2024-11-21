; the following is a code for drawing a TRIANGLE using ASM Language


.model small
.data
mess db 'This program prints a Gray triangle. Press any key to continue...$'
.stack 100h


.code
main proc
mov ax, @data ; Initialize data segment
mov ds, ax

; Display the message
mov ah, 09h ; DOS function to display string
lea dx, mess ; Load the address of the message into DX
int 21h ; Call DOS interrupt to display the message

; Wait for key press
mov ah, 01h ; DOS function to wait for a key press
int 21h

; Set video mode to graphical (320x200, 256 colors)
mov al, 13h ; 13h is the mode for 320x200 with 256 colors
mov ah, 0 ; 0 is the function to set video mode
int 10h ; Call BIOS interrupt to set the video mode

; Draw triangle
mov cx, 160 ; Starting x position (center of the screen)
mov dx, 50 ; Starting y position (top of the triangle)
mov bx, 1 ; Initial width of the triangle's row

draw_triangle: ; Outer loop
    push cx ; Preserve starting x position
    push bx ; Preserve width of the current row

    draw_line: ; Inner loop to draw a horizontal line
        mov ah, 0Ch ; BIOS function to draw a pixel
        mov al, 08h ; Set pixel color to gray
        int 10h ; Call BIOS interrupt to plot the pixel
        inc cx ; Move to the next pixel in the row
        dec bx ; Decrease remaining pixels in the row
        jnz draw_line ; If bx is not zero, continue drawing the line

    pop bx ; Restore the width of the row
    pop cx ; Restore the starting x position

    add dx, 1 ; Move down one row
    dec cx ; Shift starting x position left for symmetry
    add bx, 2 ; Increase the row width for the triangle's base
    cmp dx, 150 ; Stop drawing once we reach the base (y = 150)
    jl draw_triangle ; If not at the base, continue drawing
; Wait for key press to exit
mov ah, 01h ; DOS function to wait for a key press
int 21h

; Reset video mode back to text mode
mov al, 03h ; 03h is the mode for 80x25 text mode
mov ah, 0 ; 0 is the function to set video mode
int 10h ; Call BIOS interrupt to set text mode

; Exit program
mov ah, 4Ch ; DOS function to exit program
int 21h ; Call DOS interrupt to exit
main endp
end main
