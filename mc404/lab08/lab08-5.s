.data
    str1: .string "Teste 1"
    str2: .string "Teste 2"
.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    la a0, str1
    call strlen

    la a0, str2
    call strlen

    la a0, str1
    la a1, str2
    call strcmp

    la a0, str1
    la a1, str2
    call strcat

    lw ra, 0(sp)
    addi sp, sp, 4
    ret

strlen:
    li t0, 0
while:
    lbu t1, 0(a0)
    beq t1, zero, fim_strlen
    addi t0, t0, 1
    addi a0, a0, 1
    j while
fim_strlen:
    mv a0, t0
    ret

strcmp:
    lbu t0, 0(a0)
    lbu t1, 0(a1)
    blt t0, t1, menor
    blt t1, t0, maior
    beq t0, zero, igual
    addi a0, a0, 1
    addi a1, a1, 1
    j strcmp
igual:
    li a0, 0
    j fim_strcmp
maior:
    li a0, 1
    j fim_strcmp
menor:
    li a0, -1
fim_strcmp:
    ret

strcat:
    mv t0, a0
while_str1:
    lbu t1, 0(t0)
    beq t1, zero, while_str2
    addi t0, t0, 1
    j while_str1

while_str2:
    lbu t1, 0(a1)
    sb t1, 0(t0)
    addi t0, t0, 1
    addi a1, a1, 1
    bne t1, zero, while_str2
fim_strcat:
    ret