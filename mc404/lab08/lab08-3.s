.data
    str: .space 20

.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    la a0, str
    call gets

    lw ra, 0(sp)
    addi sp, sp, 4
    ret
gets:
    addi sp, sp, -4
    sw s0, 0(sp)

    mv s0, a0

    li a0, 0x130
    ecall

while:
    li a0, 0x131
    ecall
    addi a1, a1, -1
    blt a1, zero, fim
    blt zero, a1, ler
    j while
ler:
    