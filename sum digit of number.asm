DATA SEGMENT
msg1 db 10,13,"Enter a number: $"  
msg2 db 10,13,"The sum of digits: $"
value db 0
total db 0
DATA ENDS

CODE SEGMENT              
ASSUME CS:CODE,DS:DATA

start:
       MOV AX, @data
       MOV DS, AX
       
       LEA DX, msg1                        
       MOV AH, 09h
       INT 21H    
       
  read:       
       MOV AH, 01
       INT 21H   
       
       CMP AL, 13
       JE calculate 
       
       MOV value, AL
       SUB value, 30h
              
       MOV AL, total
       MOV BL, 10
       MUL BL
       
       
       add ax, value
       MOV total, AX
    
       JMP read
                                
  calculate:
       mov ax, total ; result accumulator
       mov bx, 10 ; divisor
  loop:
       mov dx, 0 ; clear DX
       div bx ; divide AX by 10 and store the remainder in DL
       add ax, dx ; add the remainder to the result accumulator
       cmp ax, 0 ; check if we have reached the end of the digits
       jne loop ; if not, repeat the loop

       mov dl, al ; store the result in DL for printing
       add dl, 30h ; convert to ASCII
       mov ah, 02h ; print character function
       int 21h ; call interrupt

      
end start
