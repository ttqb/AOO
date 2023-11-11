%include 'io.inc' ; Включение файла 'io.inc'

section .data ; Секция данных
section .bss ; Секция неинициализированных данных
str1 resb 100 ; Резервирование 100 байтов под строку str1
str2 resb 100 ; Резервирование 100 байтов под строку str2

section .text ; Секция текста
global CMAIN ; Глобальная функция CMAIN

CMAIN:
    mov ebp, esp ; для корректной отладки
    xor eax, eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    xor ecx, ecx ; Обнуление регистра ecx
    xor edx, edx ; Обнуление регистра edx
    GET_STRING str1,100 ; Получение строки str1 длиной 100 символов
    GET_STRING str2,100 ; Получение строки str2 длиной 100 символов
findend:
    mov al, [str1+edx] ; Загрузка символа из строки str1 в al
    cmp al, 10 ; Сравнение символа с ASCII-кодом новой строки (10)
    je concat ; Если символ - новая строка, переход к метке 'concat'
    inc edx ; Инкрементация edx
    jmp findend ; Переход к метке 'findend'
concat:
    mov bl, [str2+ecx] ; Загрузка символа из строки str2 в bl
    cmp bl,10 ; Сравнение символа с ASCII-кодом новой строки (10)
    je print ; Если символ - новая строка, переход к метке 'print'
    mov [str1+edx],bl ; Запись символа из bl в строку str1
    inc ecx ; Инкрементация ecx
    inc edx ; Инкрементация edx
    jmp concat ; Переход к метке 'concat'
print:
    PRINT_STRING[str1] ; Печать строки str1
    xor eax,eax ; Обнуление регистра eax
    xor ebx,ebx ; Обнуление регистра ebx
    xor ecx,ecx ; Обнуление регистра ecx
    ret ; Возврат из функции
