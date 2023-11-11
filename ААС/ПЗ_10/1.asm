%include 'io.inc'
section .data
    array dd 1,2,3,4,5,2,2,0,4,5,6,7
    rows dd 4
    rowsize dd 3
    min dd 4
    minrow dd 0
section .bss
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor ebx,ebx
    xor eax,eax
    xor ecx,ecx
    xor edx,edx
loopa:
    cmp ecx, [rows]
    je isend
    cmp ebx, [rowsize]
    je  resetitemoffset
    mov eax, [rowsize]
    imul ecx
    add eax,ebx
    shl eax,2
    mov edx, [min]
    cmp dword[array + eax],edx
    jl changemin
    inc ebx
    jmp loopa
resetitemoffset:
    xor ebx,ebx
    inc ecx
    jmp loopa
changemin:
    mov edx,[array+eax]
    mov [min],edx
    mov [minrow],ecx
    inc ebx
    jmp loopa
isend:
    cmp ebx,[rowsize]
    je cont

cont:
    xor eax,eax
    xor ebx,ebx
    xor edx,edx
    xor ecx,ecx
    mov ecx,[minrow]
    cmp ecx,0
    je end
swap:
    cmp ebx,[rowsize]
    je end
    mov eax, [rowsize]
    imul ecx
    add eax,ebx
    shl eax,2
    mov edx, [array + ebx * 4]
    push edx
    mov edx, [array + eax]
    xchg edx, [array + ebx * 4]
    pop edx
    xchg edx, [array + eax]
    inc ebx
    jmp swap
 
end:
    xor eax,eax
    xor ebx,ebx   
    ret ; to calculate 2 dimensional array item you need to use this: base + (rowsize*rowoffset + itemoffset) * itemsize