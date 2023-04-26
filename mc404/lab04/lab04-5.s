# Le um numero entre 0 e 15 e imprime seu correspondente em hexadecimal
main:
    # Inicializa constante
    li t1, 10

    # Le um numero do teclado e guarda em a0
    li t0, 4
    ecall

    # Verifica se o numero e menor que 10
    blt a0, t1, num
    
    # Adiciona 7 a a0 para conseguir o codigo em ASCII do digito
    addi a0, a0, 7

num:
    # tranforma numeros maiores que 10 em hexadecimal
    addi a0, a0, 48

imprimir:
    # Imprime o numero em hexadecimal
    li t0, 2
    ecall

    # Imprime o caractere h
    li a0, 104
    li t0, 2
    ecall

    # Quebra de linha
    li a0, 10
    li t0, 2
    ecall
    ret