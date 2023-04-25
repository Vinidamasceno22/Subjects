main:
    li t1, 10
    # Le um num do teclado
    li t0, 4
    ecall
    mv s0, a0

    # Verifica se o num e maior que 10
    blt s0, t1, num
    addi s0, s0, 7

num:
    # tranforma num maior que 10 em hex
    addi s0, s0, 48

imprimir:
    # Imprime em hex
    mv a0, s0
    li t0, 2
    ecall

    # Imprime o caractere h
    li a0, 104
    li t0, 2
    ecall

    ret