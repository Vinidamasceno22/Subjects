# Le um numero e imprime S caso seja multiplo de 4 e N caso contrario
main:
    # Le um numero do teclado e armazena em a0
    li t0, 4
    ecall

    # Guarda seus dois bits menos significativos em s0
    andi s0, a0, 3

    beq s0, zero, multiplo

    # Coloca o codigo ASCII da letra N em a0 e pula pra imprimir
    li a0, 78
    j imprimir

# Coloca o codigo ASCII da letra S em a0
multiplo:
    li a0, 83

# Imprime o caractere em a0 na tela
imprimir:
    li t0, 2
    ecall
    
    # Quebra de linha
    li a0, 10
    li t0, 2
    ecall
    ret