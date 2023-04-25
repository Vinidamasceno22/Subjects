.data
cores: .word 0x00000000, 0x00f7b268, 0x0000ffff, 0x00ffc0cb, 0x00b6fcd5

.text
main:
    # Deixa a matriz branca
    li a0, 0x101
    li a1, 0xffffffff
    ecall

    la s2, cores
    li s3, 5

    for_cor:
        li s0, 8
        li s1, 0x00000000
        
        for_hor:
            li t0, 1
            slli, t0, t0, 16
            add s1, s1, t0
            li a0, 0x100
            mv a1, s1
            lw a2, 0(s2)
            ecall

            li a0, 0x100
            addi a1, s1, 9
            lw a2, 0(s2)
            ecall

            addi, s0, s0, -1
            bne zero, s0, for_hor
        
        li s0, 8
        li s1, 0x00000000
        
        for_ver:
            li t0, 9
            slli t0, t0, 16
            addi s1, s1, 1
            li a0, 0x100
            mv a1, s1
            lw a2, 0(s2)
            ecall
            
            li a0, 0x100
            add a1, s1, t0
            lw a2, 0(s2)
            ecall

            addi s0, s0, -1
            bne zero, s0, for_ver
        
        addi s2, s2, 4
        addi s3, s3, -1

        bne zero, s3, for_cor
