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
.eqv DARK_RED 0x03
.eqv RED 0x0F
.eqv ORANGE 0x2F
.eqv GREEN 0x30
.eqv YELLOW 0x37
.eqv DARK_BLUE 0x88
.eqv PINK 0x86
.eqv BLUE 0xF0
.eqv WHITE 0xFF
.eqv PURPLE 0xCC

.data
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

# Parametros dependentes do número de jogadores
PAR_4P: .word 0x00081D4E	# 4 jogadores
PAR_3P:	.word 0x001c3162	# 3 jogadores
PAR_2P:	.word 0x003C5182	# 2 jogadores
PAR_1P:	.word 0x007d92c3	# 1 jogador

# Pontuações
SCORE12: .word 0x00750000	# Jogador 1 (upper 2 bytes) e 2 (lower 2 bytes)
SCORE34: .word 0x00000000	# Jogador 3 (upper 2 bytes) e 4 (lower 2 bytes) 
	  
.text
MAIN:		la $a0, MSG0		# Pergunta quantidade de jogadores
		li $a1, 3
		li $a2, 3
		li $a3, 0xFF00
		li $v0, 104
		syscall
		
		li $v0, 5		# Le do teclado a quantidade de jogadores
		syscall
		
		beq $v0, 4, P4		# Seleciona os parametros dependentes do número de jogadores
		beq $v0, 3, P3
		beq $v0, 2, P2
		beq $v0, 1, P1
		
P4:		la $t0, PAR_4P 
		j pass_main
		
P3:		la $t0, PAR_3P
		j pass_main
		
P2:		la $t0, PAR_2P
		j pass_main
		
P1:		la $t0, PAR_1P
		
pass_main:	lw $s0, 0($t0)		# Carrega parâmetros da memória
		andi $a0, $s0, 0x00FF0000
		srl $a0, $a0, 16
		andi $a1, $s0, 0x0000FF00
		srl $a1, $a1, 8
		andi $a2, $s0, 0x000000FF
		li $a3, NUMX
		jal show_initial	# Plota tela inicial de jogo
		
		#################################
		########### TESTES ##############
		#################################
		
		lw $s1, SCORE12		# Carrega da memória as pontuações dos jogadores
		lw $s2, SCORE34
		andi $a0, $s1, 0xFFFF0000
		srl $a0, $a0, 16
		li $a1, 0
		jal write_score		# Escreve a pontuação do jogador 1
		
		li $a0, 15
		li $a1, PAR_Y0
		li $a2, 0
		li $a3, 0
		jal plot		# Plota a peça L em todas as rotações
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		
		li $a0, 43		# Plota a peça J em todas as rotações
		li $a1, PAR_Y0
		li $a2, 2
		li $a3, 0
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		
		li $a0, 43		# Plota a peça I em todas as rotações
		li $a1, 80
		li $a2, 1
		li $a3, 0
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		
		li $a0, 15		# Plota a peça T em todas as rotações
		li $a1, 110
		li $a2, 3
		li $a3, 0
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		
		li $a0, 15		# Plota a peça S em todas as rotações
		li $a1, 140
		li $a2, 4
		li $a3, 0
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		
		li $a0, 43		# Plota a peça Z em todas as rotações
		li $a1, 140
		li $a2, 5
		li $a3, 0
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		
		li $a0, 43		# Plota a peça Q em todas as rotações
		li $a1, 170
		li $a2, 0xE
		li $a3, 0
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		addi $a0, $a0, 78
		addi $a3, $a3, 1
		jal plot
		
		li $v0, 10
		syscall

#################################################################################################
######### A rotina abaixo plota um quadrado 7x7 pixels. Recebe como argumento  
######### a localização (x,y) e a cor.
#################################################################################################		
plot_square:	li $t5, PAR_Y0		# Posição inicial da tela de jogo em Y
		li $t2, SIDE		# Lado do quadrado l
		addi $t2, $t2, -1	# l = l - 1
		
		li $t0, 1		# count_x = 1
loopx:		beq $t0, $t2, saix	# se count_x = l, sai
		li $t1, 1		# count_y = 1
		add $t3, $t0, $a0	# x = count_x + x_inicial
