.data
    folha: .word 0x00040003, 0x00040004, 0x00040005, 0x00040006
           .word 0x00050003, 0x00050004, 0x00050005, 0x00050006
           .word 0x00030004, 0x00030005, 0x00060004, 0x00060005

.text
# Modifica a matriz para parecer com a bandeira do Canadá
main:
    # Deixa a matriz branca
    li a0, 0x101
    li a1, 0x00ffffff
    ecall

# Faz as listras vermelhas laterais
    li s0, 10
for_i:
    addi s0, s0, -1

    li s1, 2
for_j:
    addi s1, s1, -1

    li a0, 0x100
    slli a1, s1, 16
    add a1, a1, s0
    li a2, 0x00ff0000
    ecall

    li a0, 0x100
    addi a1, s1, 8
    slli a1, a1, 16
    add a1, a1, s0
    li a2, 0x00ff0000
    ecall

    bne s1, zero, for_j

    bne s0, zero, for_i

    la s0, folha
    li s1, 12

# Faz a "folha" do meio
for:
    li a0, 0x100
    lw a1, 0(s0)
    li a2, 0x00ff0000
    ecall
    addi s0, s0, 4
    addi s1, s1, -1
    bne s1, zero, for

    # Encerra o programa
    li a0, 10
    ecall