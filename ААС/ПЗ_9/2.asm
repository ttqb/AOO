%include 'io.inc'
section .data
section .bss
str1 resb 100
str2 resb 100
section .text
global CMAIN
CMAIN:
    mov ebp, esp            ;for correct debugging
    xor eax, eax            ;обнуляем регистр
    xor ebx, ebx            ;обнуляем регистр
    xor ecx, ecx            ;обнуляем регистр
    xor edx, edx            ;обнуляем регистр
    GET_STRING str1,100     ;выводим str1 длинной в 100 символов
    GET_STRING str2,100     ;выводим str2 длинной в 100 символов
findend:
    mov al, [str1+edx]      ;передвигаем в регистр al значение из строки str1
    cmp al, 10              ;сравниваем регистр al с 10 (символ новой строки)
    je concat               ;если равны конкатинация
    inc edx                 ;
    jmp findend
concat:
    mov bl, [str2+ecx]
    cmp bl,10
    je print
    mov [str1+edx],bl
    inc ecx
    inc edx
    jmp concat
print:
    PRINT_STRING[str1]
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    ret
    