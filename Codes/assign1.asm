%macro rscall 2                            
mov rax, 01                                  
mov rdi, 01                               
mov rsi, %1                                 
mov rdx, %2                                
syscall                                     
%endmacro    

section .data
    t1 db "Enter the 5 numbers :",10
    t2 db "Entered Numbers are :",10

section .bss
    arr resb 85
    cnt resb 1

section .text
    global _start

_start:
    rscall  t1, 22
    call _getarray

    
    rscall t2, 22
    call _printarray


    mov rax, 60
    mov rdi, 0
    syscall


_getarray:
    mov rbx, 0
    mov byte[cnt], 5
    mov rsi, arr

    l:
    mov rax, 0
    mov rdi, 1
    add rsi, rbx
    mov rdx, 17
    syscall
    add rbx, 17
    dec byte[cnt]
    jnz l
    ret


_printarray:
    mov rsi, arr
    mov rbx, 0
    mov byte[cnt], 5
    m:
    mov rax, 1
    mov rdi, 1
    add rsi, rbx
    mov rdx, 17
    syscall

    add rbx, 17
    dec byte[cnt]
    jnz m
    ret