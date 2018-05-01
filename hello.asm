; to build this: nasm -felf64 hello.asm hello.o ld -o hello hello.o chmod u+x hello ./hello


global _start

section .data
message: db 'hello, world', 10

section .text
_start:
mov rax, 1 ;syscall
mov rdi, 1 ;arg 1 where to write (descriptor)
mov rsi, message ;arg 2 string start
mov rdx, 14 ;how many bytes
syscall
