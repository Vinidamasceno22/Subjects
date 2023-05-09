.data
    str: .space 20
.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    la a0, str
    call gets

    call strrev

    mv a1, a0
    li a0, 4
    ecall

    li a0, 11
    li a1, 13
    ecall

    lw ra, 0(sp)
    addi sp, sp, 4
    ret

strrev:
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)

    mv s0, a0
    call strlen

    mv t0, s0
    add t1, s0, a0
    addi t1, t1, -1

while_strrev:
    bge t0, t1, fim_strrev
    
    lbu t2, 0(t0)
    lbu t3, 0(t1)
    sb t2, 0(t1)
    sb t3, 0(t0)

    addi t0, t0, 1
    addi t1, t1, -1
    j while_strrev

fim_strrev:
    mv a0, s0
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    ret

gets:
    addi sp, sp, -8
    sw s0, 0(sp)
    sw s1, 4(sp)

    mv s0, a0
    li s1, 0

    li a0, 0x130
    ecall

while_gets:
    li a0, 0x131
    ecall
    addi a0, a0, -1
    blt a0, zero, fim_gets
    blt zero, a0, ler
    j while_gets
ler:
    sb a1, 0(s0)
    addi s0, s0, 1
    addi s1, s1, 1
    j while_gets
fim_gets:
    li t0, 0
    sb t0, 0(s0)
    sub a0, s0, s1
    
    lw s0, 0(sp)
    lw s1, 4(sp)
    addi sp, sp, 8

    ret

strlen:
    li t0, 0
while_strlen:
    lbu t1, 0(a0)
    beq t1, zero, fim_strlen
    addi t0, t0, 1
    addi a0, a0, 1
    j while_strlen
fim_strlen:
    mv a0, t0
    ret