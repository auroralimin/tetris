.eqv VGA 0xFF000000
.eqv NUMX 320
.eqv NUMY 240

# Lado do quadrado
.eqv SIDE 7

# Parametros fixos
.eqv PAR_X1 70
.eqv PAR_Y0 50
.eqv PAR_Y1 140

# Cores
.eqv BLACK 0x00
.eqv RED 0x0F #0x03
.eqv ORANGE 0x1F
.eqv GREEN 0x30
.eqv YELLOW 0x3F
.eqv DARK_BLUE 0x99
.eqv CYAN 0xF0
.eqv WHITE 0xFF
.eqv PURPLE 0xCC #0x86

# Pecas iniciais
.eqv INIT_PIECE 0x600

# Offset players
.eqv OFFSET_X1 125
.eqv OFFSET_Y1 29

.data
FILE: .asciiz "output.bin"

# Pecas moveis
PIECE_1: .half 0x0
PIECE_2: .half 0x0
PIECE_3: .half 0x0
PIECE_4: .half 0x0

# Previsao de pecas moveis
P_PIECE_1: .half 0x0
P_PIECE_2: .half 0x0
P_PIECE_3: .half 0x0
P_PIECE_4: .half 0x0

# Inputs
INPUT_1: .word 0x0
INPUT_2: .word 0x0
INPUT_3: .word 0x0
INPUT_4: .word 0x0

# Acumuladores de tempo
TIME_1: .word 0x0
TIME_2: .word 0x0
TIME_3: .word 0x0
TIME_4: .word 0x0

# Matrizes para plotar as peças em suas 4 possíveis rotações 
L0: .half 0x2e00, 0x88c0, 0xe800, 0xc440
I0: .half 0xf000, 0x8888, 0xf000, 0x8888
J0: .half 0x8e00, 0xc880, 0xe200, 0x44c0
T0: .half 0x4e00, 0x8c80, 0xe400, 0x4c40
S0: .half 0x8c40, 0x6c00, 0x8c40, 0x6c00
Z0: .half 0x4c80, 0xc600, 0x4c80, 0xc600
Q0: .half 0xcc00, 0xcc00, 0xcc00, 0xcc00

# Mensagens para display
MSG0:.asciiz "Insira o numero de jogadores (1-4): "
PTS: .asciiz "Score"
GAME_OVER: .asciiz "GAME OVER"

# Parametros dependentes do número de jogadores
PAR_4P: .word 0x04081D4E	# 4 jogadores
PAR_3P:	.word 0x031c3162	# 3 jogadores
PAR_2P:	.word 0x023C5182	# 2 jogadores
PAR_1P:	.word 0x017d92c3	# 1 jogador

# Pontuações
SCORE1: .half 0x0
SCORE2: .half 0x0
SCORE3: .half 0x0
SCORE4: .half 0x0

# Label
ARG_LABEL1: .word 0x0		# Argumento que vai conter a label para possiveis jumps incondicionais
ARG_LABEL2: .word 0x0		# Argumento que vai conter a label para possiveis jumps incondicionais
ARG_LABEL3: .word 0x0		# Argumento que vai conter a label para possiveis jumps incondicionais

# Matrizes do jogo
PRE_1_2:   .word 0x0
PRE_1_1:   .word 0x0
LINE_1_0:  .word 0x0
LINE_1_1:  .word 0x0
LINE_1_2:  .word 0x0
LINE_1_3:  .word 0x0
LINE_1_4:  .word 0x0
LINE_1_5:  .word 0x0
LINE_1_6:  .word 0x0
LINE_1_7:  .word 0x0
LINE_1_8:  .word 0x0
LINE_1_9:  .word 0x0
LINE_1_10: .word 0x0
LINE_1_11: .word 0x0
LINE_1_12: .word 0x0
LINE_1_13: .word 0x0
LINE_1_14: .word 0x0
LINE_1_15: .word 0x0
LINE_1_16: .word 0x0
LINE_1_17: .word 0x0
LINE_1_18: .word 0x0
LINE_1_19: .word 0x0

PRE_2_2:   .word 0x0
PRE_2_1:   .word 0x0
LINE_2_0:  .word 0x0
LINE_2_1:  .word 0x0
LINE_2_2:  .word 0x0
LINE_2_3:  .word 0x0
LINE_2_4:  .word 0x0
LINE_2_5:  .word 0x0
LINE_2_6:  .word 0x0
LINE_2_7:  .word 0x0
LINE_2_8:  .word 0x0
LINE_2_9:  .word 0x0
LINE_2_10: .word 0x0
LINE_2_11: .word 0x0
LINE_2_12: .word 0x0
LINE_2_13: .word 0x0
LINE_2_14: .word 0x0
LINE_2_15: .word 0x0
LINE_2_16: .word 0x0
LINE_2_17: .word 0x0
LINE_2_18: .word 0x0
LINE_2_19: .word 0x0

PRE_3_2:   .word 0x0
PRE_3_1:   .word 0x0
LINE_3_0:  .word 0x0
LINE_3_1:  .word 0x0
LINE_3_2:  .word 0x0
LINE_3_3:  .word 0x0
LINE_3_4:  .word 0x0
LINE_3_5:  .word 0x0
LINE_3_6:  .word 0x0
LINE_3_7:  .word 0x0
LINE_3_8:  .word 0x0
LINE_3_9:  .word 0x0
LINE_3_10: .word 0x0
LINE_3_11: .word 0x0
LINE_3_12: .word 0x0
LINE_3_13: .word 0x0
LINE_3_14: .word 0x0
LINE_3_15: .word 0x0
LINE_3_16: .word 0x0
LINE_3_17: .word 0x0
LINE_3_18: .word 0x0
LINE_3_19: .word 0x0

PRE_4_2:   .word 0x0
PRE_4_1:   .word 0x0
LINE_4_0:  .word 0x0
LINE_4_1:  .word 0x0
LINE_4_2:  .word 0x0
LINE_4_3:  .word 0x0
LINE_4_4:  .word 0x0
LINE_4_5:  .word 0x0
LINE_4_6:  .word 0x0
LINE_4_7:  .word 0x0
LINE_4_8:  .word 0x0
LINE_4_9:  .word 0x0
LINE_4_10: .word 0x0
LINE_4_11: .word 0x0
LINE_4_12: .word 0x0
LINE_4_13: .word 0x0
LINE_4_14: .word 0x0
LINE_4_15: .word 0x0
LINE_4_16: .word 0x0
LINE_4_17: .word 0x0
LINE_4_18: .word 0x0
LINE_4_19: .word 0x0

# Contadores das matrizes do jogo
I_1_0:  .byte 0x0
I_1_1:  .byte 0x0
I_1_2:  .byte 0x0
I_1_3:  .byte 0x0
I_1_4:  .byte 0x0
I_1_5:  .byte 0x0
I_1_6:  .byte 0x0
I_1_7:  .byte 0x0
I_1_8:  .byte 0x0
I_1_9:  .byte 0x0
I_1_10: .byte 0x0
I_1_11: .byte 0x0
I_1_12: .byte 0x0
I_1_13: .byte 0x0
I_1_14: .byte 0x0
I_1_15: .byte 0x0
I_1_16: .byte 0x0
I_1_17: .byte 0x0
I_1_18: .byte 0x0
I_1_19: .byte 0x0

I_2_0:  .byte 0x0
I_2_1:  .byte 0x0
I_2_2:  .byte 0x0
I_2_3:  .byte 0x0
I_2_4:  .byte 0x0
I_2_5:  .byte 0x0
I_2_6:  .byte 0x0
I_2_7:  .byte 0x0
I_2_8:  .byte 0x0
I_2_9:  .byte 0x0
I_2_10: .byte 0x0
I_2_11: .byte 0x0
I_2_12: .byte 0x0
I_2_13: .byte 0x0
I_2_14: .byte 0x0
I_2_15: .byte 0x0
I_2_16: .byte 0x0
I_2_17: .byte 0x0
I_2_18: .byte 0x0
I_2_19: .byte 0x0

