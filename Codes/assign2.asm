%macro mcr 3
mov rax, %1 ;first argument
mov rdi, 01
mov rsi, %2 ;second argument
mov rdx, %3 ;third argument
syscall
%endmacro mcr

section .data
	msg1 db "enter string - "
	msg2 db "The string is - "
	msg3 db "The length is - "
	newline db "",10

section .bss
	wrd resb 20
	len resb 2
	arr resb 2

global _start
section .text
_start:

	mcr 1, msg1, 15
	mcr 0, wrd, 15
	call printByte
	mcr 1, msg2, 16
	mcr 1, wrd, 15
	mcr 1, msg3, 16
	mcr 1, arr, 2
	mcr 1, newline, 1
	mov rax, 60
	mov rdi, 00
	syscall

printByte:
	mov rsi, arr
	mov cl, 02
	mov bl, 00
	l:
	rol al, 04h
	mov bl, al
	and bl, 0Fh
	cmp bl, 09h
	jbe m
	add bl, 07h
	m:
	add bl, 30h
	mov [rsi], bl

	inc rsi
	dec cl
	jnz l
	ret
