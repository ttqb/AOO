%include 'io.inc' ; Включение файла 'io.inc'

section .data ; Секция данных
section .bss ; Секция неинициализированных данных
    array resd 4000 ; Резервирование 4000 двойных слов под массив
    rows resd 1 ; Резервирование двойного слова под количество строк
    cols resd 1 ; Резервирование двойного слова под количество столбцов
    elemc resd 1 ; Резервирование двойного слова под количество элементов

section .text ; Секция текста
global CMAIN ; Глобальная функция CMAIN

CMAIN:
    mov ebp, esp ; для корректной отладки
    xor eax,eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    xor ecx, ecx ; Обнуление регистра ecx
    
    GET_DEC 4, rows ; Получение количества строк
    GET_DEC 4, cols ; Получение количества столбцов
    
    mov eax, [rows] ; Загрузка количества строк в eax
    mul dword [cols] ; Умножение на количество столбцов
    mov [elemc], eax ; Запись количества элементов
    
    xor eax,eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    xor ecx, ecx ; Обнуление регистра ecx
    
createarr:
    GET_DEC 4, eax ; Получение значения элемента
    cmp ebx,[elemc] ; Сравнение ebx с количеством элементов
    jg created ; Если ebx больше количества элементов, переход к метке 'created'
    mov [array + ebx + (3 * ebx)], eax ; Запись значения элемента в массив
    inc ebx ; Инкрементация ebx
    cmp ebx,[elemc] ; Сравнение ebx с количеством элементов
    jne createarr ; Если не равны, переход к метке 'createarr'
    
created:
    xor eax, eax ; Обнуление регистра eax
    xor ebx, ebx ; Обнуление регистра ebx
    xor ecx, ecx ; Обнуление регистра ecx
    xor edx, edx ; Обнуление регистра edx
    ret ; Возврат из функции