loopy:		beq $t1, $t2, saiy	# se count_y = l, sai
		add $t4, $t1, $a1	# y = count_y + y_inicial
		
		sgt $t5, $t4, $t5	# se y está fora área de jogo, não plota
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
######### A rotina abaixo plota uma peça. Recebe como argumento a localização (x,y), 
######### o tipo da peça, a rotação, e o tipo de cor (branca ou colorida).
#################################################################################################												
plot:		addi $sp, $sp, -16	# Salva os argumentos na pilha
		sw $a3, 12($sp)
		sw $a2, 8($sp)
		sw $a1, 4($sp)
		sw $a0, 0($sp)

		srl $t3, $a2, 3		# Extrai o bit de codificacao da cor 
		andi $a2, $a2, 0x07	# Extrai os bits de codificacao da peca	
		sll $t6, $a2, 3		# Calcula o offset do endereco da matriz a ser utilizada
		sll $a3, $a3, 1		# (offset = 8*tipo_peça + 2*rotação)
		add $t6, $t6, $a3		

		la $t7, L0		# Carrega endereço inicial das matrizes das peças
		add $t7, $t7, $t6	# Faz end = end_inicial + offset
		
		lh $t6, 0($t7)		# Carrega a matriz a ser utilizada
		li $t2, 4		# Tamanho da matriz
		move $t7, $zero		# Inicializa i
		move $t0, $zero		# Inicializa contador
		
		# Os blocos abaixo definem a cor do plot
		bne $t3, $zero, color_white
		beq $a2, $zero, color_red
		beq $a2, 1, color_blue
		beq $a2, 2, color_green
		beq $a2, 3, color_pink
		beq $a2, 4, color_orange
		beq $a2, 5, color_db
		beq $a2, 6, color_purple

color_red:	li $a3, RED
		j loop_plot0

color_blue:	li $a3, BLUE
		j loop_plot0
	
color_green:	li $a3, GREEN
		j loop_plot0
		
color_pink:	li $a3, PINK
		j loop_plot0

color_db:	li $a3, DARK_BLUE
		j loop_plot0
	
color_purple:	li $a3, PURPLE
		j loop_plot0
		
color_orange:	li $a3, ORANGE
		j loop_plot0
		
color_white:	li $a3, WHITE
				
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
		andi $t2, $s0, 0x00FF0000	# limite_x
		srl $t2, $t2, 16
		sub $t0, $t1, $t2		
		andi $t1, $s0, 0x00FF0000	# x_inicial = inicio_area_jogo_x
		srl $t1, $t1, 16
		addi $t1, $t1, SIDE
		addi $t1, $t1, SIDE
loop_score:	bge $t1, $t0, sai_score		# se x >= limite_x, sai
		la $a0, PTS			# carrega string 'Score'
		move $a1, $t1			# plota string
		li $a3, 0xFF00
		li $v0, 104
		syscall
		andi $t3, $s0, 0x000000FF	# x = x + shift_x
		add $t1, $t1, $t3
		j loop_score
		
sai_score:	lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		
		jr $ra
		
#################################################################################################
######### Atualiza a pontuação de um jogador. Recebe como argumento em $a0 a pontuação e em
######### $a1 o código do jogador.
#################################################################################################
		
write_score:	addi $sp, $sp, -16	# salva os argumentos na pilha 
		sw $a3, 12($sp)
		sw $a2, 8($sp)
		sw $a1, 4($sp)
		sw $a0, 0($sp)

		li $a2, PAR_Y0		# inicio da tela de jogo em y
		addi $a2, $a2, PAR_Y1	# fim da tela de jogo em y
		addi $a2, $a2, SIDE
		addi $a2, $a2, SIDE
		addi $a2, $a2, SIDE
		
		li $t1, NUMX
		andi $t2, $s0, 0x00FF0000
		srl $t2, $t2, 16
		sub $t0, $t1, $t2
		addi $t1, $t1, SIDE
		addi $t1, $t1, SIDE
		addi $t1, $t1, SIDE

		andi $t2, $s0, 0x000000FF
		mult $a1, $t2
		mflo $t2
		add $t1, $t1, $t2
		move $a1, $t1
		li $a3, 0xFF00
		li $v0, 101
		syscall
		
passa_wscore:	lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		addi $sp, $sp, 16
		
		jr $ra
