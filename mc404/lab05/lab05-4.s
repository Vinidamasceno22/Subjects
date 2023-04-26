.data
matriz:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
# Muda cada elemento da matriz para (i+j)
main:
    # Inicializa o numero de linhas e a posicao
    li t0, 2
    li t2, 0

    # Carrega o endereco da matriz
    lui s0, %hi(matriz)
    addi s0, s0, %lo(matriz)

for_i:
    # Inicializa o numero de colunas
    li t1, 3
for_j:
    # t3 sera a posicao atual
    add t3, s0, t2

    # Calcula i+j e guarda na posicao
    li t4, 5
    sub t4, t4, t0
    sub t4, t4, t1
    sw t4, t3, 0

    # Atualiza a posicao e o contador e verifica a condicao de parada
    addi t2, t2, 4
    addi t1, t1, -1
    blt zero, t1, for_j

    # Atualiza o contador e verifica a condicao de parada
    addi t0, t0, -1
    blt zero, t0, for_i
    
    ret