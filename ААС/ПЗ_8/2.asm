section .text
global main
main:
    mov ebp, esp
    mov al, 00010101b
    mov ecx, 8
    mov bl, al
    next_bit:
        shr al, 1
        rcl bl, 1
        loop next_bit
    mov al, bl
    ret