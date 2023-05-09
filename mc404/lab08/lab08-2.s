.data

    str1: .string "String 1"
    str2: .string "String 2"

.text
main:
    addi sp, sp, -12
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)

    la a0, str1
    la a1, str2
    call strcpy

    mv s0, a0
    mv s1, a1

    li a0, 4
    mv a1, s0
    ecall

    li a0, 11
    li a1, 13
    ecall # Imprime caracter de nova linha (\n)

    li a0, 4
    mv a1, s1
    ecall

    li a0, 11
    li a1, 13
    ecall # Imprime caracter de nova linha (\n)

    lw s1, 8(sp)
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 12
    ret

strcpy:
    mv t0, a0
    mv t1, a1

while:
    lbu t2, 0(t1)
    beq t2, zero, fim
    sb t2, 0(t0)
    addi t1, t1, 1
    addi t0, t0, 1
    j while 
fim:
    sb zero, 1(t1)
    ret

