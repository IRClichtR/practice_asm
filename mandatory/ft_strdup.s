section .text
    global ft_strdup
    extern ft_strlen
    extern malloc

ft_strdup:
    mov rdi, rax
    call ft_strlen
    ret