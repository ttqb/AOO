%include 'io.inc'

section .data
    number1 dd 10
    number2 dd 15
    
section .bss
    result resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov eax, 0
    add eax, [number1]
    add eax, [number2]
    mov dword [result], eax
    ret