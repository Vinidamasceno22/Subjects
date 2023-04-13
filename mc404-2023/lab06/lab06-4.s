.text
main:
    addi sp, sp, -24
    sw ra, sp, 20
    mv s0, sp
    li s1, 20
    mv a0, s0
    mv a1, s1
    li t0, 6
    ecall

    mv a0, s0
    call strlen

    lw ra, sp, 20
    addi sp, sp, 24 
    ret

strlen:
    li t0, 0
    li t3, 32
    addi t1, a0, 19
while:
    lb t2, t1, 0
    addi t1, t1, -1
    beq t2, t3, while

imprimir:
    sub a0, t1, a0
    addi a0, a0, 2
    li t0, 1
    ecall
    ret