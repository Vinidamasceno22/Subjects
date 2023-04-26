# Le numeros do teclado e escreve sua representacao em hexadecimal, para a execucao quando for digitado 0
main:
    # Inicializa as constantes
    li s0, 10
    li s1, 8
    li s2, 8

    # Le um numero do teclado
    li t0, 4
    ecall

    # Se o numero lido for 0 para a execucao
    beq a0, zero, fim

# Inverte a ordem de grupos de 4 bits
for1:
    slli t1, t1, 4
    andi t4, a0, 15
    add t1, t1, t4
    srli a0, a0, 4

    # Atualiza o contador e verifica a condicao de parada
    addi s1, s1, -1
    blt zero, s1, for1

# Pega 4 bits iniciais e tranforma em hexadecimal
for2:
    andi t2, t1, 15

hex:
    # Verifica se o num e maior que 10
    blt t2, s0, num

    # Adiciona 7 a t2 para conseguir o codigo em ASCII do digito
    addi t2, t2, 7

num:
    # tranforma num maior que 10 em hex
    addi t2, t2, 48

imprimir:
    # Imprime em hexadecimal
    mv a0, t2
    li t0, 2
    ecall

    # Move os 4 proximos bits para o inicio
    srli t1, t1, 4

    # Atualiza o contador e verifica a condicao de parada
    addi s2, s2, -1
    blt zero, s2, for2

    # Imprime o caractere h
    li a0, 104
    li t0, 2
    ecall

    # Quebra de linha
    li a0, 10
    li t0, 2
    ecall
    j main

fim:
    ret