I_3_0:  .byte 0x0
I_3_1:  .byte 0x0
I_3_2:  .byte 0x0
I_3_3:  .byte 0x0
I_3_4:  .byte 0x0
I_3_5:  .byte 0x0
I_3_6:  .byte 0x0
I_3_7:  .byte 0x0
I_3_8:  .byte 0x0
I_3_9:  .byte 0x0
I_3_10: .byte 0x0
I_3_11: .byte 0x0
I_3_12: .byte 0x0
I_3_13: .byte 0x0
I_3_14: .byte 0x0
I_3_15: .byte 0x0
I_3_16: .byte 0x0
I_3_17: .byte 0x0
I_3_18: .byte 0x0
I_3_19: .byte 0x0

I_4_0:  .byte 0x0
I_4_1:  .byte 0x0
I_4_2:  .byte 0x0
I_4_3:  .byte 0x0
I_4_4:  .byte 0x0
I_4_5:  .byte 0x0
I_4_6:  .byte 0x0
I_4_7:  .byte 0x0
I_4_8:  .byte 0x0
I_4_9:  .byte 0x0
I_4_10: .byte 0x0
I_4_11: .byte 0x0
I_4_12: .byte 0x0
I_4_13: .byte 0x0
I_4_14: .byte 0x0
I_4_15: .byte 0x0
I_4_16: .byte 0x0
I_4_17: .byte 0x0
I_4_18: .byte 0x0
I_4_19: .byte 0x0

# Contador de linhas consumidas
CONSUMED: .byte 0x0

# Salva o tempo do ciclo
CYCLE_TIME: .word 0x1f4
CYCLE_BASE: .word 0x1f4

#Beeps da música
BEEP: .byte 76 #E6
BEEP1: .byte 71 #B5
BEEP2: .byte 72 #C6
BEEP3: .byte 74 #D6
BEEP4: .byte 72 #C6
BEEP5: .byte 71 #B5
BEEP6: .byte 69 #A5
BEEP7: .byte 69 #A5
BEEP8: .byte 72 #C6
BEEP9: .byte 76 #E6
BEEP10: .byte 74 #D6
BEEP11: .byte 72 #C6
BEEP12: .byte 71 #B5
BEEP13: .byte 71 #B5
BEEP14: .byte 72 #C6
BEEP15: .byte 74 #D6
BEEP16: .byte 76 #E6
BEEP17: .byte 72 #C6
BEEP18: .byte 69 #A5
BEEP19: .byte 69 #A5
BEEP20: .byte 74 #D6
BEEP21: .byte 77 #F6
BEEP22: .byte 81 #A6
BEEP23: .byte 79 #G6
BEEP24: .byte 77 #F6
BEEP25: .byte 76 #E6
BEEP26: .byte 72 #C6
BEEP27: .byte 76 #E6
BEEP28: .byte 74 #D6
BEEP29: .byte 72 #C6
BEEP30: .byte 71 #B5
BEEP31: .byte 71 #B5
BEEP32: .byte 74 #D6
BEEP33: .byte 76 #E6
BEEP34: .byte 72 #C6
BEEP35: .byte 69 #A5
BEEP36: .byte 69 #A5

#Posição atual da musica
MUSIC_POSITION: .word 0x0

#Duração da nota
DURATION: .byte 255

#Volume da nota
VOLUME: .byte 127

.text
MAIN:		move $s3, $zero
		la $a0, MSG0		# Pergunta quantidade de jogadores
		li $a1, 3
		li $a2, 3
		li $a3, 0xFF00
		li $v0, 104
		syscall
		
		li $v0, 5		# Le do teclado a quantidade de jogadores
		syscall
		move $s3, $v0
		
		# Abre o arquivo
		la $a0,FILE
		li $a1,0
		li $a2,0
		li $v0,13
		syscall

		# Le o arquivos para a memoria VGA
		move $a0,$v0
		la $a1,0xFF000000
		li $a2,76800
		li $v0,14
		syscall

		#Fecha o arquivo
		move $a0,$s1
		li $v0,16
		syscall
		
		beq $s3, 4, P4		# Seleciona os parametros dependentes do número de jogadores
		beq $s3, 3, P3
		beq $s3, 2, P2
		beq $s3, 1, P1
		
P4:		la $t0, PAR_4P 
		j pass_main
		
P3:		la $t0, PAR_3P
		j pass_main
		
P2:		la $t0, PAR_2P
		j pass_main
		
P1:		la $t0, PAR_1P
		
pass_main:	lw $s7, 0($t0)			# Carrega parâmetros da memória
		andi $a0, $s7, 0x00FF0000
		srl $a0, $a0, 16
		andi $a1, $s7, 0x0000FF00
		srl $a1, $a1, 8
		andi $a2, $s7, 0x000000FF
		li $a3, NUMX
		jal show_initial		# Plota tela inicial de jogo
		
		andi $a0, $s6, 0xFFFF0000
		srl $a0, $a0, 16
		li $a1, 0

		li $t0, 0			#contador das pecas
		la $t2, P_PIECE_1		#endereco do inicio da preview
		srl $t3, $s7, 24		#coloca quantos jogadores sao no total em t0
preview:	bge $t0, $t3, set_timers	#testa se ja setou todas as previews
		jal rand7			#randomiza o tipo da peca	
		li $t1, INIT_PIECE		#inicializa uma nova peca
		addu $t1, $t1, $v0		#seta o tipo da peca
		sh $t1, 0($t2)
		addiu $t0, $t0, 1
		addiu $t2, $t2, 2
		j preview
		
set_timers:	jal sys_time			#pega o tempo do sistema em ms
		add $s0, $zero, $v0		#seta o acumulador de tempo
		add $s4, $zero, $v0		#seta o acumulador de tempo

game_loop:	jal sys_time			#pega o tempo do sistema em ms
		add $s1, $zero, $v0		#seta o acumulador de tempo
		
		la $t0, PIECE_1			#carrega o endereco da primeira peca movel
		sll $t1, $s3, 1			#carrega o offset do endereco que muda de acordo com o player
		addu $t0, $t0, $t1		#calcula o endereco da peca movel
		lhu $s2, 0($t0)			#carrega a peca movel no registrador s2
		
		la $t0, TIME_1			#carrega o endereco do  primeiro timer
		sll $t1, $s3, 2			#carrega o offset do endereco que muda de acordo com o player
		addu $t0, $t0, $t1		#calcula o endereco do timer
		lw $s0, 0($t0)			#carrega o timer no registrador s0

		beq $s2,0xFFFF,continue_gl4 	#se esta no fim do jogo, vai pro fim do loop
		
		bne $s2, $zero, continue_gl0 	#checa se tem uma peca movel em jogo
		
		jal rand7			#se sim, randomiza o tipo da peca	
		li $t3, INIT_PIECE		#inicializa uma nova peca previa
		addu $t3, $t3, $v0		#seta o tipo da peca
		
		la $t0, P_PIECE_1		#carrega o endereco da primeira peca movel previa
		sll $t1, $s3, 1			#carrega o offset do endereco que muda de acordo com o player
		addu $t0, $t0, $t1		#calcula o endereco da peca movel
		lhu $s2, 0($t0)			#carrega a peca movel no registrador s2
		sh $t3, 0($t0)			#salva a nova peca na memoria
	
		sll $a2, $s2, 29		#isola tipo
		srl $a2, $a2, 29		#isola tipo
		srl $a3, $s2, 14		#isola a rotacao
		sll $a3, $a3, 1			##seta o plot como negativo
	
		addi $sp, $sp, -4
		sw $t3, 0($sp)
		jal plot_prox
		lw $t3, 0($sp)
		addi $sp, $sp, 4
	
		sll $a2, $t3, 29		#isola tipo
		srl $a2, $a2, 29		#isola tipo
		srl $a3, $t3, 14		#isola a rotacao
		sll $a3, $a3, 1			#isola a rotacao
		addi $a3, $a3, 1		#seta o plot como positivo
	
		jal plot_prox
		
		la $t1, PIECE_1			#carrega o endereco da primeira peca movel
		sll $t2, $s3, 1			#carrega o offset do endereco que muda de acordo com o player
		addu $t1, $t1, $t2		#calcula o endereco da peca movel
		sh $s2, 0($t1)
		
		li $s0, 0			#acumula tempo suficiente pra ciclo

continue_gl0:	jal keyboard      		#verifica teclado por uma tecla
		la $t0, INPUT_1			#carrega o endereco do input
		sll $t1, $s3, 2			#calcula o offset do input
		addu $t0, $t0, $t1		#soma endereco do input com offset
		lw $t1, 0($t0)			#pega input na memoria
		sw $zero, 0($t0)		#reseta input
		beq $t1, 0, continue_gl1	#se nao teve input, continua o loop
		
		add $a0, $t1, $zero		#seta o codigo da tecla pressionada como argumento
		jal input 			#senao, trata input
		
