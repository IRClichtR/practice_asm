section .data
    err_msg "Error opening file", 0
    err_msg_len equ $ - err_msg


section .text
    global ft_write

ft_write:
