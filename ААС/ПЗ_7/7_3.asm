%include 'io.inc'

section .data
    array db 1, 2, 3

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov esi, array
    mov al, array[0]
    xor ebx, ebx
    add bl, al
    mov edx, 0
    inc edx
    mov al, array[edx]
    _loop:
        cmp al, 0
        je done
        add bl, al
        inc edx
        mov al, array[edx]
        jmp _loop
done:
    mov eax, ebx
    mov eax, 1
    xor ebx, ebx
    ret