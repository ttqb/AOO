%include 'io.inc'

section .data
    odd db "it's odd!",0
    even db "it's even!",0
section .bss
section .text
global CMAIN
CMAIN:
    mov ax, 6  ;задаем число
    shr ax, 1  ;сдвигаем на 1, если чет то cf = 0, иначе cf = 1
    jc isodd   ;нечет если cf = 1
    jmp iseven ;иначе чет

isodd:
    PRINT_STRING[odd] ;выводим результат
    jmp end           ;конец программы
iseven:
    PRINT_STRING[even];выводим результат
    jmp end           ;конец программы
end:
    xor eax,eax
    xor ebx,ebx
    ret