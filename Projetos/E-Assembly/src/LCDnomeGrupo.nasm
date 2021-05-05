; Arquivo: LCDnomeGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD o nome do grupo
leaw $16384, %A
movw $-1, (%A)
movw %A, %D
leaw $2, %A
movw %D, (%A)
leaw $14, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $20, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)

LOOP:
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $32769, %A
movw %A, %D
leaw $2, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)

leaw $LOOP, %A
jg %D
nop

leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
movw %D, %A
movw $-1, (%A)

leaw $14, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $20, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)


LOOP2:
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $32769, %A
movw %A, %D
leaw $2, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)

leaw $LOOP2, %A
jg %D
nop

; PROX LETRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

leaw $16387, %A
movw $-1, (%A)
movw %A, %D
leaw $2, %A
movw %D, (%A)
leaw $14, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $20, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)

LOOP3:
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $32768, %A
movw %A, %D
leaw $2, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)

leaw $LOOP3, %A
jg %D
nop

leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
movw %D, %A
movw $-1, (%A)

leaw $14, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $20, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)



LOOP4:
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $32768, %A
movw %A, %D
leaw $2, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)

leaw $LOOP4, %A
jg %D
nop

leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
movw %D, %A
movw $-1, (%A)



; PROX LETRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

leaw $16386, %A
movw $1, (%A)
movw %A, %D
leaw $2, %A
movw %D, (%A)
leaw $28, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $20, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)

LOOP10:
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $32768, %A
movw %A, %D
leaw $2, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)

leaw $LOOP10, %A
jg %D
nop