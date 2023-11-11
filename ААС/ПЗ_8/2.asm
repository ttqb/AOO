%include 'io.inc'

section .data
section .bss
section .text
global CMAIN
CMAIN:
    mov ebp, esp    ;для отладки
    xor eax, eax    ;обнуляем
    xor ebx, ebx    ;обнуляем
    mov al, 0x15    ;ставим значение в регистр al
    mov ecx, 8      ;счетчик цикла
    sloop:  
        shr al, 1   ;сдвиг вправо, cf = последний бит
        rcl bl, 1   ;поворот влево, как свдвиг влева, но последний бит равен cf
        loop sloop  ;цикл
    mov ah, bl      ;сохраняем результат в ah (по заданию)*** (если что можете просто заместо ah, al написать и результат будет нормальным (если ошибка при проверке)
    xor eax, eax    ;обнуляем
    xor ebx, ebx    ;обнуляем
    ret             ;для корректного завершения программы