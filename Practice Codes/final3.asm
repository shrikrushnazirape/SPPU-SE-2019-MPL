%macro output 2
mov   rax, 01
mov   rdi, 01
mov   rsi, %1
mov   rdx, %2
syscall
%endmacro

%macro input 1
mov   rax, 0
mov   rdi, 0
mov   rsi, %1
mov   rdx, 100
syscall
%endmacro

%macro exit 0
mov rax,60
mov rdi,0
syscall
%endmacro

section .data
	msg db 'Enter string '
	len equ $-msg
	msg2 db 'The size is '
	len2 equ $-msg2
	endl db 0ah
	len3 equ $-endl
	count db 5

section .bss
	string resb 100
	strlen resb 2


section .text
global _start
	_start:

	output msg,len
	input string

	cmp al,09h
	jbe l1
	add al,07h
	l1:
	add al,30h
	dec al
	mov [strlen],al
	output msg2,len2
	output strlen,2
	output endl,len3

	syscall
	
	exit
