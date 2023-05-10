.data
vetor: .word 5, 10, 20, 40, 80  # Você pode declarar todos os elementos na mesma linha
msg: .string "O programa acabou!\n"
msg2: .string "O produto do numero por 10 eh: "

.text
main:
    li   a0, 5
    la   a1, vetor   # Pseudo-instrução para carregar o endereço do vetor 
                     # (no lugar das duas instruções anteriores)
    li   a2, 10
    call MultiplicaVetor

    la   s0, vetor
    li   s1, 5
    la s2, msg2
imprime:
    beq  s1, zero, fimMain
    # Imprime mensagem de continuação
    li   a0, 4
    mv   a1, s2
    ecall
    lw   a1, 0(s0)   # Sintaxe diferente para o lw que era lw a1, s0, 0
    addi s0, s0, 4
    addi s1, s1, -1
    li   a0, 1
    ecall     # Imprime o número
    li   a0, 11
    li   a1, 13
    ecall     # Imprime uma quebra de linha
    j    imprime

fimMain:
    # Imprime mensagem de finalizção
    li   a0, 4
    la   a1, msg
    ecall
    addi a0, zero, 10
    ecall   # Encerra a execução do programa

MultiplicaVetor:
    # Movimenta o apontador da pilha 4 posicoes para baixo (16 bytes) e guarda 4 registradores na pilha
    addi sp, sp, -16
    sw   s0, 12(sp)   # Sintaxe diferente para o sw que era sw s0, sp, 12
    sw   s1, 8(sp)
    sw   s2, 4(sp)
    sw   ra, 0(sp)

    mv   s0, a0
    mv   s1, a1
    mv   s2, a2

for:
    beq  s0, zero, fim
    lw   a0, 0(s1)
    mul  a0, a0, s2
    sw   a0, 0(s1)
    addi s1, s1, 4
    addi s0, s0, -1
    j    for

fim:


    # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
    lw   ra, 0(sp)
    lw   s2, 4(sp)
    lw   s1, 8(sp)
    lw   s0, 12(sp)
    addi sp, sp, 16
    ret

