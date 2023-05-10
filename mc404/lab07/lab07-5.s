.data
 cores: .word 0x00000000, 0x00f7b268, 0x0000ffff, 0x00ffc0cb, 0x00b6fcd5

.text
# Modifica a matriz com quadrados 6x6 com cores diferentes 
main:
    # Deixa a matriz branca
    li a0, 0x101
    li a1, 0x00ffffff
    ecall

    la s0, cores
    li s1, 5
# Realiza um loop para cada cor de cores
for_cor:
    li s2, 6
# Realiza um loop para as linhas 3 a 7 da matriz
for_i:
    li s3, 6
# Realiza um loop para as colunas 3 a 7 da matriz
for_j:

    # Muda a cor do ponto (s2+1, s3+1)
    li a0, 0x100
    addi a1, s3, 1
    slli a1, a1, 16
    add a1, a1, s2
    addi a1, a1, 1  
    lw a2, 0(s0)
    ecall

    li t0, 100
# Ajusta a velocidade
sleep:
    addi t0, t0, -1
    bne t0, zero, sleep

    # Passo para for_j
    addi s3, s3, -1
    bne s3, zero, for_j

    # Passo para for_i
    addi s2, s2, -1
    bne s2, zero, for_i

    # Passo para for_cor
    addi s0, s0, 4
    addi s1, s1, -1
    bne s1, zero, for_cor

    li a0, 0
    ecall   # Encerra a execução do programa


    
