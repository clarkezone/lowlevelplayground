global _start

extern string_length
extern exit
section .data
test:
db "thisisatest", 0
section .text
_start:
   mov edi, test
   call string_length

    mov rdi, rax 
    call exit
