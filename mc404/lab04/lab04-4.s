# Le um caractere, se for uma letra minuscula imprima maiuscula e vice-versa, caso contrario repita o caractere
main:
    # Inicializa os intervalos
    li t1, 65 # inicio letras maiusculas
    li t2, 91 # final letras maiusculas
    li t3, 97 # inicio letras minusculas
    li t4, 123 # final letras minusculas
    
    # Le um caractere
    li t0, 5
    ecall
    mv s0, a0

    # Verifica o intervalo do caractere
    blt s0, t1, imprimir
    blt s0, t2, maiuscula
    blt s0, t3, imprimir
    blt s0, t4, minuscula
    j imprimir

maiuscula:
    # Transforma em minusculo
    mv s0, a0
    addi s0, s0, 32
    j imprimir

minuscula:
    # Transforma em maiusculo
    mv s0, a0
    addi s0, s0, -32

imprimir:
    # Imprime 
    mv a0, s0
    li t0, 2
    ecall

    # Quebra de linha
    li a0, 10
    li t0, 2
    ecall
    ret