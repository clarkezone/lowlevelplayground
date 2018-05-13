section .data
newline_char: db 10
codes: db '0123456789abcdef'

demo2: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88

section .text
global _start

print_newline:
	mov rax, 1 ; 'write' syscall
	mov rdi, 1 ; 'stdout' file descriptor
	mov rsi, newline_char ; were data from
	mov rdx, 1 ; amount of bytes
	syscall
	ret

print_hex:
	mov rax, rdi
	mov rdi, 1
	mov rdx, 1
	mov rcx, 64 ; how far are we shifting rax?
	iterate:
		push rax ; save rax
		sub rcx, 4
		sar rax, cl  ;shit to 60, 65, 52, ... 4, 0
			     ; the cl register is the smallest part of rcx
		and rax, 0xf ; clear all bbits but the lowest four
		lea rsi, [codes + rax] ; take a char
		mov rax, 1
		push rcx ; syscall will break rcx
		syscall
		pop rcx
		pop rax
		test rcx, rcx ; rcx = 0
		jnz iterate
	ret

_start:
	mov rdi, 0x1122334455667788
	call print_hex
	call print_newline

	mov rdi, [demo2]
	call print_hex
	call print_newline

	mov rax, 60
	xor rdi, rdi
	syscall
