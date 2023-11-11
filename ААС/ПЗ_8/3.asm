%include 'io.inc'
section .data
YEA db "It's dividble by 10!",0
NAH db "It isn't dividble by 10!",0
section .bss
section .text
global CMAIN
CMAIN:
    mov ebp, esp    ;для отладки
    xor edx, edx    ;обнуление регистра
    xor eax, eax    ;обнуление регистра
    mov al, 25      ;задаем проверяемое число
    mov bl, 10      ;задаем 10
    div bl          ;делим число на 10, результат в al, остаток в ah
    cmp ah, 0       ;проверяем остаток с 0
    je YES          ;если равны то прыгаем на YES
    jmp NO          ;иначе прыгаем на NO
YES:
    PRINT_STRING[YEA] ;вывод результата
    jmp end           ;прыжок в конец
NO:
    PRINT_STRING[NAH] ;вывод результата
    jmp end           ;прыжок в конец
end:
    xor eax, eax      ;обнуление регистра
    xor ebx, ebx      ;обнуление регистра
    ret               ;для корректного завершения программы