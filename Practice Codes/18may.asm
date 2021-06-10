section .data
;arr dq 9876543215432166H, 7654321987634678H, 8754367865456789H, 2345678901264356H
arr dq 0000000000000004H, 0000000000000001H, 0000000000003456H, 0000000000000009H

m1: db "No of Positive numbers",0AH
l1: equ $-m1

m2: db "No of Negative numbers",0AH
l2: equ $-m2

count: db 04H
pos: db 00H
neg: db 00H

section .text

global _start
_start:
        mov rsi,arr
        up:
        mov rax,qword[rsi]
        BT rax,63
        jc next1
        add byte[pos],01H
        add rsi,8
        dec byte[count]
        jnz up
        jmp next2
next1:
        add byte[neg],01H
        add rsi,8
        dec byte[count]
        jnz up
next2:
        cmp byte[pos],09H
        jbe next3
        add byte[pos],07H
next3:
        add byte[pos],30H
        cmp byte[neg],09H
        jbe next4
        add byte[neg],07H
next4:
        add byte[neg],30H

mov rax,1
mov rdi,1
mov rsi,m1
mov rdx,l1
syscall

mov rax,1
mov rdi,1
mov rsi,pos
mov rdx,1
syscall

mov rax,1
mov rdi,1
mov rsi,m2
mov rdx,l2
syscall

mov rax,1
mov rdi,1
mov rsi,neg
mov rdx,1
syscall

mov rax,60
mov rdi,00
syscall