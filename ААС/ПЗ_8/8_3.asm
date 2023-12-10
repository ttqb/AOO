%include 'io.inc'

section .data
y db "delitsa na 10", 0
n db "ne delitsa na 10", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp ; для отладки
    xor edx, edx ; обнуление регистра
    xor eax, eax ; обнуление регистра
    mov al, 20 ; задаем проверяемое число
    mov bl, 10 ; задаем 10
    div bl ; делим число на 10, результат в al, остаток в ah
    cmp ah, 0 ; проверяем остаток с 0
    je yes ; если равны то прыгаем на YES
    jmp no ; иначе прыгаем на NO
yes:
    PRINT_STRING[y] ; вывод результата
    jmp end ; прыжок в конец
no:
    PRINT_STRING[n] ; вывод результата
    jmp end ; прыжок в конец
end:
    xor eax, eax
    xor ebx, ebx
    ret