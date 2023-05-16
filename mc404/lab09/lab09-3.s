.data
    vetor: .space 20
.text
main:
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)

    la s0, vetor
    mv a0, s0
    li a1, 5
    call leVetor

    mv a0, s0
    li a1, 5
    call media

    mv a1, a0
    li a0, 1
    ecall

    li a0, 11
    li a1, 13
    ecall

    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8
    
    li a0, 10
    ecall

leVetor:
    addi sp, sp, -12
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)

    mv s0, a0
    mv s1, a1

for_leVetor:
    call leNumero
    sw a0, 0(s0)
    addi s0, s0, 4
    addi s1, s1, -1
    bne s1, zero, for_leVetor

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12

    ret

leNumero:
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)

    li s0, 0

    li a0, 0x130
    ecall
while_leVetor:
    li a0, 0x131
    ecall
    addi a0, a0, -1
    blt a0, zero, fim_leVetor
    beq a0, zero, while_leVetor
    li t0, 10
    mul s0, s0, t0
    addi a1, a1, -48
    add s0, s0, a1
    j while_leVetor

fim_leVetor:
    mv a0, s0

    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8

    ret
media:
    li t0, 0
    mv t1, a1
for_media:
    lw t2, 0(a0)
    add t0, t0, t2
    addi a0, a0, 4
    addi a1, a1, -1
    bne a1, zero, for_media

    div t0, t0, t1
    mv a0, t0

    ret