continue_gl1:	la $t1, CYCLE_TIME		#pega o tempo endereco do tempo de ciclo da memoria
		lw $t2, 0($t1)			#pega o tempo do tempo de ciclo da memoria
		subu $t0, $s1, $s4		#calcula o tempo entre a ultima vez que a peca desceu e agora 
		bltu $t0, $t2, continue_gl2	#checa se há tempo acumulado suficiente para tocar o beep da musica
		jal play_music			#toca um beep da musica
		add $s4, $zero, $s1		#seta o acumulador de tempo
		
continue_gl2:	la $t1, CYCLE_TIME		#pega o tempo endereco do tempo de ciclo da memoria
		lw $t2, 0($t1)			#pega o tempo do tempo de ciclo da memoria
		subu $t0, $s1, $s0		#calcula o tempo entre a ultima vez que a peca desceu e agora 
		bltu $t0, $t2, continue_gl4	#checa se há tempo acumulado suficiente para o ciclo de movimento da peca
		add $s0, $zero, $s1		#seta o acumulador de tempo
		srl $t0, $s7, 24		#coloca quantos jogadores sao no total em t0
		addiu $t1, $s3, 1		#incrementa o jogador
		blt $t1, $t0, continue_gl3	#se o jogador e' valido, continua o loop sem resetar o acumulador de tempo
		
continue_gl3:	la $t0, update_down		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL1		#salva o valor do endereco da label no endereco ARG_LABEL1
		la $t0, after_down		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL2		#salva o valor do endereco da label no endereco ARG_LABEL2
		la $t0, reset_down		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL3		#salva o valor do endereco da label no endereco ARG_LABEL3
		
		jal cycle
	
		beqz $v0, continue_gl4		#se nao houver colisao, vai para continue_gl2
		
		jal collision

continue_gl4:	la $t0, PIECE_1			#carrega o endereco da primeira peca movel
		sll $t1, $s3, 1			#carrega o offset do endereco que muda de acordo com o player
		addu $t0, $t0, $t1		#calcula o endereco da peca movel
		sh $s2, 0($t0)			#salva na memoria a peca movel
		
		la $t0, TIME_1			#carrega o endereco do  primeiro timer
		sll $t1, $s3, 2			#carrega o offset do endereco que muda de acordo com o player
		addu $t0, $t0, $t1		#calcula o endereco do timer
		sw $s0, 0($t0)			#salva o timer
		
		srl $t0, $s7, 24		#coloca quantos jogadores sao no total em t0
		addiu $s3, $s3, 1		#incrementa o jogador
		blt $s3, $t0, continue_gl5	#se o jogador e' valido, continua o loop sem resetar jogador
		add $s3, $zero, $zero

continue_gl5: j game_loop

#################################################################################################
keyboard:	la $t1,0xFF100000
		lw $t0,0($t1)
		andi $t0,$t0,0x0001		# Le bit de Controle Teclado
   		beq $t0,$zero, keyboard_end   	# Se nao ha tecla pressionada, finaliza
  		lw $t0,4($t1)  			# Tecla lida

		#teclas do player 1:
		beq $t0, 119, key_p1	
		beq $t0, 87, key_p1		
		beq $t0, 65, key_p1	
		beq $t0, 97, key_p1	
		beq $t0, 100, key_p1		
		beq $t0, 68, key_p1	
		beq $t0, 115, key_p1		
		beq $t0, 83, key_p1	
		
		#teclas do player 2:
		beq $t0, 121, key_p2		
		beq $t0, 89, key_p2		
		beq $t0, 103, key_p2		
		beq $t0, 71, key_p2		
		beq $t0, 106, key_p2		
		beq $t0, 74, key_p2		
		beq $t0, 104, key_p2		
		beq $t0, 72, key_p2	
		
		#teclas do player 3:
		beq $t0, 111, key_p3
		beq $t0, 79, key_p3
		beq $t0, 107, key_p3
		beq $t0, 75, key_p3
		beq $t0, 59, key_p3
		beq $t0, 108, key_p3
		beq $t0, 76, key_p3
		
		#teclas do player 4:
		beq $t0, 56, key_p4
		beq $t0, 52, key_p4
		beq $t0, 54, key_p4
		beq $t0, 53, key_p4
		
		jr $ra

key_p1:		sw $t0, INPUT_1
		jr $ra
key_p2:		sw $t0, INPUT_2
		jr $ra
key_p3:		sw $t0, INPUT_3
		jr $ra
key_p4:		sw $t0, INPUT_4
keyboard_end:	jr $ra

#################################################################################################
input:		beq $a0, 119, rotate		#verifica se a tecla de rotacao (w) foi pressionada
		beq $a0, 87, rotate		#verifica se a tecla de rotacao (W) foi pressionada
		beq $a0, 65, left		#verifica se a tecla de esquerda (a) foi pressionada
		beq $a0, 97, left		#verifica se a tecla de esqurda (A) foi pressionada
		beq $a0, 100, right		#verifica se a tecla de esquerda (d) foi pressionada
		beq $a0, 68, right		#verifica se a tecla de esqurda (D) foi pressionada
		beq $a0, 115, down		#verifica se a tecla de esquerda (s) foi pressionada
		beq $a0, 83, down		#verifica se a tecla de esqurda (S) foi pressionada
		
		beq $a0, 121, rotate		#verifica se a tecla de rotacao (y) foi pressionada
		beq $a0, 89, rotate		#verifica se a tecla de rotacao (Y) foi pressionada
		beq $a0, 103, left		#verifica se a tecla de esquerda (g) foi pressionada
		beq $a0, 71, left		#verifica se a tecla de esqurda (G) foi pressionada
		beq $a0, 106, right		#verifica se a tecla de esquerda (j) foi pressionada
		beq $a0, 74, right		#verifica se a tecla de esqurda (J) foi pressionada
		beq $a0, 104, down		#verifica se a tecla de esquerda (h) foi pressionada
		beq $a0, 72, down		#verifica se a tecla de esqurda (H) foi pressionada
		
		beq $a0, 111, rotate		#verifica se a tecla de rotacao (o) foi pressionada
		beq $a0, 79, rotate		#verifica se a tecla de rotacao (O) foi pressionada
		beq $a0, 107, left		#verifica se a tecla de esquerda (k) foi pressionada
		beq $a0, 75, left		#verifica se a tecla de esqurda (K) foi pressionada
		beq $a0, 59, right		#verifica se a tecla de esquerda (;) foi pressionada
		beq $a0, 108, down		#verifica se a tecla de esquerda (L) foi pressionada
		beq $a0, 76, down		#verifica se a tecla de esqurda (L) foi pressionada
			
		beq $a0, 56, rotate		#verifica se a tecla de rotacao (8) foi pressionada
		beq $a0, 52, left		#verifica se a tecla de esquerda (4) foi pressionada
		beq $a0, 54, right		#verifica se a tecla de esquerda (6) foi pressionada
		beq $a0, 53, down		#verifica se a tecla de esqurda (5) foi pressionada
		
		jr $ra
		
#-----------------------------------------------------------------------------------------------#
rotate:		la $t0, update_rotate		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL1		#salva o valor do endereco da label no endereco ARG_LABEL1
		la $t0, after_rotate		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL2		#salva o valor do endereco da label no endereco ARG_LABEL2
		la $t0, reset_rotate		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL3		#salva o valor do endereco da label no endereco ARG_LABEL3
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal cycle
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra	
		
#-----------------------------------------------------------------------------------------------#
left:		la $t0, update_left		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL1		#salva o valor do endereco da label no endereco ARG_LABEL1
		la $t0, after_left		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL2		#salva o valor do endereco da label no endereco ARG_LABEL2
		la $t0, reset_left		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL3		#salva o valor do endereco da label no endereco ARG_LABEL3
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal cycle
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra
		
#-----------------------------------------------------------------------------------------------#
right:		la $t0, update_right		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL1		#salva o valor do endereco da label no endereco ARG_LABEL1
		la $t0, after_right		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL2		#salva o valor do endereco da label no endereco ARG_LABEL2
		la $t0, reset_right		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL3		#salva o valor do endereco da label no endereco ARG_LABEL3
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal cycle
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra
		
