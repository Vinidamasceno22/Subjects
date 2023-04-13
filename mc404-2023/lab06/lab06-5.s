.data
operacao:
    .word 43
    .word 44
    .word 45
    .word 52
.text
soma:
    add a0, a0, a1
    ret
subt:
    sub a0, a0, a1
    ret
main:
    addi sp, sp, -16
    sw ra, sp, 0
    sw s0, sp, 4
    sw s1, sp, 8
    sw s2, sp, 12

    lui s0, %hi(operacao)
    addi s0, s0, %lo(operacao)

    li t0, 4
    ecall
    mv s1, a0

    li t0, 5
    ecall
    mv s2, a0

    li t0, 4
    ecall

    mv a1, a0
    mv a0, s1

    lw t0, s0, 0
    jalr ra, s0, 12

    beq s2, t0, chama_soma
    jalr ra, s0, 12
    j fim
chama_soma:
    jalr ra, s0, 4

fim:
    bge zero, a0, imprimir
    mv s1, a0
    li a0, 45
    li t0, 2
    ecall
    mv a0, s1 
    sub a0, zero, a0
imprimir:
    li t0, 1
    ecall

    lw ra, sp, 0
    lw s0, sp, 4
    lw s1, sp, 8
    lw s2, sp, 12
    addi sp, sp, 16
    ret
