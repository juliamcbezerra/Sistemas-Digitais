.data
msg: .asciiz "Resultado: "  # Mensagem a ser impressa

.text
.globl main

# Função soma(a, b)
soma:
    add $v0, $a0, $a1   # Soma os valores de $a0 e $a1 e coloca em $v0
    jr $ra              # Retorna para a função chamadora

# Função principal (main)
main:
    addi $sp, $sp, -8   # Reserva espaço na pilha
    sw $ra, 4($sp)      # Salva o endereço de retorno na pilha

    li $a0, 5           # Primeiro argumento (x = 5)
    li $a1, 3           # Segundo argumento (y = 3)
    jal soma            # Chama a função soma
    move $t0, $v0       # Salva o resultado da soma em $t0

    li $v0, 4           # Código de syscall para imprimir string
    la $a0, msg         # Carrega a mensagem "Resultado: "
    syscall

    li $v0, 1           # Código de syscall para imprimir um inteiro
    move $a0, $t0       # Move o resultado para impressão
    syscall

    lw $ra, 4($sp)      # Recupera o endereço de retorno
    addi $sp, $sp, 8    # Libera espaço na pilha
    li $v0, 10          # Código de syscall para encerrar o programa
    syscall
