%macro print 2                            
mov rax, 01
mov rdi, 01
mov rsi, %1
mov rdx, %2
syscall                                     
%endmacro 

section .data
    arr  dq 111111111111, 222222222222222, 3333333333333, 444444444444, 555555555555, 666666666666, 77777777777

    msg1 db "positive no's : "
    msg2 db "negative no's : "
    nl db "",10


section .bss
    tcount resb 1
    pcount resb 1
    ncount resb 1
    temp resb 1


section .text
    global _start

_start:
    mov byte[tcount], 7
    mov byte[pcount], 0
    mov byte[ncount], 0


    mov rsi, arr
    mov rcx, tcount

u1: 
    bt qword[rsi], 63
    jnc pnext
    inc byte[ncount]
    jmp skip

pnext:
    inc byte[pcount]

skip:
    inc rsi
    dec byte[tcount]
    jnz u1

    print msg1, 16
    mov al, byte[pcount]
    call _byteprint
    print nl, 1

    print msg2, 16
    mov al, byte[ncount]
    call _byteprint
    print nl, 1
    
    mov rax, 60
    mov rdi, 00
    syscall



_byteprint:
mov esi, temp
; mov al, 9dh
mov cl, 02
l:
rol al, 04
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
print temp, 02  
ret