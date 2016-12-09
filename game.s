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

# Pecas iniciais
.eqv INIT_PIECE 0x600

# Offset players
.eqv OFFSET_X1 125
.eqv OFFSET_Y1 29

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

#TODO: Setar a matriz do jogo na memoria

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
		
pass_main:	lw $s7, 0($t0)		# Carrega parâmetros da memória
		andi $a0, $s7, 0x00FF0000
		srl $a0, $a0, 16
		andi $a1, $s7, 0x0000FF00
		srl $a1, $a1, 8
		andi $a2, $s7, 0x000000FF
		li $a3, NUMX
		jal show_initial	# Plota tela inicial de jogo
		
		lw $s6, SCORE12		# Carrega da memória as pontuações dos jogadores
		lw $s5, SCORE34
		andi $a0, $s6, 0xFFFF0000
		srl $a0, $a0, 16
		li $a1, 0
		jal write_score		# Escreve a pontuação do jogador 1


game_loop:	jal sys_time			#pega o tempo do sistema em ms
		addiu $s1, $v0, 0		#coloca o tempo do sistema no registrador s1
		
		bne $s2, $zero, continue_gl0 	#checa se tem uma peca movel em jogo
		jal rand7			#se sim, randomiza o tipo da peca	
		li $s2, INIT_PIECE		#inicializa uma nova peca
		addiu $s2, $s2, 1
		addu $s2, $s2, $v0		#seta o tipo da peca
		li $s0, 501			#acumula tempo suficiente pra ciclo

continue_gl0:	jal keyboard      		# verifica teclado por uma tecla
		beq $v0, 119, rotate		# verifica se a tecla de rotacao (w) foi pressionada
		beq $v0, 879, rotate		# verifica se a tecla de rotacao (W) foi pressionada
		j continue_gl1			# se a rotacao nao foi pressionada, continua sem rotacionar
		
rotate:		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal set_arguments 		#seta os argumentos com os valores relativos a peca
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addiu $a1, $a1, 1		#incrementa a posicao y da peca e coloca no registrador a1
		sll $a3, $a3, 1			#da shift de 1 para esquerda pois o primeiro bit simboliza o tipo do plot

		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal plot_piece			#plota negativo da peca com valores antigos
		lw $ra, 0($sp)
		addi $sp, $sp, 4

		addiu $s2, $s2, 16384		#incrementa rotacao
		sll $s2, $s2, 16
		srl $s2, $s2, 16
				
		addiu $a3, $a3, 3		#nova rotacao com plot positivo
		sll $a3, $a3, 29
		srl $a3, $a3, 29
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal plot			#plota positivo da peca
		lw $ra, 0($sp)
		addi $sp, $sp, 4

continue_gl1:	ble $s0, 300, continue_gl2	#checa se há tempo acumulado suficiente para o ciclo de movimento da peca
		jal cycle			#se sim, chama a rotina cycle

continue_gl2:	jal sys_time			#pega o tempo do sistema em ms
		subu $t0, $v0, $s1		#calcula o tempo que o ciclo demorou
		addu $s0, $s0, $t0		#incrementa o acumulador de tempo
		j game_loop			#volta para o inicio do loop

#################################################################################################
input:		
		jr $ra
#################################################################################################

keyboard:	la $t1,0xFF100000
		lw $t0,0($t1)
		andi $t0,$t0,0x0001		# Le bit de Controle Teclado
   		beq $t0,$zero, keyboard_end   	# Se nao ha tecla pressionada, finaliza
  		lw $v0,4($t1)  			# Tecla lida
		sw $v0,12($t1)  		# escreve no display de texto
	
keyboard_end:	jr $ra

#################################################################################################
cycle:		addu $s0, $zero, $zero		#reseta o acumulador de tempo

		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal set_arguments 		#seta os argumentos com os valores relativos a peca
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addiu $a1, $a1, 1		#incrementa a posicao y da peca e coloca no registrador a1
		bgtu $a1, 20, hitted_bottom	#se a peca chegou ao chao, vai para hitted bottom
		
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
		bnez  $v0, collision		#se houver colisao, vai para collision
		
		subiu $t1, $a1, 1		#coloca posicao y anterior em t1
		sll $t2, $t1, 3 		#coloca a posicao y antiga da peca nos bits certos da abstracao
		subu $t2, $s2, $t2		#remove a posicao y antiga da peca
		sll $t3, $a1, 3 		#coloca a posicao y nova da peca nos bits certos da abstracao
		addu $s2, $t2, $t3		#atualiza a peca na posicao certa
		
		sll $a3, $a3, 1			#da shift de 1 para esquerda pois o primeiro bit simboliza o tipo do plot
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal plot_piece			#plota negativo da peca com valores antigos
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addiu $a1, $a1, SIDE		#seta a nova posicao y da peca com offset
		addiu $a3, $a3, 1 		#seta os bits do plot como positivo
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal plot			#plota o positivo da peca nova 
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra				
	
#-----------------------------------------------------------------------------------------------#
collision: 	#TODO: implementar casos de colisao
		addu $s2, $zero, $zero
		jr $ra
		
#-----------------------------------------------------------------------------------------------#
hitted_bottom: 	#TODO: colocar s2 na matriz
		addu $s2, $zero, $zero
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
plot_piece: 	mul $a0, $a0, SIDE		#calcula a posicao x da peca considerando o tamanho do quadrado
		addiu $a0, $a0, OFFSET_X1	#offset da peca x
		mul $a1, $a1, SIDE		#calcula posicao y da peca considerando o tamanho do quadrado
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
		beqz $t3, color_black
		beqz $a2, color_red
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
######### A rotina abaixo plota um quadrado 7x7 pixels. Recebe como argumento  
######### a localização (x,y) e a cor.
#################################################################################################		
plot_square:	bleu $a1, 43, saix	# impede de imprimir quadrado fora do campo
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
collision_check: #TODO: implementar o teste de colisao
		addu $v0, $zero, $zero		#TODO: implementar correto valor para v0
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

		li $t0, 6			#da load no numero 8
		bge $a0, $t0, rand7		#checa se o numero aleatorio gerado é maior que 6, se sim gera o nome de novo
		addiu $v0, $a0, 0		#coloca o numero gerado no registrador v0
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
loop_score:	bge $t1, $t0, sai_score		# se x >= limite_x, sai
		la $a0, PTS			# carrega string 'Score'
		move $a1, $t1			# plota string
		li $a3, 0xFF00
		li $v0, 104
		syscall
		andi $t3, $s7, 0x000000FF	# x = x + shift_x
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
		mult $a1, $t3
		mflo $t3			# shift_x * nro_jogadores
		add $t2, $t2, $t3		# pos_x = inicio_x + shift_x * nro_jogadores + 3 * lado_quadrado
		addi $t2, $t2, SIDE
		addi $t2, $t2, SIDE
		addi $t2, $t2, SIDE
		move $a1, $t2
		li $a3, 0xFF00
		li $v0, 101
		syscall				# plota a pontuação na tela do jogador
		
passa_wscore:	lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		addi $sp, $sp, 16
		
		jr $ra
