global _start

extern string_length
extern print_string
extern exit
section .data
test:
db "thisisatest", 0
section .text
_start:
   mov rdi, test
   call print_string

    mov rdi, rax 
    call exit
