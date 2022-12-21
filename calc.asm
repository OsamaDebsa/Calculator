.model small
.data
C DB 10,10, '           1 ===> For ADD',10 ,'           2 ===> For SUB',10 ,'           3 ===> for MUL' ,10,'           4 ===> for DIV ',10,'$'
X DB 10,'Enter The First Num  : $' 
Y DB 10,10,'Enter The Second Num : $'
Z db 10,10, 'The Result is : $'
Ten dw 10
One dw 1
.code
        MAIN proc FAR
        .startup
        
          
                ; Print Message on Screan .
               mov dx , offset X
               mov AH,9
               int 21H
               
               ; Take Number From User
               mov AH , 1
               int 21H
               
               mov Bh , AL          ;First ---> BH
               
;................................. 
      
              
               ; Print Message on Screan .
               mov dx , offset Y
               mov AH,9
               int 21H
               
               ; Take Number From User
               mov AH , 1
               int 21H
               
               mov Bl , AL      ; Second ----> BL
               
               sub bh,30H
               sub bl,30H
                
;.................................        
           
                 ; Print Message on Screan .
                 ; choose the operation 
               mov dx , offset C
               mov AH,9
               int 21H
               
               mov AL,0
               
               mov AH , 1
               int 21H
               mov cl,al
                       
;................................. 
      
      
               mov dx, offset Z   
               mov AH,9
               int 21H       
             
                
               cmp Cl ,31h  ;30+1
               je ad
               cmp Cl ,32h
               je su
               cmp Cl ,33h
               je ml
               cmp Cl ,34h
               je dv
               
      ad:
               mov ax,0
               add BH,BL
               mov al , bh
         
              
               mul One          ; first put AX
              
         
                                 
                                 ; AL : **
                                 ; Al : *  , dl : *
                                 
                                 
               div Ten           ; AX , remender : Dx
                                 ; AL , remender : dl
                
               mov cl,dl 
                
               add cl,30h
               add al,30h
                
               mov dl,al
               mov AH , 2
               int 21H
                
               mov dl,cl
               mov AH , 2
               int 21H
              
               jmp stop

      su:
               sub BH,BL
               add BH,30H
               
               mov DL , BH
               mov AH , 2
               int 21H
               jmp stop
           
      ml:
               mov AX,0
               mov dx,0
               
               mov AL,BH         
               
               mul BL
             
                                 
                                 
               div Ten 
                
               mov cl,dl 
                
               add cl,30h
               add al,30h
                
               mov dl,al
               mov AH , 2
               int 21H
                
               mov dl,cl
               mov AH , 2
               int 21H
              
               jmp stop
               
      dv:
               mov AX,0
               
               mov AL,BH     ; Al=Ax/operand
               div Bl
               
               add Al,30H    
               mov Dl , Al
               mov AH , 2
               int 21H
               
               jmp stop
    
      stop:
      
       
        .EXIT
        MAIN ENDP
END MAIN