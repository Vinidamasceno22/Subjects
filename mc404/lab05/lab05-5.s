.data
string:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
# Le um string e retorna a quantidade de caracteres dela
main:
    # Carrega o endereco da string
    lui s0, %hi(string)
    addi s0, s0, %lo(string)

    # Guarda o endereco em a0 e o tamanho maximo em a1
    mv a0, s0
    li a1, 20

    # Le uma string do teclado e armazena no endereco de a0
    li t0, 6
    ecall

    # Inicializa a constante de caracter vazio e a posicao
    li t2, 32
    addi t0, s0, 19

# Carrega um caracter da posicao t0 e verifica se esta vazio
while:
    # Carrega um caractere da string
    lb t1, t0, 0

    # Decrementa a posicao e verifica retorna pro loop caso o caractere nao esteja mais vazio
    addi t0, t0, -1
    beq t1, t2, while

# Imprime o tamanho da string
imprimir:
    sub a0, t0, s0
    addi a0, a0, 2
    li t0, 1
    ecall
    ret