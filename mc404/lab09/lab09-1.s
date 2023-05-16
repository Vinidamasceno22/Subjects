.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    call leNumero

    mv a1, a0
    li a0, 1
    ecall

    lw ra, 0(sp)
    addi sp, sp, 4

    li a0, 10
    ecall

    ret

leNumero:
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)

    li s0, 0

    li a0, 0x130
    ecall
loop:
    li a0, 0x131
    ecall
    addi a0, a0, -1
    blt a0, zero, fim
    beq a0, zero, loop
    li t0, 10
    mul s0, s0, t0
    addi a1, a1, -48
    add s0, s0, a1
    j loop

fim:
    mv a0, s0

    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8

    ret