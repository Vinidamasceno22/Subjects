.rodata
pontos:
    .word -5
    .word -5
    .word -4
    .word -5
    .word -5
    .word -4
    .word -4
    .word -4
    .word -5
    .word -5
.text
main:
    lui s0, %hi(pontos)
    addi s0, s0, %lo(pontos)

    li t0, 4

    lw s1, s0, 0
    lw s2, s0, 4
    addi t1, s0, 8
for:
    lw t3, t1, 0
    lw t4, t1, 4
    addi t1, t1, 8
    blt s1, t3, menor
    blt t3, s1, maior
    blt s2, t4, menor
    j maior
menor:
    mv s1, t3
    mv s2, t4

maior:
    addi t0, t0, -1
    blt zero, t0, for

    bge s1, zero, print_x
    sub s1, zero, s1
    li a0, 45
    li t0, 2
    ecall
print_x:
    mv a0, s1
    li t0, 1
    ecall

    bge s2, zero, print_y
    sub s2, zero, s2
    li a0, 45
    li t0, 2
    ecall

print_y:
    mv a0, s2
    li t0, 1
    ecall
fim:
    ret
