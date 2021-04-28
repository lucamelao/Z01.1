; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

leaw $1, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)
LOOP:
leaw $2, %A
movw (%A), %D
leaw $ELSE, %A
jne %D
nop
leaw $END, %A
jmp
nop
ELSE:
leaw $0, %A
movw (%A), %D
leaw $3, %A
addw %D, (%A), %D
movw %D, (%A)
leaw $1, %A
movw %A, %D
leaw $2, %A
subw (%A), %D, %D
movw %D, (%A)
END:
jmp
nop

