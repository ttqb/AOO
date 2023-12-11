%include 'io.inc'

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov edi, 8
    mov esi, 5
    add edi, esi
    mov edx, edi
    ret