.data
string:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
main:
    lui s0, %hi(string)
    addi s0, s0, %lo(string)

    mv a0, s0
    li a1, 20

    li t0, 6
    ecall

    li t0, 0
    li t3, 32
    addi t1, s0, 19
while:
    lb t2, t1, 0
    addi t1, t1, -1
    beq t2, t3, while

imprimir:
    sub a0, t1, s0
    addi a0, a0, 2
    li t0, 1
    ecall
    ret