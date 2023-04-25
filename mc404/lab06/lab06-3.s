.text
SomaVetor:
    li t0, 0;

for:
    lw t1, a1, 0
    add t0, t0, t1
    addi a1, a1, 4
    addi a0, a0, -1
    bne a0, zero, for

    mv a0, t1
    ret
