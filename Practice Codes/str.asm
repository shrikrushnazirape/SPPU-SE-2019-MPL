section .data

msg db 'Enter the string',10
len equ $-msg

msg1 db 'Length of entered string is',10
len1 equ $-msg1

section .bss
strn resb 100		;buffer for accepting string it has 100 locations 
strleng resb 50

section .text
    global _start
    _start:

;for printing

mov rax,1			
mov rdi,1
mov rsi,msg
mov rdx,len
syscall

;for reading string

mov rax,00
mov rdi,00
mov rsi,strn
mov rdx,50
syscall

cmp al,09			; comparing if no. is greater than 9 then then add 
jbe l1
add al,07H

l1: 
add al,30H
sub al,1
mov[strleng],al

mov rax,1
mov rdi,1
mov rsi,msg1
mov rdx,len1
syscall

mov rax,01
mov rdi,01
mov rsi,strleng
mov rdx,2
syscall

mov rax,60
mov rdi,0
syscall
