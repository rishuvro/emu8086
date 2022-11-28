org 100h

; add your code here
.data
a db 10
b db 5

 .code
 
  mov al, 10
  mov bl, 5
 div bl
 
 cmp ah, 0
  je Level1
  mov al,a
  sub al,bl
  jmp exit
  Level1:
  mov al, a
  add al,bl
 
  exit:
 
ret
