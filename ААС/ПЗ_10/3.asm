%include 'io.inc'

section .data
    array db 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
    len equ $-array

section .text
    global CMAIN
CMAIN:
    mov ecx, len
    mov esi, array
    xor edi, edi
    mov eax, [esi]
next:
    cmp eax, [esi+edi]
    jg swap
    jmp cont
swap:
    mov eax, [esi+edi]
    mov ebx, edi
cont:
    add edi, 4
    loop next

    mov edx, [esi]
    mov [esi], eax
    mov [esi+ebx], edx

    mov eax, 1
    int 0x80