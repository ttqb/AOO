%include 'io.inc' ; Включение файла 'io.inc'

section .data ; Секция данных
section .bss ; Секция неинициализированных данных
    string resb 1000 ; Резервирование 1000 байтов под строку

section .text ; Секция текста
global CMAIN ; Глобальная функция CMAIN

CMAIN:
    mov ebp, esp ; для корректной отладки
    xor eax,eax ; Обнуление регистра eax
    xor ebx,ebx ; Обнуление регистра ebx
    xor ecx,ecx ; Обнуление регистра ecx
    xor edx,edx ; Обнуление регистра edx
    GET_STRING string,100 ; Получение строки от пользователя длиной 100 символов
loopa:
    mov ebx, string ; Загрузка адреса строки в ebx
    cmp byte[ebx+ecx],0 ; Сравнение текущего символа строки с нулем (конец строки)
    je cont ; Если текущий символ - ноль, переход к метке 'cont'
    inc ecx ; Инкрементация ecx
    jmp loopa ; Переход к метке 'loopa'
cont:
    PRINT_CHAR [ebx+ecx] ; Печать текущего символа строки
    dec ecx ; Декрементация ecx
    cmp byte[ebx+ecx],0 ; Сравнение текущего символа строки с нулем (конец строки)
    je end ; Если текущий символ - ноль, переход к метке 'end'
    jmp cont ; Переход к метке 'cont'
end:
    xor eax,eax ; Обнуление регистра eax
    ret ; Возврат из функции
