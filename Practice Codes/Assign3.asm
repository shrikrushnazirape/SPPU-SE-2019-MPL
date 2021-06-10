%macro print 2                            
mov rax, 01
mov rdi, 01
mov rsi, %1
mov rdx, %2
syscall                                     
%endmacro  

section .data
    msg1 db "The largest No is - "
    arr db 2Fh, 39h, 02h, 57h
    l1 db 20
    nl db "",10
    large db 0

section .bss
    asciiarray resb 2
    count resb 1

section .text
    global _start

_start:

    mov rsi, arr
    mov byte[count], 04
a:  mov al, [rsi]
    cmp al, byte[large]
    js b
    mov byte[large], al
b:  inc rsi
    dec byte[count]
    jnz a
    ret

    call print_large

    print msg1, l1
    print asciiarray, 2
    print nl, 1;
    
    mov rax, 60
    mov rbx, 0
    syscall


print_large:
    mov al, byte[large]
    mov rsi, asciiarray
    mov cl, 02

c:  rol al, 04h
    mov bl, al
    and bl, 0fh
    cmp bl, 09h
    jbe d
    add bl, 07h
d:  add bl, 30h
    mov [esi], bl
    inc esi
    dec cl
    jnz c
    ret