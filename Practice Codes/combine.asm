%macro print 2                            
mov rax, 01
mov rdi, 01
mov rsi, %1
mov rdx, %2
syscall                                     
%endmacro  

section .text
    t1 db "byte         :- " ;16
    t2 db "word         :- "
    t3 db "double word  :- "
    t4 db "quad word    :- "
    nl db "",10
    
section .bss
    a resb 1
    b resw 1
    c resd 1
    d resq 1
  
section .text
    global _start

    _start:
    print t1, 16
    call _byteprint
    print t2, 16
    call _wordprint
    print t3, 16
    call _doublewordprint
    print t4, 16;
    call _quadwordprint

    mov rax, 60     ;exit system call
    mov rdi, 0
    syscall
    
_byteprint:
mov esi, a
mov al, 9dh
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
print a, 02
print nl, 01  
ret


_wordprint:
mov esi, b
mov ax, 0f38ch
mov cl, 04h
o:
rol ax, 04h
mov bl, al
and bl, 0fh
cmp bx, 09h
jbe p
add bl, 07h
p:
add bl, 30h
mov [esi], bl

inc esi
dec cl
jnz o

print b, 4
print nl, 01
ret

_doublewordprint:
mov esi, c
mov eax, 1248f97bh
mov cl, 08h
y:
rol eax, 04h
mov bl, al
and bl, 0Fh
cmp bl, 09h
jbe z
add bl, 07h
z:
add bl, 30h
mov [esi], bl

inc esi
dec cl
jnz y

print c, 8
print nl, 01   
ret

_quadwordprint:
mov esi, d
mov rax, 44778fa112238444h
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

print d, 16
print nl, 01
ret
