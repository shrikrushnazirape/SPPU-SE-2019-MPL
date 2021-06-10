section  .data
msg db "hello",10
msglen equ $-msg

section .text
global  _start
_start:

up: mov al, 80h
cmp al, 50h
jle up
 
mov rax,01
mov rdi, 01
mov rsi,msg
mov rdx,msglen
syscall

mov rax,60
mov rdi, 00
syscall