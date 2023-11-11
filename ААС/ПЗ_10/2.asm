%include 'io.inc'
section .data
section .bss
    array resd 4000
    rows resd 1
    cols resd 1
    elemc resd 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax,eax
    xor ebx, ebx
    xor ecx, ecx
    
    GET_DEC 4, rows
    GET_DEC 4, cols
    
    mov eax, [rows]
    mul dword [cols]
    mov [elemc], eax
    
    xor eax,eax
    xor ebx, ebx
    xor ecx, ecx
    
createarr:
    GET_DEC 4, eax
    cmp ebx,[elemc]
    jg created
    mov [array + ebx + (3 * ebx)], eax
    inc ebx
    cmp ebx,[elemc]
    jne createarr
    
created:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ret