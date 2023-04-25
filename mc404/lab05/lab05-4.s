.data
matriz:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
main:
    li t0, 2
    li t2, 0

    lui s0, %hi(matriz)
    addi s0, s0, %lo(matriz)

for_i:
    li t1, 3
    for_j:
        add t3, s0, t2
        li t4, 5
        sub t4, t4, t0
        sub t4, t4, t1
        sw t4, t3, 0
        addi t2, t2, 4
        addi t1, t1, -1
        blt zero, t1, for_j
    addi t0, t0, -1
    blt zero, t0, for_i
    
    ret