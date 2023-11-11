%include 'io.inc'

section .bss
    userinput resb 255 ; Резервирование 255 байтов под ввод пользователя
    search resb 100 ; Резервирование 100 байтов под поиск

section .text
global CMAIN

CMAIN:
    mov ebp, esp; для корректной отладки
    xor eax, eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    xor ecx, ecx ; Обнуление регистра ecx
    xor edx, edx ; Обнуление регистра edx
    GET_STRING userinput, 255 ; Получение строки от пользователя
    GET_STRING search, 100 ; Получение строки для поиска
    jmp firstsearch ; Переход к первому поиску
firstsearch:
    mov bl, [userinput + ecx] ; Загрузка символа из ввода пользователя в bl
    cmp bl, [search] ; Сравнение символа с первым символом строки поиска
    je got ; Если символы совпадают, переход к метке 'got'
    inc ecx ; Инкрементация ecx
    inc bh ; Инкрементация bh
    cmp bl, 10 ; Сравнение символа с ASCII-кодом новой строки (10)
    je nfound ; Если символ - новая строка, переход к метке 'nfound'
    jmp firstsearch ; Переход к первому поиску
got:
    mov bl, [userinput + ecx] ; Загрузка символа из ввода пользователя в bl
    mov al, [search + edx] ; Загрузка символа из строки поиска в al
    cmp al, 10 ; Сравнение символа с ASCII-кодом новой строки (10)
    je found ; Если символ - новая строка, переход к метке 'found'
    inc ecx ; Инкрементация ecx
    inc edx ; Инкрементация edx
    cmp bl, al ; Сравнение символов
    je got ; Если символы совпадают, переход к метке 'got'
    jne firstsearch ; Если символы не совпадают, переход к первому поиску
found:
    xor eax, eax ; Обнуление регистра eax
    mov al, bh ; Загрузка значения bh в al
    jmp end ; Переход к метке 'end'
nfound:
    mov eax, -1 ; Загрузка -1 в eax
    jmp end ; Переход к метке 'end'
end:
    PRINT_DEC 4, eax ; Печать значения eax
    xor eax, eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    ret ; Возврат из функции