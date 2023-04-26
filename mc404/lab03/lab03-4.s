# Le dois numeros do teclado, o segredo e um numoa ser codificado, depois imprime o numero codificado e o descodifica imprimindo o numero original
main:
    # Le um numero do teclado e armazena em s0
    li t0, 4
    ecall
    mv s0, a0

    # Le um numero do teclado e armazena em a0
    li t0, 4
    ecall

    # Guarda o numero codificado em s1
    xor s1, a0, s0

    # Imprime o numero codificado
    add a0, s1, zero
    li t0, 1
    ecall

    # Decodifica o numero
    xor a0, s1, s0

    # Imprime o numero decodificado
    li t0, 1
    ecall
    ret