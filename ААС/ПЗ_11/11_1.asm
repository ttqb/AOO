%include 'io.inc'

section .text
global CMAIN

CMAIN:
    xor eax, eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    xor ecx, ecx ; Обнуление регистра ecx
    xor edx, edx ; Обнуление регистра edx
loopa:
    GET_CHAR eax ; Получение символа от пользователя
    cmp eax, 10 ; Сравнение символа с ASCII-кодом новой строки (10)
    je end ; Если символ - новая строка, переход к метке 'end'
    PRINT_CHAR eax ; Печать символа
    PRINT_CHAR eax ; Печать символа ещё раз
    jmp loopa ; Переход к метке 'loopa'
end:
    xor eax, eax
    xor ebx, ebx
    ret