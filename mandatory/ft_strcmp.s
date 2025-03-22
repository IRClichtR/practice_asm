section .text
    global ft_strcmp

ft_strcmp:
    .loop:
        movzx eax, byte [rdi]
        movzx edx, byte [rsi]
        cmp al, 0
        je .end
        cmp al, dl
        jne .end
        inc rdi
        inc rsi
        jmp .loop
    .end:
        sub eax, edx
        ret
