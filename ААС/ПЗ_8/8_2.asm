%include 'io.inc'

section .data

section .text
global CMAIN
CMAIN:
    mov ebp, esp ; для отладки
    xor eax, eax ; обнуляем
    xor ebx, ebx ; обнуляем
    mov al, 0x15 ; ставим значение в регистр al
    mov ecx, 8 ; счетчик цикла
_:  
    shr al, 1 ; сдвиг вправо, cf = последний бит
    rcl bl, 1 ; поворот влево, как свдвиг влева, но последний бит равен cf
    loop _ ; цикл
    mov ah, bl ; сохраняем результат в ah
    xor eax, eax
    xor ebx, ebx
    ret
