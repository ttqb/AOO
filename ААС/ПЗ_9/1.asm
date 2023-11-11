%include 'io.inc'
section .data
str1 db "Hello ",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
str2 db "world",0
section .bss
section .text
global CMAIN
CMAIN:
    mov ebp, esp        ;for correct debugging
    xor eax, eax        ;обнуление регистра
    xor ebx, ebx        ;обнуление регистра
    xor ecx, ecx        ;обнуление регистра
    xor edx, edx        ;обнуление регистра
findend:
    mov al, [str1+edx]  ;передвигаем в регистр al символы из строки str1
    cmp al, 0           ;сравниваем al с 0 (конец строки)
    je concat           ;если al равен 0 то идем к конкатенации
    inc edx             ;увеличиваем регистр edx на 1
    jmp findend         ;прыгаем к началу
concat:
    mov bl, [str2+ecx]  ;двигаем в регистр bl символы из строки str2
    cmp bl,0            ;сравниваем bl и 0
    je print            ;если они равны переходим к выводу
    mov [str1+edx],bl   ;передвигаем наш символ в переменную str1, после всех ее символов
    inc ecx             ;увеличиваем ecx
    inc edx             ;увеличиваес edx
    jmp concat          ;прыгаем к началу
print:
    PRINT_STRING[str1]  ;выводим искомую строку
    xor eax,eax         ;обнуляем регистры
    xor ebx,ebx         ;обнуляем регистры
    xor ecx,ecx         ;обнуляем регистры
    ret                 ;для корректной работы программы
    