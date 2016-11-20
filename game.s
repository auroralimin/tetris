.eqv VGA 0xFF000000
.eqv NUMX 320
.eqv NUMY 240

# Parameters 1P 
.eqv PAR_1P_X0 125
.eqv PAR_1P_X1 70
.eqv PAR_1P_Y0 50
.eqv PAR_1P_Y1 140

# Parameters 2P 
.eqv PAR_2P_X0 60
.eqv PAR_2P_X1 70
.eqv PAR_2P_Y0 50
.eqv PAR_2P_Y1 140

# Parameters 3P 
.eqv PAR_3P_X0 28
.eqv PAR_3P_X1 70
.eqv PAR_3P_Y0 50
.eqv PAR_3P_Y1 140

# Parameters 4P 
.eqv PAR_4P_X0 8
.eqv PAR_4P_X1 70
.eqv PAR_4P_Y0 50
.eqv PAR_4P_Y1 140

# Lado do quadrado
.eqv SIDE 7

# Cores
.eqv BLACK 0x00
.eqv RED 0x0F
.eqv BLUE 0xF0
.eqv DARK_BLUE 0x8A
.eqv PINK 0x86
.eqv WHITE 0xFF
.eqv GREEN 0x30
.eqv DARK_RED 0x03
.eqv YELLOW 0x37
.eqv ORANGE 0x27
.eqv DARK_GREEN 0x18

# Pecas iniciais
.eqv INIT_PIECE 0x600

.data

#TODO: Setar a matriz do jogo na memoria

.text
MAIN: 		li $a0, NUMX
		li $a1, NUMY
		li $a2, BLACK
		li $s0, VGA
		jal show_initial

game_loop:	jal sys_time			#pega o tempo do sistema em ms
		addiu $s1, $v0, 0		#coloca o tempo do sistema no registrador s1
		
		bne $s2, $zero, continue_gm0 	#checa se tem uma peca movel em jogo
		jal rand7			#se sim, randomiza o tipo da peca	
		li $s2, INIT_PIECE		#inicializa uma nova peca
		#addu $s2, $s2, $v0		#seta o tipo da peca

continue_gm0:	#TODO: carregar registrador do input
		#checar se existe novo input
		#se existir, chama rotina input

continue_gm1:	bgt $s0, 2000, continue_gm2	#checa se há tempo acumulado suficiente para o ciclo de movimento da peca
		jal cycle			#se sim, chama a rotina cycle

continue_gm2:	jal sys_time			#pega o tempo do sistema em ms
		subu $t0, $v0, $s0		#calcula o tempo que o ciclo demorou
		addu $s0, $s0, $t0		#incrementa o acumulador de tempo
		j game_loop			#volta para o inicio do loop

###########################################################################
input:		
		jr $ra

###########################################################################
cycle:		addu $s0, $zero, $zero		#reseta o acumulador de tempo

		srl $t0, $s2, 3			#remove o tipo da peca da abstracao de peca
		sll $a0, $s2, 29		#isola o tipo da peca no registrador a0 (mais significativo)
		srl $a0, $a0, 29		#isola o tipo da peca no registrador a0 (menos significativo)
		
		sll $t1, $t0, 23		#isola a posicao y da peca no registrador t1 (mais significativo)
		sll $t1, $t1, 23		#isola a posicao y da peca no registrador t1 (menos significativo)
		addiu $a2, $t1, 1		#incrementa a posicao y da peca e coloca no registrador a2
		srl $t0, $t0, 6			#remove a posicao y da peca da abstracao de peca
		
		bgt $a2, 20, hitted_bottom	#se a peca chegou ao chao, vai para hitted bottom
		
		sll $a1, $t0, 18		#isola a posicao x da peca no registrador a1 (mais significativo)
		sll $a1, $a1, 18		#isola a posicao x da peca no registrador a1 (menos significativo)
		srl $a3, $t0, 5			#isola a rotacao da peca
		
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
		
		sll $t2, $t1, 3 		#coloca a posicao y antiga da peca nos bits certos da abstracao
		subu $t2, $s2, $t2		#remove a posicao y antiga da peca
		sll $t3, $a2, 3 		#coloca a posicao y nova da peca nos bits certos da abstracao
		addu $s2, $t2, $t3		#atualiza a peca na posicao certa
		
		sll $a0, $a0, 1			#da shift de 1 para esquerda pois o primeiro bit simboliza se o plot é negativo
		addi $sp, $sp, -20
		sw $ra, 16($sp)
		sw $a0, 12($sp)
		sw $a1, 8($sp)
		sw $a2, 4($sp)
		sw $a3, 0($sp)
		jal plot 			#plota o positivo da posicao nova da peca
		lw $a3, 0($sp)
		lw $a2, 4($sp)
		lw $a1, 8($sp)
		lw $a0, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		
		addiu $a0, $a0, 1 		#seta o bit do plot como negativo
		addu $a2, $t1, $zero		#seta a posicao y da peca para a antiga
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		jal plot			#plota o negativo da peca antiga (para apagar os vestigios dela
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra				
	