#-----------------------------------------------------------------------------------------------#
down:		la $t0, update_down		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL1		#salva o valor do endereco da label no endereco ARG_LABEL1
		la $t0, after_down		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL2		#salva o valor do endereco da label no endereco ARG_LABEL2
		la $t0, reset_down		#seta label a ser usada como argumento
		sw $t0, ARG_LABEL3		#salva o valor do endereco da label no endereco ARG_LABEL3
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal cycle
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra
		
#################################################################################################
cycle:		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal set_arguments 		#seta os argumentos com os valores relativos a peca
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		lw $t0, ARG_LABEL1		#carrega metodo de atualizacao a ser chamado 
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal jal1		
jal1:		addi $ra, $ra, 8
		jr $t0
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addi $sp, $sp, -20
		sw $ra, 16($sp)
		sw $a0, 12($sp)
		sw $a1, 8($sp)
		sw $a2, 4($sp)
		sw $a3, 0($sp)
		jal collision_check		#vai para checagem de colisao
		lw $a3, 0($sp)
		lw $a2, 4($sp)
		lw $a1, 8($sp)
		lw $a0, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		bnez $v0, c_collided		#se houver colisao, acaba o ciclo
		
		lw $t0, ARG_LABEL2		#carrega metodo que seta a peca nova de a ser chamado
		addi $sp, $sp, -4
		sw $ra, 0($sp)	
		jal jal2		
jal2:		addi $ra, $ra, 8
		jr $t0	
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		sll $a3, $a3, 1			#da shift de 1 para esquerda pois o primeiro bit simboliza o tipo do plot
		
		addi $sp, $sp, -20
		sw $ra, 16($sp)
		sw $a0, 12($sp)
		sw $a1, 8($sp)
		sw $a2, 4($sp)
		sw $a3, 0($sp)
		jal plot_piece			#plota negativo da peca com valores antigos
		lw $a3, 0($sp)
		lw $a2, 4($sp)
		lw $a1, 8($sp)
		lw $a0, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		
		lw $t0, ARG_LABEL3		#carrega metodo que seta a peca nova de a ser chamado
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal jal3		
jal3:		addi $ra, $ra, 8
		jr $t0
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal plot_piece			#plota o positivo da peca nova 
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra			
			
c_collided:	addiu $v0, $zero, 1
		jr $ra
		
#################################################################################################
update_down:	addiu $a1, $a1, 1		#incrementa a posicao y da peca e coloca no registrador a1
		jr $ra
		
#################################################################################################
after_down:	addi $t1, $a1, -1		#coloca posicao y anterior em t1
		sll $t2, $t1, 3 		#coloca a posicao y antiga da peca nos bits certos da abstracao
		subu $t2, $s2, $t2		#remove a posicao y antiga da peca
		sll $t3, $a1, 3 		#coloca a posicao y nova da peca nos bits certos da abstracao
		addu $s2, $t2, $t3		#atualiza a peca na posicao certa
		jr $ra
		
#################################################################################################
reset_down:	addiu $a1, $a1, 1		#seta a nova posicao y da peca com offset
		addiu $a3, $a3, 1 		#seta os bits do plot como positivo
		jr $ra

#################################################################################################
update_rotate:	addiu $a3, $a3, 1		#incrementa a rotacao da peca e coloca no registrador a3
		addiu $a1, $a1, 1		#incrementa a posicao y da peca e coloca no registrador a1
		jr $ra
		
#################################################################################################
after_rotate:	addi $a3, $a3, -1		#incrementa a rotacao da peca e coloca no registrador a3
		addiu $s2, $s2, 16384		#incrementa rotacao
		sll $s2, $s2, 16
		srl $s2, $s2, 16
		jr $ra
		
#################################################################################################
reset_rotate:	addiu $a3, $a3, 3		#nova rotacao com plot positivo
		sll $a3, $a3, 29
		srl $a3, $a3, 29
		jr $ra

#################################################################################################
update_left:	addi $a0, $a0, -1		#decrementa a posicao x da peca e coloca no registrador a1
		addiu $a1, $a1, 1		#incrementa a posicao y da peca e coloca no registrador a1
		jr $ra
		
#################################################################################################
after_left:	addiu $a0, $a0, 1		#incrementa a posicao x
		addiu $t1, $a0, 1		#coloca posicao x anterior em t1
		sll $t2, $t1, 9 		#coloca a posicao x antiga da peca nos bits certos da abstracao
		subu $t2, $s2, $t2		#remove a posicao x antiga da peca
		sll $t3, $a0, 9 		#coloca a posicao x nova da peca nos bits certos da abstracao
		addu $s2, $t2, $t3		#atualiza a peca na posicao certa
		jr $ra
		
#################################################################################################
reset_left:	subi $a0, $a0, 1		#seta a nova posicao x da peca com offset
		addiu $a3, $a3, 1 		#seta os bits do plot como positivo
		jr $ra

#################################################################################################
update_right:	addiu $a0, $a0, 1		#decrementa a posicao x da peca e coloca no registrador a1
		addiu $a1, $a1, 1		#incrementa a posicao y da peca e coloca no registrador a1
		jr $ra
		
#################################################################################################
after_right:	addi $a0, $a0, -1		#incrementa a posicao x
		addi $t1, $a0, -1		#coloca posicao x anterior em t1
		sll $t2, $t1, 9 		#coloca a posicao x antiga da peca nos bits certos da abstracao
		subu $t2, $s2, $t2		#remove a posicao x antiga da peca
		sll $t3, $a0, 9 		#coloca a posicao x nova da peca nos bits certos da abstracao
		addu $s2, $t2, $t3		#atualiza a peca na posicao certa
		jr $ra
		
#################################################################################################
reset_right:	addiu $a0, $a0, 1		#seta a nova posicao x da peca com offset
		addiu $a3, $a3, 1 		#seta os bits do plot como positivo
		jr $ra		
			
#################################################################################################	
set_arguments: 	sll $a2, $s2, 29		#isola o tipo da peca no registrador a2 (mais significativo)
		srl $a2, $a2, 29		#isola o tipo da peca no registrador a2 (menos significativo)
		srl $t0, $s2, 3			#remove o tipo da peca da abstracao de peca
		
		sll $a1, $t0, 26		#isola a posicao y da peca no registrador a1 (mais significativo)
		srl $a1, $a1, 26		#isola a posicao y da peca no registrador a1 (menos significativo)
		srl $t0, $t0, 6			#remove a posicao y da peca da abstracao de peca
		
		sll $a0, $t0, 27		#isola a posicao x da peca no registrador a0 (mais significativo)
		srl $a0, $a0, 27		#isola a posicao x da peca no registrador a0 (menos significativo)
		
		sll $a3, $t0, 25		#isola a rotacao da peca na esquerda
		srl $a3, $a3, 30		#isola a rotacao da peca na direita
		
		jr $ra
						
#################################################################################################
collision_check:addu $v0, $zero, $zero
		bltz $a0, collided		#se ultrapassou o limite da parede da esquerda, vai para collided
		
		addi $t0, $a2, -1		#decrementa o tipo da peca
		sll $t0, $t0, 3			#calcula o offset do endereco da matriz de peca a ser utilizada
		sll $t1, $a3, 1			#(offset = 8*tipo_peça + 2*rotação)
		addu $t0, $t0, $t1		#offset das half words das pecas
		la $t1, L0			#carrega o inicio da matriz das pecas
		addu $t1, $t1, $t0		#soma o endereco do inicio da matriz com o offset
		lhu $t0, 0($t1)			#carrega matriz da peca no registrador t0
		
		addu $t3, $zero, $zero		#inicializa contador da peca
		
		li $t4, 88			#tamanho de uma matriz de arena
		mult $t4, $s3			#calcula o offset da matriz
		mflo $t4			#coloca offset da matriz no registrador t4
		
		addi $t2, $a1, -2		#retira posicoes fantasma
		sll $t2, $t2, 2			#calcula offset da linha da matriz do jogo
		la $t1, LINE_1_0		#carrega o inicio da matriz do jogo
		add $t1, $t1, $t2		#coloca o endereco da posicao da matriz no registrador t1
		add $t1, $t1, $t4		#coloca o endereco da posicao da matriz no registrador t1 com offset

		li $t2, 3			#seta registrador t3 como 3
		mult $a0, $t2			#calcula offset da coluna da matriz do jogo
		mflo $t2			#move o resultado do offset para o registrador t2
		
		la $t8, LINE_1_19		#carrega o endereco da ultima linha da matriz
		add $t8, $t8, $t4		#coloca o endereco da ultima posicao da matriz no registrador t8
		
