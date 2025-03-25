section .text
    global ft_strcpy

ft_strcpy:
    .loop:
        mov cl, [rsi]
        mov [rdi], cl 
        cmp cl, 0
        je .end
        inc rdi
        inc rsi
        jmp .loop
    .end:
        ret