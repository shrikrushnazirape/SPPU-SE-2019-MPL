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
    arr resd 1
  
section .text
    global _start

_start:
mov esi, arr
mov eax, 1248f97bh
mov cl, 08h
l:
rol eax, 04h
mov bl, al
and bl, 0Fh
cmp bl, 09h
jbe m
add bl, 07h
m:
add bl, 30h
mov [esi], bl

inc esi
dec cl
jnz l

print arr, 8
print nl, 01   
mov rax, 60    
mov rdi, 0
syscall