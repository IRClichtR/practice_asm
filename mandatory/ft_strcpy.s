section .text
    global ft_strcpy

ft_strcpy:

    .loop:
        mov cl, [rsi]
        mov [rdi], cl
        inc rdi
        inc rsi
        test cl, cl
        jnz .loop
    .end:
        ret