loop_check:	bgeu $t3, 15, end_check		#se contador de colunas >= que 16, sai do loop
		li $t4, 16			#carrega o imediato 16 no registrador t4
		subu $t4, $t4, $t3		#calcula o bit a ser analisado da peca
		
		addi $t4, $t4, -1		#decrementa registrador t4
		li $t5, 1			#coloca o imediato 1 no registrador t5
		sllv $t4, $t5, $t4		#seta como 1 so o bit a ser analisado da peca
		and $t5, $t4, $t0 		#checa se a posicao atual na abstracao da peca e' um
		beqz $t5, loop_check_1		#se a posicao atual e'nula, continua sem colisao
		
		bgt $t1, $t8, collided		#se collidiu com o chão, vai para collided
		bgeu $t2, 30, collided		#se ultrapassou o limite da parede da esquerda, vai para collided
		
		lw $t6, 0($t1)			#carrega linha da matriz
		li $t7, 29			#carrega 29 no registrador t7
		subu $t7, $t7, $t2		#calcula shift left offset
		sllv $t6, $t6, $t7		#limpa valores pra esquerda
		srlv $t6, $t6, $t7		#limpa valores pra esquerda
		srlv $t6, $t6, $t2		#acaba de isolar bits que salvam se tem uma peca no lugar checado
		bnez $t6, collided		#se tem uma peca naquele lugar, vai para collided
				
loop_check_1:	addiu $t3, $t3, 1		#incrementa contador da peca
		addiu $t2, $t2, 3		#incrementa o offset da coluna na matriz
		li $t6, 4			#carrega 4 no registrador $t6
		div $t3, $t6			#divide para checar qual linha da peca esta
		mfhi $t6			#pega reminder
		bnez $t6, loop_check_2		#se nao esta na proxima linha da peca, continua
		
		addiu $t1, $t1, 4		#incrementa endereco t1
		li $t2, 3			#seta registrador t3 como 3
		mult $a0, $t2			#calcula offset da coluna da matriz do jogo
		mflo $t2			#move o resultado do offset para o registrador t2
			
loop_check_2:	j loop_check			#vai pra inicio do loop
end_check:

		jr $ra

collided: 	addiu $v0, $zero, 1
		jr $ra

#################################################################################################
collision: 	addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal set_arguments 		#seta os argumentos com os valores relativos a peca
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addi $t0, $a2, -1		#decrementa o tipo da peca
		sll $t0, $t0, 3			#calcula o offset do endereco da matriz de peca a ser utilizada
		sll $t1, $a3, 1			#(offset = 8*tipo_peça + 2*rotação)
		addu $t0, $t0, $t1		#offset das half words das pecas
		la $t1, L0			#carrega o inicio da matriz das pecas
		addu $t1, $t1, $t0		#soma o endereco do inicio da matriz com o offset
		lhu $t0, 0($t1)			#carrega matriz da peca no registrador t0
		
		addu $t3, $zero, $zero		#inicializa contador da peca

		ble $a1, 1, game_end		#se a peca esta acima do teto da arena, vai para game_end
		addi $a1, $a1, -2		#retira posicoes fantasma
		
		li $t4, 88			#tamanho de uma matriz de arena
		mult $t4, $s3			#calcula o offset da matrz
		mflo $t4			#coloca o offset da matriz no registrador t4
		
		sll $t2, $a1, 2			#calcula offset da linha da matriz do jogo
		la $t1, LINE_1_0			#carrega o inicio da matriz do jogo
		add $t1, $t1, $t2		#coloca o endereco da posicao da matriz no registrador t1
		add $t1, $t1, $t4		#coloca o endereco da posicao da matriz no registrador t1 com offset

		li $t4, 20			#tamanho de uma matriz de indexes
		mult $t4, $s3			#calcula o offset da matrz
		mflo $t4			#coloca o offset da matriz no registrador t4
		
		la $t8, I_1_0			#carrega o endereco do inicio dos indexes da matriz
		add $t8, $t8, $a1		#coloca o endereco da posicao da matriz no registrador t8
		add $t8, $t8, $t4		#coloca o endereco da posicao da matriz no registrador t8 com offset

		li $t2, 3			#seta registrador t3 como 3
		mult $a0, $t2			#calcula offset da coluna da matriz do jogo
		mflo $t2			#move o resultado do offset para o registrador t2
		
loop_save:	bgeu $t3, 15, end_loop_save	#se contador de colunas >= que 16, sai do loop
		li $t4, 16			#carrega o imediato 16 no registrador t4
		subu $t4, $t4, $t3		#calcula o bit a ser analisado da peca
		
		addi $t4, $t4, -1		#decrementa registrador t4
		li $t5, 1			#coloca o imediato 1 no registrador t5
		sllv $t4, $t5, $t4		#seta como 1 so o bit a ser analisado da peca
		and $t5, $t4, $t0 		#checa se a posicao atual na abstracao da peca e' um
		beqz $t5, loop_save_1		#se a posicao atual e'nula, continua sem salvar
		
		addu $t6, $a2, $zero		#coloca o valor do tipo da peca no registrador t7
		sllv $t6, $t6, $t2		#coloca o valor do tipo no local onde ta o quadrado da peca
		lw $t7, 0($t1)			#carrega linha da matriz
		addu $t7, $t7, $t6		#salva quadrado da peca
		sw $t7, 0($t1)			#salva linha atualizada na memoria
		
		lbu $t9, 0($t8)			#carrega index da linha da matriz
		addiu $t9, $t9, 1		#incrementa o index
		sb $t9, 0($t8) 			#salva o index da linha da matriz
				
loop_save_1:	addiu $t3, $t3, 1		#incrementa contador da peca
		addiu $t2, $t2, 3		#incrementa o offset da coluna na matriz
		li $t6, 4			#carrega 4 no registrador $t6
		div $t3, $t6			#divide para checar qual linha da peca esta
		mfhi $t6			#pega reminder
		bnez $t6, loop_save_2		#se nao esta na proxima linha da peca, continua
		
		addiu $t1, $t1, 4		#incrementa endereco t1
		addiu $t8, $t8, 1		#incrementa endereco t8
		li $t2, 3			#seta registrador t3 como 3
		mult $a0, $t2			#calcula offset da coluna da matriz do jogo
		mflo $t2			#move o resultado do offset para o registrador t2
			
loop_save_2:	j loop_save			#vai pra inicio do loop
end_loop_save:	

		addu $s2, $zero, $zero		#reseta peca movel
				
		li $t9, 20			#tamanho de uma matriz de indexes
		mult $t9, $s3			#calcula o offset da matrz
		mflo $t9			#coloca o offset da matriz no registrador t4
		
		la $t0, I_1_19			#carrega o endereco do ultimo index da matriz
		addu $t0, $t0, $t9		#soma endereco ao offset
		la $t1, I_1_0			#carrega o endereco do primeiro index da matriz
		addu $t1, $t1, $t9		#soma endereco ao offset
		
		li $t9, 88			#tamanho de uma matriz de arena
		mult $t9, $s3			#calcula o offset da matrz
		mflo $t9			#coloca o offset da matriz no registrador t4
		
		la $t2, LINE_1_19		#carrega o endereco da ultima linha da matriz
		addu $t2, $t2, $t9		#soma endereco ao offset
		la $t3, LINE_1_0		#carrega o endereco da primeira linha da matriz
		addu $t3, $t3, $t9		#soma endereco ao offset
						
		
