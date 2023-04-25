main:
    li t1, 10
    li t2, 8
    li t3, 8

while:
    # Le um num do teclado
    li t0, 4
    ecall
    beq a0, zero, fim
    mv s0, a0

for1:
    slli s1, s1, 4
    andi t4, s0, 15
    add s1, s1, t4
    srli s0, s0, 4
    addi t2, t2, -1
    blt zero, t2, for1

for2:
    andi s2, s1, 15

hex:
    # Verifica se o num e maior que 10
    blt s2, t1, num
    addi s2, s2, 7

num:
    # tranforma num maior que 10 em hex
    addi s2, s2, 48

imprimir:
    # Imprime em hex
    mv a0, s2
    li t0, 2
    ecall
    srli s1, s1, 4
    addi t3, t3, -1
    blt zero, t3, for2

    # Imprime o caractere h
    li a0, 104
    li t0, 2
    ecall
    j while

fim:
    ret