%include 'io.inc'
section .data
section .bss
    string resb 1000
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx
    GET_STRING string,100
loopa:
    mov ebx, string
    cmp byte[ebx+ecx],0
    je cont
    inc ecx
    jmp loopa
cont:
    PRINT_CHAR [ebx+ecx]
    dec ecx
    cmp byte[ebx+ecx],0
    je end
    jmp cont
end:
    xor eax,eax
    ret