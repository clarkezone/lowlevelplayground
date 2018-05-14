global exit
global string_length
global print_string
section .text

exit:
    mov rax, 60
    ;temporary preserve edi to enable calling funciton to set a return value
    ;xor edi, edi
    syscall

string_length:
    mov rax, -1
    .loop:
    inc rax
    cmp byte[rdi+rax], 0
    jne .loop
    ret

print_string:
    push rdi
    call string_length
    mov rdx, rax ;string length in rcx
    mov rax, 1
    mov rdi, 1 ;file descriptor
    pop rsi ;load string pointer into rsi
    syscall
    ret


print_char:
    xor rax, rax
    ret

print_newline:
    xor rax, rax
    ret


print_uint:
    xor rax, rax
    ret


print_int:
    xor rax, rax
    ret

string_equals:
    xor rax, rax
    ret


read_char:
    xor rax, rax
    ret 

read_word:
    ret

; rdi points to a string
; returns rax: number, rdx : length
parse_uint:
    xor rax, rax
    ret

; rdi points to a string
; returns rax: number, rdx : length
parse_int:
    xor rax, rax
    ret 


string_copy:
    ret
