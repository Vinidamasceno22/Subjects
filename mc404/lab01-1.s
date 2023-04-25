main:
  addi t0, zero, 4 # escolhe a operacao de ler um numero
  ecall # le o numero

  add s1, zero, a0 # guarda o numero lido em s1
  
  addi t0, zero, 4 # escolhe a operacao de ler um numero
  ecall # le o numero

  add s2, zero, a0 # guarda o numero lido em s2

  slli a0, s1, 1

  addi t0, zero, 1 # escolhe a operacao de mostrar um numero
  ecall # mostra o numero em a0

  ret