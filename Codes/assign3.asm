%macro print 2                            
mov rax, 01
mov rdi, 01
mov rsi, %1
mov rdx, %2
syscall                                     
%endmacro  

section .data
    msg1 db "The largest no is :-" 
    nl db "",10
    len1 equ $-msg1
    arr  dq   1aaaaaa1h, 0FFFFFFFFFFFFFFh, 11h, 3abcdee3h, 444h

section .bss
    temp resb 1
    count resb 1

section .text
global _start


_start:
    mov byte[count], 5
    mov rbx, 0
    mov rsi, arr

loop1:
    cmp rbx, [rsi]
    jnc next
    mov rbx, [rsi]

next:
    add esi, 08
    dec byte[count]
    jnz loop1

    call _quadwordprint
 
    mov rax,60
    mov rdi,00
    syscall



; greatest value is already presetn in rax
_quadwordprint:
    mov esi, temp  
    mov rax, rbx 
    mov cl, 16h
g:
    rol rax, 04h
    mov bl, al
    and bl, 0Fh
    cmp bl, 09h
    jbe h
    add bl, 07h
h:
    add bl, 30h
    mov [esi], bl

    inc esi
    dec cl
    jnz g

    print msg1, 20
    print temp, 16
    print nl, 01
   
    ret