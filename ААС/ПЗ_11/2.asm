%include 'io.inc'
section .data
section .bss
section .text
global CMAIN
CMAIN:
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx
loopa:
    GET_CHAR eax
    cmp eax,10
    je end
    PRINT_CHAR eax
    PRINT_CHAR eax
    jmp loopa

end:
    xor eax,eax
    xor ebx,ebx
    GET_CHAR eax
    ret