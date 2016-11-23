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
L0: .half 0x2e00, 0x88c0, 0xe800, 0xc440
I0: .half 0xf000, 0x8888, 0xf000, 0x8888
J0: .half 0x8e00, 0xc880, 0xe200, 0x44c0
T0: .half 0x4e00, 0x8c80, 0xe400, 0x4c40
S0: .half 0x8c40, 0x6c00, 0x8c40, 0x6c00
Z0: .half 0x4c80, 0xc600, 0x4c80, 0xc600
Q0: .half 0xcc00, 0xcc00, 0xcc00, 0xcc00
MSG0:.asciiz "Insira o numero de jogadores (1-4): "
PTS: .asciiz "Score"
PAR_4P: .half 8,29,78
PAR_3P:	.half 28,49,100
PAR_2P:	.half 60,81,130
PAR_1P:	.half 125,146,0
	  
.text
MAIN: 		li $s0, NUMX
		li $s1, NUMY
		li $s2, VGA
		li $s3, 0

		la $a0, MSG0
		li $a1, 3
		li $a2, 3
		li $a3, WHITE
		li $v0, 104
		syscall
		
		li $v0, 5
		syscall
		
		beq $v0, 4, P4
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
		
pass_main:	lh $a0, 0($t0)
		lh $a1, 2($t0)
		lh $a2, 4($t0)
		jal show_initial
		move $a3, $s3
		jal write_score
		
		li $a0, 15
		li $a1, PAR_Y0
		li $a2, 0
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
		
		li $a0, 43
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
		
		li $a0, 15
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
		
		li $a0, 43
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
		
		li $a1, 170
		li $a2, 6
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
plot_square:	li $t5, PAR_Y0
		li $t2, SIDE
		addi $t2, $t2, -1
		
saix6:		li $t0, 1
loopx:		beq $t0, $t2, saix
		li $t1, 1
		add $t3, $t0, $a0
loopy:		beq $t1, $t2, saiy
		add $t4, $t1, $a1
		
		sgt $t5, $t4, $t5
		beq $t5, $zero, pass_sq
		
		mult $t4, $s0 		# y*320
		mflo $t4
		add $t4, $t4, $t3	# y*320 + x
		add $t4, $t4, $s2	# endereço inicial + offset calculado
		sb $a3, 0($t4)		# plota um pixel na tela
pass_sq:	addi $t1, $t1, 1	# incrementa o contador
		j loopy
saiy:		add $t0, $t0, 1
		j loopx
saix:		jr $ra	

#################################################################################################
######### A rotina abaixo plota uma peça. Recebe como argumento a localização (x,y), 
######### o tipo da peça, a rotação, e o tipo de cor (branca ou colorida).
#################################################################################################												
plot:		addi $sp, $sp, -16
		sw $a3, 12($sp)
		sw $a2, 8($sp)
		sw $a1, 4($sp)
		sw $a0, 0($sp)

		li $t2, 4
		sll $a2, $a2, 1
		mult $a2, $t2
		mflo $t6
		sll $a3, $a3, 1
		add $t6, $t6, $a3		

		la $t7, L0
		add $t7, $t7, $t6
		
		lh $t6, 0($t7)
		
		move $t7, $zero	
		move $t0, $zero
		
		srl $t3, $a2, 4
		bne $t3, $zero, color_white
		beq $a2, $zero, color_red
		beq $a2, 2, color_blue
		beq $a2, 4, color_green
		beq $a2, 6, color_pink
		beq $a2, 8, color_orange
		beq $a2, 10, color_db
		beq $a2, 12, color_purple

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
		
loop_plot0:	beq $t0, $t2, sai_plot0
		move $t1, $zero
		
loop_plot1:	beq $t1, $t2, sai_plot1
		
		sllv $t5, $t6, $t7
		sll $t5, $t5, 16
		srl $t5, $t5, 31
		
		beq $t5, $zero, pass0
	
		addi $sp, $sp, -16
		sw $ra, 12($sp)
		sw $t0, 8($sp)
		sw $t1, 4($sp)
		sw $t2, 0($sp)
		  
		jal plot_square
		
		lw $t2, 0($sp)
		lw $t1, 4($sp)
		lw $t0, 8($sp)
		lw $ra, 12($sp)
		addi $sp, $sp, 16
		
pass0:		addi $t1, $t1, 1
		addi $a0, $a0, SIDE
		addi $t7, $t7, 1
		j loop_plot1
		
sai_plot1:	addi $t0, $t0, 1
		addi $a1, $a1, SIDE
		addi $a0, $a0, -28
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
show_initial: 	addi $sp, $sp, -16
		sw $a3, 12($sp)
		sw $a2, 8($sp)
		sw $a1, 4($sp)
		sw $a0, 0($sp)
		
		li $a0, WHITE
		li $v0, 48
		syscall
		
		lw $a0, 0($sp)
		
		move $t0, $zero
		li $t2, PAR_X1
		move $t3, $a0
		li $a3, BLACK
	
loop0:		sgt $t5, $t0, $s0
		bne $t5, $zero, sai0
		
loop1:		beq $t0, $t3, sai1
		move $t1, $zero
		
loop2:		slt $t4, $t1, $s1
		beq $t4, $zero, sai2
		mult $t1, $s0 		# y*320
		mflo $t4
		add $t4, $t4, $t0	# y*320 + x
		add $t4, $t4, $s2	# endereço inicial + offset calculado
		sw $a3, 0($t4)		# plota um pixel na tela
		addi $t1, $t1, 1	# incrementa o contador
		j loop2
		
sai2:		addi $t0, $t0, 1
		j loop1
		
sai1:		addi $t0, $t0, PAR_X1
		addi $t3, $t3, PAR_X1
		add $t3, $t3, $a0
		j loop0

sai0:		li $t3, PAR_Y0
		move $t1, $zero
		
loop3:		sgt $t5, $t1, $s1
		bne $t5, $zero, sai3
		
loop4:		beq $t1, $t3, sai4		
		move $t0, $zero
		
loop5:		beq $t0, $s0, sai5
		mult $t1, $s0 		# y*320
		mflo $t4
		add $t4, $t4, $t0	# y*320 + x
		add $t4, $t4, $s2	# endereço inicial + offset calculado
		sb $a3, 0($t4)		# plota um pixel na tela
		addi $t0, $t0, 1	# incrementa o contador
		j loop5
sai5:		add $t1, $t1, 1
		j loop4
		
sai4:		addi $t1, $t1, PAR_Y1
		addi $t3, $t3, PAR_Y1
		addi $t3, $t3, PAR_Y0
		j loop3
		
sai3:		move $a1, $a0
		la $a0, PTS
		li $a2, PAR_Y0
		addi $a2, $a2, PAR_Y1
		addi $a2, $a2, SIDE
		li $a3, WHITE
		li $v0, 104
		addi $a1, $a1, SIDE
		addi $a1, $a1, SIDE	
		syscall
		
		lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		addi $sp, $sp, 16
		
		jr $ra
		
write_score:	addi $sp, $sp, -16
		sw $a3, 12($sp)
		sw $a2, 8($sp)
		sw $a1, 4($sp)
		sw $a0, 0($sp)

		move $a1, $a0
		addi $a1, $a1, 28
		li $a2, PAR_Y0
		addi $a2, $a2, PAR_Y1
		addi $a2, $a2, SIDE
		addi $a2, $a2, SIDE
		addi $a2, $a2, SIDE
		move $a0, $a3
		li $a3, WHITE
		li $v0, 101
		syscall
		
		lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		addi $sp, $sp, 16
		
		jr $ra
