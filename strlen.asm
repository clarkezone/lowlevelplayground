global _start
section .data
test_string: db "abcdef", 0
section .text

strlen: ; by convention, first arg comes from rdi
	xor rax, rax ;rax will hold the length, must zero it

	.loop: 
	  cmp byte[rdi+rax], 0
	  je .end
	  inc rax
	  jmp .loop

	.end:
	  ret

_start:
	mov rdi, test_string
	call strlen
	mov rdi, rax ;set exit code to length use echo$? to print that in bash
	mov rax, 60
	syscall
