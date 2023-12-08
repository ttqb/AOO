%include 'io.inc'

section .data
    array dd 1,2,3,4,5,0,2,2,6 ; Массив данных
    rows dd 3 ; Количество строк
    rowsize dd 3 ; Размер строки
    min dd 4 ; Минимальное значение
    minrow dd 0 ; Строка с минимальным значением

section .text
    global CMAIN

CMAIN:
    mov ebp, esp ; для корректной отладки
    xor ebx, ebx ; Обнуление регистра ebx
    xor eax, eax ; Обнуление регистра eax
    xor ecx, ecx ; Обнуление регистра ecx
    xor edx, edx ; Обнуление регистра edx
loopa:
    cmp ecx, [rows] ; Сравнение ecx с количеством строк
    je isend ; Если равны, переход к метке 'isend'
    cmp ebx, [rowsize] ; Сравнение ebx с размером строки
    je resetitemoffset ; Если равны, переход к метке 'resetitemoffset'
    mov eax, [rowsize] ; Загрузка размера строки в eax
    imul ecx ; Умножение ecx на значение в eax
    add eax, ebx ; Добавление ebx к eax
    shl eax, 2 ; Сдвиг eax влево на 2 бита
    mov edx, [min] ; Загрузка минимального значения в edx
    cmp dword[array + eax], edx ; Сравнение значения в массиве с edx
    jl changemin ; Если значение в массиве меньше, переход к метке 'changemin'
    inc ebx ; Инкрементация ebx
    jmp loopa ; Переход к метке 'loopa'
resetitemoffset:
    xor ebx, ebx ; Обнуление регистра ebx
    inc ecx ; Инкрементация ecx
    jmp loopa ; Переход к метке 'loopa'
changemin:
    mov edx, [array + eax] ; Загрузка значения из массива в edx
    mov [min], edx ; Запись значения edx в min
    mov [minrow], ecx ; Запись значения ecx в minrow
    inc ebx ; Инкрементация ebx
    jmp loopa ; Переход к метке 'loopa'
isend:
    cmp ebx, [rowsize] ; Сравнение ebx с размером строки
    je cont ; Если равны, переход к метке 'cont'
cont:
    xor eax, eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    xor edx, edx ; Обнуление регистра edx
    xor ecx, ecx ; Обнуление регистра ecx
    mov ecx, [minrow] ; Загрузка строки с минимальным значением в ecx
    cmp ecx, 0 ; Сравнение ecx с 0
    je end ; Если равны, переход к метке 'end'
swap:
    cmp ebx, [rowsize] ; Сравнение ebx с размером строки
    je end ; Если равны, переход к метке 'end'
    mov eax, [rowsize] ; Загрузка размера строки в eax
    imul ecx ; Умножение ecx на значение в eax
    add eax, ebx ; Добавление ebx к eax
    shl eax, 2 ; Сдвиг eax влево на 2 бита
    mov edx, [array + ebx * 4] ; Загрузка значения из массива в edx
    push edx ; Запись edx в стек
    mov edx, [array + eax] ; Загрузка значения из массива в edx
    xchg edx, [array + ebx * 4] ; Обмен значениями между edx и элементом массива
    pop edx ; Извлечение значения из стека в edx
    xchg edx, [array + eax] ; Обмен значениями между edx и элементом массива
    inc ebx ; Инкрементация ebx
    jmp swap ; Переход к метке 'swap'
end:
    mov eax, [rows]
    mov ecx, 0
    mov edx, [rowsize]
newloopa:
    cmp eax, [rows]
    je not_print
    PRINT_CHAR 10
    cmp eax, 0
    je newenda
    dec eax
    mov edx, [rowsize]
newloopa1:
    PRINT_DEC 4, [array + ecx]
    add ecx, 4
    dec edx
    cmp edx, 0
    je newloopa
    jne newloopa1
newenda:
    xor eax, eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    ret ; Возврат из функции
not_print:
    cmp eax, 0
    je newenda
    dec eax
    mov edx, [rowsize]
newloopa12:
    PRINT_DEC 4, [array + ecx]
    add ecx, 4
    dec edx
    cmp edx, 0
    je newloopa
    jne newloopa12
