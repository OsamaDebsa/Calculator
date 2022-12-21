.model small
.data
prompt DB 10,10, '       1 => For ADD',10 ,'       2 => For SUB',10 ,'       3 => for MUL' ,10,'       4 => for DIV ',10,'$'
input_prompt_1 DB 10,'Enter the first number: $' 
input_prompt_2 DB 10,10,'Enter the second number: $'
result_prompt DB 10,10, 'The result is: $'
ten DW 10
one DW 1
.code
        MAIN proc FAR
        .startup
        
          
                ; Print message on screen
               mov dx , offset input_prompt_1
               mov AH,9
               int 21H
               
               ; Take number from user
               mov AH , 1
               int 21H
               
               mov Bh , AL          ;First number -> BH
               
;................................. 
      
              
               ; Print message on screen
               mov dx , offset input_prompt_2
               mov AH,9
               int 21H
               
               ; Take number from user
               mov AH , 1
               int 21H
               
               mov Bl , AL      ; Second number -> BL
               
               sub bh,30H
               sub bl,30H
                
;.................................        
           
                 ; Print message on screen
                 ; choose the operation 
               mov dx , offset prompt
               mov AH,9
               int 21H
               
               mov AL,0
               
               mov AH , 1
               int 21H
               mov cl,al
                       
;................................. 
      
      
               mov dx, offset result_prompt   
               mov AH,9
               int 21H       
             
                
               cmp Cl ,31h  ;30+1
               je add
               cmp Cl ,32h
               je sub
               cmp Cl ,33h
               je mul
               cmp Cl ,34h
               je div
               
      add:
               mov ax,0
               add BH,BL
               mov al , bh
         
              
               mul One          ; first put AX in register
              
         
                                 
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

      sub:
               sub BH,BL
               add BH,30H
               
               mov DL , BH
               mov AH , 2
               int 21H
               jmp stop
           
      mul:
               mov AX,0
               mov dx,0
               
               mov AL,BH         
               
               mul BL
             
                                 
                                 
               div Ten 
                
               mov cl,dl 
                
               add cl,30h
               add al,30h
                
               mov dl,