%include 'io.inc'

section .data
    array db 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ; Массив данных
    len equ $-array ; Длина массива

section .text
global CMAIN

CMAIN:
    mov ecx, len ; Загрузка длины массива в ecx
    mov esi, array ; Загрузка адреса массива в esi
    xor edi, edi ; Обнуление регистра edi
    mov eax, [esi] ; Загрузка первого элемента массива в eax
next:
    cmp eax, [esi + edi] ; Сравнение текущего элемента массива с eax
    jg swap ; Если текущий элемент больше, переход к метке 'swap'
    jmp cont ; Если текущий элемент не больше, переход к метке 'cont'
swap:
    mov eax, [esi + edi] ; Загрузка текущего элемента в eax
    mov ebx, edi ; Загрузка текущего индекса в ebx
cont:
    add edi, 4 ; Увеличение индекса на 4
    loop next ; Переход к метке 'next', пока ecx не равен 0

    mov edx, [esi] ; Загрузка первого элемента массива в edx
    mov [esi], eax ; Запись минимального элемента в первую ячейку массива
    mov [esi + ebx], edx ; Запись первого элемента на место минимального

    mov eax, 1 ; Загрузка 1 в eax
    ret ; Завершение программы