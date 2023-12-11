%include 'io.inc'

section .bss
    str1 resb 255 ; Резервирование 255 байтов под ввод пользователя
    str2 resb 100 ; Резервирование 100 байтов под поиск

section .text
global CMAIN

CMAIN:
    mov ebp, esp; для корректной отладки
    xor eax, eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    xor ecx, ecx ; Обнуление регистра ecx
    xor edx, edx ; Обнуление регистра edx
    GET_STRING str1, 255 ; Получение строки от пользователя
    GET_STRING str2, 100 ; Получение строки для поиска
    jmp firststr2 ; Переход к первому поиску
firststr2:
    mov bl, [str1 + ecx] ; Загрузка символа из ввода пользователя в bl
    cmp bl, [str2] ; Сравнение символа с первым символом строки поиска
    je got ; Если символы совпадают, переход к метке 'got'
    inc ecx ; Инкрементация ecx
    inc bh ; Инкрементация bh
    cmp bl, 10 ; Сравнение символа с ASCII-кодом новой строки (10)
    je nfound ; Если символ - новая строка, переход к метке 'nfound'
    jmp firststr2 ; Переход к первому поиску
got:
    mov bl, [str1 + ecx] ; Загрузка символа из ввода пользователя в bl
    mov al, [str2 + edx] ; Загрузка символа из строки поиска в al
    cmp al, 10 ; Сравнение символа с ASCII-кодом новой строки (10)
    je found ; Если символ - новая строка, переход к метке 'found'
    inc ecx ; Инкрементация ecx
    inc edx ; Инкрементация edx
    cmp bl, al ; Сравнение символов
    je got ; Если символы совпадают, переход к метке 'got'
    jne firststr2 ; Если символы не совпадают, переход к первому поиску
found:
    xor eax, eax ; Обнуление регистра eax
    mov al, bh ; Загрузка значения bh в al
    jmp end ; Переход к метке 'end'
nfound:
    mov eax, -1 ; Загрузка -1 в eax
    jmp end ; Переход к метке 'end'
end:
    PRINT_DEC 4, eax ; Печать значения eax
    xor eax, eax
    xor ebx, ebx
    ret