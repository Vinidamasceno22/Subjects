.text
# Le uma string do teclado guarda na pilha e retorna seu tamanho
TamanhoString:
    # Guarda os registradores na pilha
    addi sp, sp, -24
    sw ra, sp, 20

    # Le um string do teclado salvando na pilha
    mv a0, sp
    li a1, 20
    li t0, 6
    ecall

    # Chama strlen para pegar o tamanho da string em sp
    mv a0, sp
    call strlen

    # Retorna os registradores
    lw ra, sp, 20
    addi sp, sp, 24 

    # Retorna o tamanho da string
    ret

# Recebe o endereco de uma string e retorna seu tamanho
strlen:
    # Inicializa os contadores
    li t0, 0
    li t3, 32
    # t1 é o endereco do ultimo espaco alocado para a string
    addi t1, a0, 19

# Verifica se o elemento analizado eh nulo
while:
    lb t2, t1, 0
    addi t1, t1, -1
    # Condicao de parada
    beq t2, t3, while

# Retorna o tamanho da string
imprimir:
    sub a0, t1, a0
    addi a0, a0, 2
    li t0, 1
    ecall
    ret