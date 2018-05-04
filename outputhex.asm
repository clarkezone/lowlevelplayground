section .data
codes:
	db '0123456789ABCDEF'

section .text
global _start
_start:

mov rax, 0x1122334455667788
mov rdi, 1 ;description where to write
mov rdx, 1 ;number of bytes to write
mov rcx, 64 ;length in bits of rax

.loop:
push rax
sub rcx, 4

sar rax, cl ;cl is smallest part of rcx
and rax, 0xf

lea rsi, [codes + rax]
mov rax, 1 ; this is the write syscall

push rcx ;syscall will modify rcx
syscall
pop rcx

pop rax
test rcx, rcx
jnz .loop

mov rax, 60
xor rdi, rdi
syscall
