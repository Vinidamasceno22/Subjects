.text
# Recebe o tamanho de um vetor e seu endereco e retorna a soma dos elementos
SomaVetor:
    # Inicializa a soma em 0
    li t0, 0;

# Adiciona o de todos os elementos em t0
for:
    # Pega o elemento de a1 e soma em t0
    lw t1, a1, 0
    add t0, t0, t1

    # Passo do loop
    addi a1, a1, 4
    addi a0, a0, -1
    bne a0, zero, for

# Retorna a soma
    mv a0, t0
    ret
