; ft_strlen. Refere to man 2 strlen 

section .text
    global ft_strlen

ft_strlen:
    xor rax, rax
    .loop:
        cmp byte [rdi], 0
        je .end
        inc rax
        inc rdi
        jmp .loop
    .end:
        ret