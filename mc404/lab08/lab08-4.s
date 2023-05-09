.data
    str: .space 21

.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    la a0, str
    li a1, 20
    call fgets

    mv a1, a0
    li a0, 4
    ecall

    li a0, 11
    li a1, 13
    ecall

    lw ra, 0(sp)
    addi sp, sp, 4
    ret
fgets:
    addi sp, sp, -12
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)

    mv s0, a0
    mv s1, a1
    mv s2, a1

    li a0, 0x130
    ecall

while:
    li a0, 0x131
    ecall
    addi a0, a0, -1
    blt a0, zero, fim
    blt zero, a0, ler
    j while
ler:
    beq s1, zero, fim
    sb a1, 0(s0)
    addi s0, s0, 1
    addi s1, s1, -1
    j while
fim:
    li t0, 0
    sb t0, 0(s0)
    sub t0, s1, s2
    add a0, s0, t0
    
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12

    ret


    