#-------------------------------------------------------------------------#
collision: 	#TODO: implementar casos de colisao
		addu $s2, $zero, $zero
		jr $ra
		
#-------------------------------------------------------------------------#
hitted_bottom: 	#TODO: colocar s2 na matriz
		addu $s2, $zero, $zero
		jr $ra
		
###########################################################################
collision_check: #TODO: implementar o teste de colisao
		addu $v0, $zero, $zero		#TODO: implementar correto valor para v0
		jr $ra
	
###########################################################################
plot:		#TODO: Integrar com o codigo em graphic_display
		jr $ra

###########################################################################
sys_time: 	li $v0, 30         		#seta o codigo do syscall para system time
		syscall				#chamada do systema para colocar o tempo do sistema no registrador a0
		addiu $v0, $a0, 0		#coloca o valor do retorno no registrador v0
		jr $ra

###########################################################################
rand7: 		li $v0, 30         		#seta o codigo do syscall para system time
		syscall				#chamada do sistema para setar a seed em a0
		li $v0, 41         		#seta o codigo do syscall para random int	
		syscall				#chamada do sistema para colocarum numero aleatorio no registrador a0

		sll $a0, $a0, 29		#isola os 3 bits menos significativos
		srl $a0, $a0, 29		#isola os 3 bits menos significativos

		li $t0, 8			#da load no numero 8
		beq $a0, $t0, rand7		#checa se o numero aleatorio gerado é 8, se sim gera o nome de novo
		addiu $v0, $a0, 0		#coloca o numero gerado no registrador v0
		jr $ra

###########################################################################
show_initial: 	move $t0, $zero
		li $t2, PAR_1P_X1
		li $t3, PAR_1P_X0
	
loop0:		sgt $t5, $t0, $a0
		bne $t5, $zero, sai0
loop1:		beq $t0, $t3, sai1
		move $t1, $zero
loop2:		beq $t1, $a1, sai2
		mult $t1, $a0 		# y*320
		mflo $t4
		add $t4, $t4, $t0	# y*320 + x
		add $t4, $t4, $s0	# endereco
		sb $a2, 0($t4)		# plota pixel na tela
		addi $t1, $t1, 1	# incrementa contador
		j loop2
sai2:		addi $t0, $t0, 1
		j loop1
sai1:		addi $t0, $t0, PAR_1P_X1
		addi $t3, $t3, PAR_1P_X1
		addi $t3, $t3, PAR_1P_X0
		j loop0
sai0:		

		li $t3, PAR_1P_Y0
		move $t1, $zero
		
loop3:		sgt $t5, $t1, $a1
		bne $t5, $zero, sai3
loop4:		beq $t1, $t3, sai4		
		move $t0, $zero
loop5:		beq $t0, $a0, sai5
		mult $t1, $a0 		# y*320
		mflo $t4
		add $t4, $t4, $t0	# y*320 + x
		add $t4, $t4, $s0	# endereco
		sb $a2, 0($t4)		# plota pixel na tela
		addi $t0, $t0, 1	# incrementa contador
		j loop5
sai5:		add $t1, $t1, 1
		j loop4
sai4:		addi $t1, $t1, PAR_1P_Y1
		addi $t3, $t3, PAR_1P_Y1
		addi $t3, $t3, PAR_1P_Y0
		j loop3
sai3:		jr $ra

###########################################################################
