# Le um numero e imprime I caso seja impar e P caso seja par
main:
    # Le um numero do teclado e armazena em a0
    li t0, 4
    ecall

    # Guarda seu bit menos significativo em s0
    andi s0, a0, 1

    beq s0, zero, par

    # Coloca o codigo ASCII da letra I em a0 e pula pra imprimir
    li a0, 73
    j imprimir

# Coloca o codigo ASCII da letra P em a0
par:
    li a0, 80

# Imprime o caractere em a0 na tela
imprimir:
    li t0, 2
    ecall

    # Quebra de linha
    li a0, 10
    li t0, 2
    ecall
    ret