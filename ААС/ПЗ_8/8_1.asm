%include 'io.inc'

section .data
    even db "chet", 0
    odd db "nechet", 0

section .text
global CMAIN
CMAIN:
    mov ax, 6 ; задаем число
    shr ax, 1 ; сдвигаем на 1, если чет то cf = 0, иначе cf = 1
    jc nechet ; нечет если cf = 1
    jmp chet ; иначе чет
chet:
    PRINT_STRING[even] ; выводим результат
    jmp end ; конец программы
nechet:
    PRINT_STRING[odd] ; выводим результат
    jmp end ; конец программы
end:
    xor eax, eax
    xor ebx, ebx
    ret