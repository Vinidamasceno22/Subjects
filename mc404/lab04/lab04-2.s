# Le uma letra maiuscula e imprime sua versao minuscula
main:
    # Le um caractere
    li t0, 5
    ecall

    # Transforma em minusculo
    mv s0, a0
    addi s0, s0, 32

    # Imprime o caractere em a0
    mv a0, s0
    li t0, 2
    ecall

    # Quebra de linha
    li a0, 10
    li t0, 2
    ecall
    ret