.stack 100h
.data
a db 30h , '$'
b db 10,13,"enter ur number : $" 
c db 10,13,"the sum is  : $"
d db 10,13,"the mul is  : $"  
e db 10,13,"the div is  : $" 
f db 10,13,"the rest of div is  : $" 
g db 10,13,"the sub is  : $"
num db 5,5 dup ('$') 
num2 db 5,5 dup ('$')
sum dw ?
sous dw ?
mul_high dw ?
mul_low dw ?
div_q dw ?
div_r dw ?
number1 dw ?
number2 dw ? 
.code
display_char macro char
    mov dx, offset char
    mov ah, 9
    int 21h
endm
read macro string
    mov ah, 0Ah
    mov dx, offset string
    int 21h
endm
print_num macro integer
    mov ax, integer
    mov bx, 10h
    
    get_digit:
        xor dx, dx
        div bx
        push dx
        mov si,sp
        test ax, ax
        jnz get_digit

    print_digit:
        pop dx
        cmp dx , 9h
        jbe loow
        add dx , 55
        jmp keep
    loow:
        add dx , '0'
    keep:
        mov a[0] , dl
        display_char a
        test sp,si
        jnz print_digit
endm 
print_num2 macro integer
    mov ax, integer
    mov bx, 10h
    
    get_digit2:
        xor dx, dx
        div bx
        push dx
        mov si,sp
        test ax, ax
        jnz get_digit2

    print_digit2:
        pop dx
        cmp dx , 9h
        jbe loow2
        add dx , 55
        jmp keep2
    loow2:
        add dx , '0'
    keep2:
        mov a[0] , dl
        display_char a
        test sp,si
        jnz print_digit2
endm 
print_num3 macro integer
    mov ax, integer
    mov bx, 10h
    
    get_digit3:
        xor dx, dx
        div bx
        push dx
        mov si,sp
        test ax, ax
        jnz get_digit3

    print_digit3:
        pop dx
        cmp dx , 9h
        jbe loow3
        add dx , 55
        jmp keep3
    loow3:
        add dx , '0'
    keep3:
        mov a[0] , dl
        display_char a
        test sp,si
        jnz print_digit3
endm
print_num4 macro integer
    mov ax, integer
    mov bx, 10h
    
    get_digit4:
        xor dx, dx
        div bx
        push dx
        mov si,sp
        test ax, ax
        jnz get_digit4

    print_digit4:
        pop dx
        cmp dx , 9h
        jbe loow4
        add dx , 55
        jmp keep4
    loow4:
        add dx , '0'
    keep4:
        mov a[0] , dl
        display_char a
        test sp,si
        jnz print_digit4
endm  
print_num5 macro integer
    mov ax, integer
    mov bx, 10h
    
    get_digit5:
        xor dx, dx
        div bx
        push dx
        mov si,sp
        test ax, ax
        jnz get_digit5

    print_digit5:
        pop dx
        cmp dx , 9h
        jbe loow5
        add dx , 55
        jmp keep5
    loow5:
        add dx , '0'
    keep5:
        mov a[0] , dl
        display_char a
        test sp,si
        jnz print_digit5
endm
print_num6 macro integer
    mov ax, integer
    mov bx, 10h
    
    get_digit6:
        xor dx, dx
        div bx
        push dx
        mov si,sp
        test ax, ax
        jnz get_digit6

    print_digit6:
        pop dx
        cmp dx , 9h
        jbe loow6
        add dx , 55
        jmp keep6
    loow6:
        add dx , '0'
    keep6:
        mov a[0] , dl
        display_char a
        test sp,si
        jnz print_digit6
endm
convert macro variable 
    mov dx , 0
    lea bx , variable
    add bx , 2
    mov ax , 0
    mov dl , [bx]
    cmp dx , '9'
        jbe lower
        sub dx , 55
        jmp continue
    lower:
        sub dx , '0' 
    continue:
    add ah , dl
    shl ah ,4 
    
    
    mov dx , 0
    add bx , 1
    mov dl , [bx]
    cmp dx , '9'
        jbe low_2
        sub dx , 55
        jmp continue_2
    low_2:
        sub dx , '0' 
    continue_2:
    add ah , dl 
    
    mov dx , 0
    add bx , 1
    mov dl , [bx]
    cmp dx , '9'
        jbe low_3
        sub dx , 55
        jmp continue_3
    low_3:
        sub dx , '0' 
    continue_3:
    add al , dl   
    shl  al , 4
    
    
    mov dx , 0
    add bx , 1
    mov dl , [bx]
    cmp dx , '9'
        jbe low_4
        sub dx , 55
        jmp continue_4
    low_4:
        sub dl , '0' 
    continue_4:
    add al , dl   
  
endm



convert_dx macro variable 
    mov dx , 0
    lea bx , variable
    add bx , 2
    mov dx , 0
    mov al , [bx]
    cmp ax , '9'
        jbe dlower
        sub ax , 55
        jmp dcontinue
    dlower:
        sub ax , '0' 
    dcontinue:
    add dh , al
    shl dh ,4 
    
    
    mov ax , 0
    add bx , 1
    mov al , [bx]
    cmp ax , '9'
        jbe dlow_2
        sub ax , 55
        jmp dcontinue_2
    dlow_2:
        sub ax , '0' 
    dcontinue_2:
    add dh , al 
    
    mov ax , 0
    add bx , 1
    mov al , [bx]
    cmp ax , '9'
        jbe dlow_3
        sub ax , 55
        jmp dcontinue_3
    dlow_3:
        sub ax , '0' 
    dcontinue_3:
    add dl , al   
    shl  dl , 4
    
    
    mov ax , 0
    add bx , 1
    mov al , [bx]
    cmp ax , '9'
        jbe dlow_4
        sub ax , 55
        jmp dcontinue_4
    dlow_4:
        sub al , '0' 
    dcontinue_4:
    add dl , al   
  
endm


mov ax, @data
mov ds, ax   
display_char b
read num 
convert num 
mov number1 , ax   
display_char b
read num2
mov ax ,0
mov dx ,0  
convert_dx num2
mov number2 , dx

;sum

mov ax , number1
add ax , number2
mov sum, ax
display_char c
print_num sum 
 
 mov ax , 0
 mov dx , 0 
 
 
 ;sous 
 
 
 mov ax , number1
 sub ax , number2
 mov sous , ax
 display_char g
 print_num4 sous
 
 mov ax , 0
mov dx ,0 


;mul

mov ax , number1
mul number2

mov mul_high  , dx 
mov mul_low , ax

display_char d
print_num2 mul_high 
print_num3 mul_low


mov ax ,0
mov dx ,0
;div
mov ax, number1
div number2
mov div_q , ax
mov div_r , dx

display_char e
print_num5 div_q
display_char f
print_num6 div_r


