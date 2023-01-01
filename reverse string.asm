data segment 
str1 DB 'RAKIB'
len EQU $-str1
str2 db 20 dup (0)
data ends

code segment 
assume cs:code, ds:code, es:data
start:mov ax, data
mov ds, ax
mov es, ax

mov si, offset str1
mov di, offset str2+(len=1)
mov cx, len 

up:cld
lodsb
std
stosb
loop up
mov ah,4ch
int 21h
code ends

end start