%include 'io.inc'

section .data
    nzero db `not_zero`, 0
    izero db `is_zero`, 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov ax, 250
    mov bx, 10
    xor dx, dx
    div bx
    test dx, dx
    jz is_zero
    not_zero:
        PRINT_STRING [nzero]
        jmp end
    is_zero:
        PRINT_STRING [izero]
        jmp end
    end:
        ret