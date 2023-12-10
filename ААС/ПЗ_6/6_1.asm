%include 'io.inc'

section .data
    str: db `Hello, World!\n`, 0
    
section .text

global CMAIN
CMAIN:
    PRINT_STRING [str]
    mov EAX, 0
    ret