loop_l:		blt $t0, $t1, collision_1	#se ja percorreu os indices da matriz toda, sai do loop
		lbu $t4, 0($t0)			#carrega o index

		bne $t4, 10, loop_l_1		#se a linha nao esta completa, continua sem modificar
		lbu $t6, CONSUMED
		addi $t6, $t6, 1		#incrementa contador de linhas consumidas
		sb $t6, CONSUMED

		addi $sp, $sp, -4
		sw $ra, 0($sp)			#salva $ra na pilha
		jal play_break_line		#toca o beep
		lw $ra, 0($sp)			#pega da pilha
		addi $sp, $sp, 4
		
		addiu $t4, $t2, 0		#copia o endereco da linha da matriz
		addiu $t5, $t0, 0		#copia o index da linha da matriz
		loop_u: 	bleu $t4, $t3, loop_u_end	#se ja percorreu a matriz toda, sai do loop
				lw $t6, 0($t4)			#carrega linha a ser atualizada
				beqz $t6, loop_u_end		#se a linha a ser atualizada ja e nula, sai do loop
			
				lw $t6, -4($t4)			#carrega linha a ser copiada
				sw $t6, 0($t4)			#atualiza linha atual	
				lbu $t6, -1($t5)		#carrega index a ser copiado
				sb $t6, 0($t5)			#atualiza index atual
				
				subu $t7, $t4, $t3		#calcula as diferencas dos enderecos
				div $a0, $t7, 4			#seta o argumento com a linha modificada
				li $a1, 0			#seta o player
				
				addi $sp, $sp, -28
				sw $ra, 0($sp)
				sw $t0, 4($sp)
				sw $t1, 8($sp)
				sw $t2, 12($sp)
				sw $t3, 16($sp)
				sw $t4, 20($sp)
				sw $t5, 24($sp)
				jal plot_line
				lw $t5, 24($sp)
				lw $t4, 20($sp)
				lw $t3, 16($sp)
				lw $t2, 12($sp)
				lw $t1, 8($sp)
				lw $t0, 4($sp)
				lw $ra, 0($sp)
				addi $sp, $sp, 28
			
		loop_u_1:	addi $t4, $t4, -4		#seta o endereco da linha pra um acima
				addi $t5, $t5, -1		#seta o endereco do index pra um acima
				j loop_u
				
		loop_u_end:	addiu $t0, $t0, 2		#compensa pela linha que sumiu
				addiu $t2, $t2, 8		#compensa pela linha que sumiu		
		
loop_l_1:	addi $t0, $t0, -1		#vai para o endereco do index anterior
		addi $t2, $t2, -4		#vai para o endereco da linha anterior
		j loop_l
		
collision_1:	la $t8, SCORE1			#carrega o endereco do score na memoria
		sll $t9, $s3, 1			#calcula o offset do score
		addu $t8, $t8, $t9		#soma o endereco do score com o offset
		lhu $a0, 0($t8)
		
		lbu $t0, CONSUMED
		beqz $t0, collision_end		#se nenhuma linha foi consumida, a pontuacao nao muda
		beq $t0, 1, collision_l_1	#se uma linha foi consumida, vai para collision_l_1
		beq $t0, 2, collision_l_2	#se duas linhas foram consumidas, vai para collision_l_2
		beq $t0, 3, collision_l_3	#se três linhas foram consumidas, vai para collision_l_3
		beq $t0, 4, collision_l_4	#se quatro linhas foram consumidas, vai para collision_l_4

collision_l_1:	addiu $a0, $a0, 40
		j collision_score	
collision_l_2:	addiu $a0, $a0, 90
		j collision_score
collision_l_3:	addiu $a0, $a0, 150
		j collision_score
collision_l_4:	addiu $a0, $a0, 300
		j collision_score
collision_score:sh $a0, 0($t8)
		sb $zero, CONSUMED
		
		li $t0, 200
		div $a0, $t0
		mflo $t0
		
		li $t1, 50
		mult $t0, $t1
		mflo $t0
		
		la $t1, CYCLE_BASE
		lw $t1, 0($t1)
		sub $t0, $t1, $t0
		
		la $t1, CYCLE_TIME
		lw $t2, 0($t1)
		bge $t0, $t2, no_level
		sw $t0, 0($t1)
		
no_level:	addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal write_score 
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
collision_end:	jr $ra

game_end:	li $a0, 0
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal game_over
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		li $s2, 0xFFFFFFFF
		
		jr $ra

#################################################################################################
sys_time: 	li $v0, 30         		#seta o codigo do syscall para system time
		syscall				#chamada do systema para colocar o tempo do sistema no registrador a0
		addiu $v0, $a0, 0		#coloca o valor do retorno no registrador v0
		jr $ra

#################################################################################################
rand7: 		li $v0, 30         		#seta o codigo do syscall para system time
		syscall				#chamada do sistema para setar a seed em a0
		li $v0, 41         		#seta o codigo do syscall para random int	
		syscall				#chamada do sistema para colocarum numero aleatorio no registrador a0

		sll $a0, $a0, 29		#isola os 3 bits menos significativos
		srl $a0, $a0, 29		#isola os 3 bits menos significativos

		beqz $a0, rand7			#checa se o numero aleatorio gerado é diferente de 0
		addiu $v0, $a0, 0		#coloca o numero gerado no registrador v0 acrescido de 1
		jr $ra
		
#################################################################################################
######### $a0 = x, $a1 = y, $a2 = tipo, $a3 = rotacao | positivo/negativo 
#################################################################################################
plot_piece: 	li $t1, SIDE
		mult $a0, $t1			#calcula a posicao x da peca considerando o tamanho do quadrado
		mflo $a0
		andi $t0, $s7, 0x00FF0000
		srl $t0, $t0, 16		#offset da peca x
		add $a0, $a0, $t0
		andi $t0, $s7, 0x000000FF
		mult $t0, $s3
		mflo $t0
		add $a0, $a0, $t0
		mult $a1, $t1			#calcula posicao y da peca considerando o tamanho do quadrado
		mflo $a1
		addiu $a1, $a1, OFFSET_Y1	#adiciona offset de inicio da area de jogo

		addi $sp, $sp, -20
		sw $ra, 16($sp)
		sw $a0, 12($sp)
		sw $a1, 8($sp)
		sw $a2, 4($sp)
		sw $a3, 0($sp)
		jal plot 			#plota o negativo da peca antiga (para apagar os vestigios dela)
		lw $a3, 0($sp)
		lw $a2, 4($sp)
		lw $a1, 8($sp)
		lw $a0, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		
		jr $ra
		
#################################################################################################
######### A rotina abaixo plota uma peça. Recebe como argumento a localização (x,y), 
######### o tipo da peça, a rotação, e o tipo de cor (branca ou colorida).
#################################################################################################												
plot:		addi $sp, $sp, -16	# Salva os argumentos na pilha
		sw $a3, 12($sp)
		sw $a2, 8($sp)
		sw $a1, 4($sp)
		sw $a0, 0($sp)

		sll $t3, $a3, 31	# Extrai o bit de codificacao da cor 
		srl $t3, $t3, 31	# Extrai o bit de codificacao da cor
		srl $a3, $a3, 1	 	# Remove bit de codificacao
		addi $t6, $a2, -1	# Decrementa tipo
		sll $t6, $t6, 3		# Calcula o offset do endereco da matriz a ser utilizada
		sll $a3, $a3, 1		# (offset = 8*tipo_peça + 2*rotação)
		add $t6, $t6, $a3		

		la $t7, L0		# Carrega endereço inicial das matrizes das peças
		add $t7, $t7, $t6	# Faz end = end_inicial + offset
		
		lhu $t6, 0($t7)		# Carrega a matriz a ser utilizada
		li $t2, 4		# Tamanho da matriz
		move $t7, $zero		# Inicializa i
		move $t0, $zero		# Inicializa contador
		
		# Os blocos abaixo definem a cor do plot
		beqz $t3, color_black
		beqz $a2, sai_plot0
		beq $a2, 1, color_orange
		beq $a2, 2, color_cyan
		beq $a2, 3, color_blue
		beq $a2, 4, color_purple
		beq $a2, 5, color_green
		beq $a2, 6, color_red
		beq $a2, 7, color_yellow

color_red:	li $a3, RED
		j loop_plot0

color_cyan:	li $a3, CYAN
		j loop_plot0
	
color_green:	li $a3, GREEN
		j loop_plot0
		
color_yellow:	li $a3, YELLOW
		j loop_plot0

color_blue:	li $a3, DARK_BLUE
		j loop_plot0
	
color_purple:	li $a3, PURPLE
		j loop_plot0
		
color_orange:	li $a3, ORANGE
		j loop_plot0
		
color_black:	li $a3, BLACK
				
# Loop de plot da matriz
loop_plot0:	beq $t0, $t2, sai_plot0		# Se i = 4, sai
		move $t1, $zero			# Inicializa j
		
