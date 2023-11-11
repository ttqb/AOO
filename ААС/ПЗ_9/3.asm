%include 'io.inc'
section .data
section .bss
userinput resb 255
search resb 100
section .text
global CMAIN

CMAIN:
    mov ebp,esp; for correct debugging
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx
    GET_STRING userinput, 255
    GET_STRING search, 100
    jmp firstsearch
    
    
firstsearch:
    mov bl, [userinput + ecx]
    cmp bl, [search]
    je got
    inc ecx
    inc bh
    cmp bl, 10
    je nfound
    jmp firstsearch
    
got:
    mov bl, [userinput + ecx]
    mov al, [search + edx]
    cmp al,10
    je found
    inc ecx
    inc edx
    cmp bl,al
    je got
    jne firstsearch
found:
    xor eax,eax
    mov al, bh
    jmp end
    
nfound:
    mov eax,-1
    jmp end


end:
    PRINT_DEC 4,eax
    xor eax,eax
    xor ebx,ebx
    ret
    