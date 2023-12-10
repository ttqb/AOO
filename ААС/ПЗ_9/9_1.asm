%include 'io.inc'

section .data
    str1 db "123", 0
    str2 db "456", 0

section .text
global CMAIN

CMAIN:
    mov ebp, esp ; для корректной отладки
    PRINT_STRING[str1] ; выводим str1
    PRINT_STRING[str2] ; выводим str2
    ret