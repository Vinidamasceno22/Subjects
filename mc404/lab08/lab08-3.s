.data
    str: .space 21

.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    la a0, str
    call gets

    mv a1, a0
    li a0, 4
    ecall

    li a0, 11
    li a1, 13
    ecall

    lw ra, 0(sp)
    addi sp, sp, 4
    ret
gets:
    addi sp, sp, -8
    sw s0, 0(sp)
    sw s1, 4(sp)

    mv s0, a0
    li s1, 0

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
    sb a1, 0(s0)
    addi s0, s0, 1
    addi s1, s1, 1
    j while
fim:
    li t0, 0
    sb t0, 0(s0)
    sub a0, s0, t0
    
    sw s0, 0(sp)
    sw s1, 4(sp)
    addi sp, sp, 8

    ret


    