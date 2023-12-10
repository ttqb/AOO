%include 'io.inc'

section .bss
    tmp resd 1

section .data
    a db 1
    b db 2
    c db 3
    d db 4

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov al, byte [a]
    mov byte [tmp + 3], al
    mov al, byte [b]
    mov byte [tmp + 2], al
    mov al, byte [c]
    mov byte [tmp + 1], al
    mov al, byte [d]
    mov byte [tmp], al
    mov eax, dword [tmp]
    ret