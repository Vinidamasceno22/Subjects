# Le um numero para ser o segredo e varios numeros a serem codificados, imprime a codificacao deles, a execucao para quando o numero a ser codificado lido e 0
main:
    # Le um numero do teclado e armazena em s0
    li t0, 4
    ecall
    mv s0, a0

loop:
    # Le um numero do teclado e armazena em a0
    li t0, 4
    ecall

    # Caso o numero lido seja 0 pare a execucao
    beq a0, zero, fim

    # Impime o nuemro codificado
    xor a0, a0, s0
    li t0, 1
    ecall

    # Volta para o loop
    j loop
fim:
    ret
