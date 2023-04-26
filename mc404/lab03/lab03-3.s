# Le numeros do teclado e para a execucao quando o valor lido e 0, returna a soma dos numeros impares menos a soma dos numeros pares
main:
    # Inicia os registradores em 0
    li s0, 0
    li s1, 0

loop:
    # Le um numero do teclado e armazena em a0
    li t0, 4
    ecall

    # Imprime o resultado se o numero lido for 0
    beq a0, zero, fim

    # Verifica a paridade de a0
    andi t0, a0, 1
    beq t0, zero, par
    
    # Soma a0 em s1 caso seja impar
    add s1, s1, a0
    j loop

par:
    # Soma a0 em s0 caso seja par
    add s0, s0, a0
    j loop

fim:
    # Imprime a soma dos impares menos a soma dos pares
    sub a0, s1, s0

    # Verifica se o numero e maior ou igual a 0
    bge a0, zero, imprime

    # Imprime o caractere -
    li a0, 45
    li t0, 2
    ecall

    # Ajusta o valor de a0 para positivo
    sub a0, s0, s1

imprime:
    # Imprime o valor em a0
    li t0, 1
    ecall
    ret