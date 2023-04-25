.data
vetor:
    .word 26
    .word 27
    .word 28
    .word 29
    .word 30
.text
main:
    addi sp, sp, -4
    sw ra, sp, 0

    li a0, 5

    lui a1, %hi(vetor)
    addi a1, a1, %lo(vetor)

    li a2, 10
    call MultiplicaVetor

    lw ra, sp, 0
    addi sp, sp, 4
    ret
MultiplicaVetor:
    # Movimenta o apontador da pilha 4 posicoes para baixo (16 bytes) e guarda 4 registradores na pilha
    addi sp, sp, -16
    sw   s0, sp, 12
    sw   s1, sp, 8
    sw   s2, sp, 4
    sw   ra, sp, 0

    mv   s0, a0
    mv   s1, a1
    mv   s2, a2

for:
    beq  s0, zero, fim
    lw   a0, s1, 0
    mv   a1, s2
    call Multiplica
    sw   a0, s1, 0
    addi s1, s1, 4
    addi s0, s0, -1
    j    for

fim:
    # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
    lw   ra, sp, 0
    lw   s2, sp, 4
    lw   s1, sp, 8
    lw   s0, sp, 12
    addi sp, sp, 16
    ret