%include 'io.inc'

section .data
    _even db `even`, 0
    _odd db `odd`, 0

section .text
global CMAIN

CMAIN:
    mov ebp, esp
    mov eax, 23
    shr ax, 1
    jc odd
    jmp even

even:
    PRINT_STRING [_even]
    jmp done

odd:
    PRINT_STRING [_odd]
    jmp done
    
done:
    mov eax, 1
    xor ebx, ebx
    ret