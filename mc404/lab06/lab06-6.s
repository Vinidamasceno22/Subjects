.text
main:
    addi sp, sp, -4
    sw ra, sp, 0

    li t0, 4
    ecall

    call fatorial

    li t0, 1
    ecall

    lw ra, sp, 0
    addi sp, sp, 4
# Funcao recursiva do fatorial
fatorial:
    # Guarda os registradores na pilha
    addi sp, sp, -8
    sw ra, sp, 0
    sw s0, sp, 4

    beq a0, zero, um

    mv s0, a0
    addi a0, a0, -1
    call fatorial
    mv a1, a0
    mv a0, s0

    Multiplica: 
        addi sp, sp, -4
        sw ra, sp, 0

        li t0, 32
        li t1, 0
        li t2, 0

    for2:
        andi t1, a1, 1
        beq t1, zero, continue
        add t2, t2, a0
    continue:
        slli a0, a0, 1
        srli a1, a1, 1
        addi t0, t0, -1
        beq a1, zero, fim
        bne zero, t0, for2
        j fim
    um:
        li t2, 1
    fim:
        mv a0, t2
        lw ra, sp, 0
        lw s0, sp, 4
        addi sp, sp, 8
        ret
