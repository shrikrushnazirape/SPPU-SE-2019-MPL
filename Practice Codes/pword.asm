%macro print 2                            
mov rax, 01
mov rdi, 01
mov rsi, %1
mov rdx, %2
syscall                                     
%endmacro

section .text
    nl db "",10

section .bss
    arr resq 4
  
section .text
    global _start

_start:
mov esi, arr
mov ax, 0f38ch
mov cl, 04h
l:
rol ax, 04h
mov bl, al
and bl, 0fh
cmp bx, 09h
jbe m
add bl, 07h
m:
add bl, 30h
mov [esi], bl

inc esi
dec cl
jnz l

print arr, 4
print nl, 01   
mov rax, 60    
mov rdi, 0
syscall