loop_plot1:	beq $t1, $t2, sai_plot1		# Se j = 4, sai
		
		sllv $t5, $t6, $t7		# Extrai o bit na posição (i,j) da matriz
		sll $t5, $t5, 16
		srl $t5, $t5, 31
		
		beq $t5, $zero, pass0		# Se bit = 0, pula o proximo bloco
	
		addi $sp, $sp, -16		# Salva na pilha as variáveis que estão sendo utilizadas
		sw $ra, 12($sp)
		sw $t0, 8($sp)
		sw $t1, 4($sp)
		sw $t2, 0($sp)
		  
		jal plot_square			# Plota quadrado 
		
		lw $t2, 0($sp)			# Recupera as variáveis temporárias da pilha
		lw $t1, 4($sp)
		lw $t0, 8($sp)
		lw $ra, 12($sp)
		addi $sp, $sp, 16
		
pass0:		addi $t1, $t1, 1		# Incrementa j
		addi $a0, $a0, SIDE		# Incrementa posição de plot em x
		addi $t7, $t7, 1		# Incrementa contador
		j loop_plot1
		
sai_plot1:	addi $t0, $t0, 1		# Incrementa i
		addi $a1, $a1, SIDE		# Incrementa posição de plot em y
		addi $a0, $a0, -28		# Volta para a posição inicial de plot em x
		j loop_plot0
		
sai_plot0:	lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		addi $sp, $sp, 16
		jr $ra
		
#################################################################################################
######### A rotina abaixo plota uma linha da matriz de jogo. Recebe como argumento a 
######### linha que vai ser plotada e o player.
#################################################################################################												
plot_line:	addi $sp, $sp, -16	# Salva os argumentos na pilha
		sw $a3, 12($sp)
		sw $a2, 8($sp)
		sw $a1, 4($sp)
		sw $a0, 0($sp)

		li $t8, 88
		mult $t8, $s3
		mflo $t8

		sll $t0, $a0, 2
		la $t9, LINE_1_0
		addu $t9, $t9, $t8
		add $t0, $t0, $t9	# endereco da linha a ser plotada
		lw $t0, 0($t0)		# carrega a linha a ser plotada
		
		andi $t3, $s7, 0x00FF0000
		srl $t3, $t3, 16
		andi $t4, $s7, 0x000000FF
		mult $t4, $s3
		mflo $t4
		add $t3, $t3, $t4
		
		addi $t4, $zero, SIDE	# calcula a posição da linha em y
		mult $t4, $a0
		mflo $t4
		addi $a1, $t4, PAR_Y0
		
		move $t1, $zero		# inicializa o contador de pixels
loop_line:	bge $t1, 70, end_line
		andi $t2, $t0, 0x07
		srl $t0, $t0, 3
		
		beq $t2, $zero, lcolor_black
		beq $t2, 1, lcolor_orange
		beq $t2, 2, lcolor_cyan
		beq $t2, 3, lcolor_blue
		beq $t2, 4, lcolor_purple
		beq $t2, 5, lcolor_green
		beq $t2, 6, lcolor_red
		beq $t2, 7, lcolor_yellow
		
lcolor_black:	li $a3, BLACK
		j loop_plot_line

lcolor_red:	li $a3, RED
		j loop_plot_line

lcolor_cyan:	li $a3, CYAN
		j loop_plot_line
	
lcolor_green:	li $a3, GREEN
		j loop_plot_line
		
lcolor_yellow:	li $a3, YELLOW
		j loop_plot_line

lcolor_blue:	li $a3, DARK_BLUE
		j loop_plot_line
	
lcolor_purple:	li $a3, PURPLE
		j loop_plot_line
		
lcolor_orange:	li $a3, ORANGE
		
loop_plot_line:	addi $sp, $sp, -24		# Salva na pilha as variáveis que estão sendo utilizadas
		sw $a0, 20($sp)
		sw $ra, 16($sp)
		sw $t0, 12($sp)
		sw $t1, 8($sp)
		sw $t2, 4($sp)
		sw $t3, 0($sp)
		add $a0, $t3, $t1
		 
		jal plot_square			# Plota quadrado 
		
		lw $t3, 0($sp)
		lw $t2, 4($sp)			# Recupera as variáveis temporárias da pilha
		lw $t1, 8($sp)
		lw $t0, 12($sp)
		lw $ra, 16($sp)
		lw $a0, 20($sp)
		addi $sp, $sp, 24
		
		addi $t1, $t1, SIDE
		j loop_line
			
end_line:	lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		addi $sp, $sp, 16

		jr $ra
		
#################################################################################################
######### A rotina abaixo plota uma matriz de jogo. Recebe como argumentos
######### $a0 = endereco da linha inicial, $a1 = jogador (0 a 3), $a2 = endereco da linha final
#################################################################################################	
plot_matrix:	bgt $a0, $a2, fim_plot_mat
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal plot_line
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addi, $a0, $a0, 1
		j plot_matrix
		
fim_plot_mat:	jr $ra

#################################################################################################
######### A rotina abaixo plota um quadrado 7x7 pixels. Recebe como argumento  
######### a localização (x,y) e a cor.
#################################################################################################		
plot_square:	sgtu $t5, $a1, 43
		andi $s5, $s7, 0xF0000000
		srl $s5, $s5, 28
		or $t5, $s5, $t5
		beqz $t5, saix	# impede de imprimir quadrado fora do campo
		li $t5, PAR_Y0		# Posição inicial da tela de jogo em Y
		li $t2, SIDE		# Lado do quadrado l
		addi $t2, $t2, -1	# l = l - 1
		
		li $t0, 1		# count_x = 1
loopx:		beq $t0, $t2, saix	# se count_x = l, sai
		li $t1, 1		# count_y = 1
		add $t3, $t0, $a0	# x = count_x + x_inicial
loopy:		beq $t1, $t2, saiy	# se count_y = l, sai
		add $t4, $t1, $a1	# y = count_y + y_inicial
		
		sgt $t5, $t4, $t5	# se y está fora área de jogo, não plota
		or $t5, $s5, $t5
		beq $t5, $zero, pass_sq
		li $t9, NUMX		
		mult $t4, $t9		# y*320
		mflo $t4
		add $t4, $t4, $t3	# y*320 + x
		addi $t4, $t4, VGA	# endereço inicial + offset calculado
		sb $a3, 0($t4)		# plota um pixel na tela
pass_sq:	addi $t1, $t1, 1	# incrementa o contador de y
		j loopy
saiy:		add $t0, $t0, 1		# incrementa o contador de x
		j loopx
saix:		jr $ra	


#################################################################################################
######### A rotina abaixo plota a prima peça que vai descer. Recebe en $a2 e $a3 o tipo da
######### peça e a rotação.
#################################################################################################
plot_prox:	ori $s7, $s7, 0x10000000
		andi $t0, $s7, 0x000000FF
		andi $t1, $s7, 0x00FF0000
		srl $t1, $t1, 16
		mult $t0, $s3
		mflo $t0
		add $a0, $t0, $t1
		add $a0, $a0, 21
		li $a1, 15
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal plot
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		andi $s7, $s7, 0x0FFFFFFF
		jr $ra

#################################################################################################
######### A rotina abaixo plota o ambiente do jogo.
#################################################################################################		
show_initial: 	addi $sp, $sp, -20
		sw $ra, 16($sp)
		sw $a3, 12($sp)
		sw $a2, 8($sp)
		sw $a1, 4($sp)
		sw $a0, 0($sp)
		
		#li $a0, WHITE			# Limpa a tela
		#li $v0, 48
		#syscall
		
		#lw $a0, 0($sp)
		
		move $t3, $zero			# Inicializa fim_plot_x
		li $a3, BLACK			# Cor do fundo
		move $t0, $a0			# x_inicial = início da área de jogo em x
		move $t2, $a0			# início da área de jogo em x
loop0:		li $t9, NUMX			# tamanho_x
		sub $t5, $t9, $t2		# limite_x
		sgt $t5, $t0, $t5		# se x > limite_x, sai
		bne $t5, $zero, sai0
		add $t3, $t3, $t2		# fim_plot_x = x_inicial + largura_area_jogo
		addi $t3, $t3, PAR_X1 
loop1:		bge $t0, $t3, sai1		# se x >= fim_plot_x, sai
		li $t1, PAR_Y0			# y_inicial = inicio da area de jogo em y
		addi $t5, $t1, PAR_Y1		# fim_plot_y = y_inicial + altura da área de jogo
loop2:		bge $t1, $t5, sai2		# se y >= fim_plot_y, sai
		mult $t1, $t9 			# y*320
		mflo $t4
		add $t4, $t4, $t0		# y*320 + x
		addi $t4, $t4, VGA		# endereço inicial + offset calculado
		sb $a3, 0($t4)			# plota um pixel na tela
		addi $t1, $t1, 1		# incrementa o contador
		j loop2
		
sai2:		addi $t0, $t0, 1		# incrementa x 
		j loop1
		
sai1:		add $t0, $t0, $t2		# x_inicial da próxima área de jogo
		j loop0

# Os blocos seguintes plotam os placares
sai0:		li $a2, PAR_Y0			# pos_y = inicio_area_jogo_y + altura_area_jogo + lado_quadrado 
		addi $a2, $a2, PAR_Y1		
		addi $a2, $a2, SIDE
		
		li $t1, NUMX			# fim_x
		andi $t2, $s7, 0x00FF0000	# limite_x
		srl $t2, $t2, 16
		sub $t0, $t1, $t2		
		andi $t1, $s7, 0x00FF0000	# x_inicial = inicio_area_jogo_x
		srl $t1, $t1, 16
		addi $t1, $t1, SIDE
		addi $t1, $t1, SIDE
		
		add $s3, $zero, $zero
loop_score:	bge $t1, $t0, sai_score		# se x >= limite_x, sai
		la $a0, PTS			# carrega string 'Score'
		move $a1, $t1			# plota string
		li $a3, 0xFE00
		li $v0, 104
		syscall
		andi $t3, $s7, 0x000000FF	# x = x + shift_x
		add $t1, $t1, $t3
		
		addi $sp, $sp, -20
		sw $ra, 16($sp)
		sw $a0, 12($sp)
		sw $a1, 8($sp)
		sw $t0, 4($sp)
		sw $t1, 0($sp)
		add $a0, $zero, $zero
		jal write_score			#plota o negativo da peca antiga (para apagar os vestigios dela)
		lw $t1, 0($sp)
		lw $t0, 4($sp)
		lw $a1, 8($sp)
		lw $a0, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		
		addiu $s3, $s3, 1
		j loop_score
		
sai_score:	add $s3, $zero, $zero
		lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		
		############################################### Plota espaço para a próxima peça
		move $t3, $zero			# Inicializa fim_plot_x
		li $a3, BLACK			# Cor do fundo
		move $t0, $a0			# x_inicial = início da área de jogo em x
		andi $t7, $s7, 0x000000FF	# offset
		andi $t8, $s7, 0x0F000000
		srl $t8, $t8, 24		# número de jogadores
		move $t2, $a0			# início da área de jogo em x
		
		move $t6, $zero
		addi $t2, $t2, 21
loop00:		beq $t6, $t8, sai00
		move $t0, $t2
		addi $t3, $t2, 28		# fim_plot_x = x_inicial + largura_area_jogo 
loop01:		bgt $t0, $t3, sai01		# se x >= fim_plot_x, sai
		li $t1, 15			# y_inicial = inicio da area de jogo em y
		li $t5, 43			# fim_plot_y = y_inicial + altura da área de jogo
loop02:		bge $t1, $t5, sai02		# se y >= fim_plot_y, sai
		mult $t1, $t9 			# y*320
		mflo $t4
		add $t4, $t4, $t0		# y*320 + x
		addi $t4, $t4, VGA		# endereço inicial + offset calculado
		sb $a3, 0($t4)			# plota um pixel na tela
		addi $t1, $t1, 1		# incrementa o contador
		j loop02
		
sai02:		addi $t0, $t0, 1		# incrementa x 
		j loop01
		
sai01:		add $t2, $t2, $t7		# x_inicial da próxima área de jogo
		addi $t6, $t6, 1
		j loop00

sai00:		jr $ra
		
#################################################################################################
######### Atualiza a pontuação de um jogador. Recebe como argumento em $a0 a pontuação
#################################################################################################		
write_score:	addi $sp, $sp, -16		# salva os argumentos na pilha 
		sw $a3, 12($sp)
		sw $a2, 8($sp)
		sw $a1, 4($sp)
		sw $a0, 0($sp)

		li $a2, PAR_Y0			# inicio da área de jogo em y
		addi $a2, $a2, PAR_Y1		# y_inicial = inicio_área_jogo_y + altura_área_jogo + 3*lado_quadrado
		addi $a2, $a2, SIDE	
		addi $a2, $a2, SIDE
		addi $a2, $a2, SIDE
		
		andi $t2, $s7, 0x00FF0000	# inicio_x = inicio da área de jogo em x
		srl $t2, $t2, 16
		li $t1, NUMX			# fim_x = 320
		sub $t0, $t1, $t2		# limite_x = 320 - inicio_area_jogo_x

		andi $t3, $s7, 0x000000FF	# shift_x
		mult $s3, $t3
		mflo $t3			# shift_x * nro_jogadores
		add $t2, $t2, $t3		# pos_x = inicio_x + shift_x * nro_jogadores + 3 * lado_quadrado
		addi $t2, $t2, SIDE
		addi $t2, $t2, SIDE
		addi $t2, $t2, SIDE
		move $a1, $t2
		li $a3, 0xFE00
		li $v0, 101
		syscall				# plota a pontuação na tela do jogador
		
passa_wscore:	lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		addi $sp, $sp, 16
		
		
		jr $ra


#################################################################################################
######### Plota game over
#################################################################################################
game_over:	andi $t0, $s7, 0x00FF0000
		srl $t0, $t0, 16
		andi $t1, $s7, 0x000000FF
		mult $t1, $s3
		mflo $t1
		add $t0, $t0, $t1
		addi, $t0, $t0, -1

		la $a0, GAME_OVER
		move $a1, $t0
		addi $a2, $zero, PAR_Y0
		addi $a2, $a2, 63
		li $a3, 0x00FF
		li $v0, 104
		syscall
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal play_lost_game
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra

#################################################################################################
######### Toca uma nota da música
#################################################################################################
play_music:	li $v0,31 #syscall 31 - assíncrono
		la $a1,DURATION #duracao
		lbu $a1,1($a1)

		#Instrumento
		la $a2,1
		lbu $a2,0($a2)

		#volume
		la $a3,VOLUME
		lbu $a3,0($a3)

		#registrador para saber onde esta a musica
		lw $t0, MUSIC_POSITION

		la $a0,BEEP + 0($t0)
		lbu $a0,0($a0)
		syscall #beep
		beq $t0,36,reset_music #36 notas
		addi $t0,$t0,1 #pula pro proximo beep

		sw $t0, MUSIC_POSITION
		
		jr $ra
		
reset_music:	sw $zero, MUSIC_POSITION #volta musica pro beep 0
		jr $ra

#################################################################################################
######### Toca um beep quando uma linha é fechada
#################################################################################################
play_break_line:#syscall 33 - síncrono
	        li $v0,33

		#duracao
		la $a1, DURATION
		lbu $a1,1($a1)

		#Instrumento
		la $a2,1
		lbu $a2,0($a2)

		#volume
		la $a3, VOLUME
		lbu $a3,0($a3)

		la $a0, 50
		lbu $a0,0($a0)
		syscall #beep

		la $a0, 60
		lbu $a0, 0($a0)
		syscall #beep
	
		jr $ra

#################################################################################################
######### Toca um beep quando alguém perde
#################################################################################################
play_lost_game:#syscall 33 - síncrono
	        li $v0,33

		#duracao
		la $a1, DURATION
		lbu $a1,1($a1)

		#Instrumento
		la $a2,1
		lbu $a2,0($a2)

		#volume
		la $a3, VOLUME
		lbu $a3,0($a3)

		la $a0, 48
		lbu $a0,0($a0)
		syscall #beep

		la $a0, 43
		lbu $a0, 0($a0)
		syscall #beep
		
		la $a0, 40
		lbu $a0, 0($a0)
		syscall #beep
		
		la $a0, 43
		lbu $a0, 0($a0)
		syscall #beep
		
		la $a0, 36
		lbu $a0, 0($a0)
		syscall #beep
	
		jr $ra
