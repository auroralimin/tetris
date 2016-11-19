.eqv VGA 0xFF000000
.eqv NUMX 320
.eqv NUMY 240

# Parameters 1P 
.eqv PAR_1P_X0 125
.eqv PAR_1P_X1 70
.eqv PAR_1P_Y0 50
.eqv PAR_1P_Y1 140
.eqv PAR_1P_CENTER 146

# Parameters 2P 
.eqv PAR_2P_X0 60
.eqv PAR_2P_X1 70
.eqv PAR_2P_Y0 50
.eqv PAR_2P_Y1 140
.eqv PAR_2P_CENTER 81
.eqv PAR_2P_SHIFT 130

# Parameters 3P 
.eqv PAR_3P_X0 28
.eqv PAR_3P_X1 70
.eqv PAR_3P_Y0 50
.eqv PAR_3P_Y1 140
.eqv PAR_3P_CENTER 49
.eqv PAR_3P_SHIFT 100

# Parameters 4P 
.eqv PAR_4P_X0 8
.eqv PAR_4P_X1 70
.eqv PAR_4P_Y0 50
.eqv PAR_4P_Y1 140
.eqv PAR_4P_CENTER 29
.eqv PAR_4P_SHIFT 78


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

.data

.text
MAIN: 		li $s0, NUMX
		li $s1, NUMY
		li $s2, VGA
		li $s3, BLACK
		jal show_initial
		
		jal drop_I
		
		jal drop_O
		
		#jal drop_L
		
		#jal drop_J
		
		#jal drop_T
		
		#jal drop_Z
		
		#jal drop_S
		
		li $v0, 10
		syscall

show_initial: 	#li $a0, 0x0F
		#li $v0, 48
		#syscall
		
		move $t0, $zero
		li $t2, PAR_1P_X1
		li $t3, PAR_1P_X0
	
loop0:		sgt $t5, $t0, $s0
		bne $t5, $zero, sai0
loop1:		beq $t0, $t3, sai1
		move $t1, $zero
loop2:		beq $t1, $s1, sai2
		mult $t1, $s0 		# y*320
		mflo $t4
		add $t4, $t4, $t0	# y*320 + x
		add $t4, $t4, $s2	# endereco
		sb $s3, 0($t4)		# plota pixel na tela
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
		
loop3:		sgt $t5, $t1, $s1
		bne $t5, $zero, sai3
loop4:		beq $t1, $t3, sai4		
		move $t0, $zero
loop5:		beq $t0, $s0, sai5
		mult $t1, $s0 		# y*320
		mflo $t4
		add $t4, $t4, $t0	# y*320 + x
		add $t4, $t4, $s2	# endereco
		sb $s3, 0($t4)		# plota pixel na tela
		addi $t0, $t0, 1	# incrementa contador
		j loop5
sai5:		add $t1, $t1, 1
		j loop4
sai4:		addi $t1, $t1, PAR_1P_Y1
		addi $t3, $t3, PAR_1P_Y1
		addi $t3, $t3, PAR_1P_Y0
		j loop3
sai3:		jr $ra

drop_O:		li $a0, PAR_1P_CENTER
		li $a1, PAR_1P_Y0
		li $t9, 18
		move $t8, $zero

loop_dropO:	beq $t8, $t9, sai_dropO

		li $a3, GREEN

		addi $sp, $sp, -12
		sw $ra, 8($sp)
		sw $a0, 4($sp)
		sw $a1, 0($sp)
		
		jal plot_O
		
		lw $a1, 0($sp)
		lw $a0, 4($sp)
		lw $ra, 8($sp)
		addi $sp, $sp, 12
		
		li $a3, WHITE
		addi $a1, $a1, -7 
		
		addi $sp, $sp, -12
		sw $ra, 8($sp)
		sw $a0, 4($sp)
		sw $a1, 0($sp)
		
		jal plot_I
		
		lw $a1, 0($sp)
		lw $a0, 4($sp)
		lw $ra, 8($sp)
		addi $sp, $sp, 12
		
		bne $t8, $zero, pass0
		
		li $a3, BLACK 
		
		addi $sp, $sp, -12
		sw $ra, 8($sp)
		sw $a0, 4($sp)
		sw $a1, 0($sp)
		
		jal plot_I
		
		lw $a1, 0($sp)
		lw $a0, 4($sp)
		lw $ra, 8($sp)
		addi $sp, $sp, 12
				
pass0:		addi $a1, $a1, SIDE
		addi $a1, $a1, SIDE
		addi $t8, $t8, 1
		j loop_dropO
		
sai_dropO:	jr $ra


plot_O:		li $t2, 2

		move $t0, $zero
		move $t6, $a1
		
loopO0:		beq $t0, $t2, saiO0
		move $t1, $zero
		move $a1, $t6
loopO1:		beq $t1, $t2, saiO1
	
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
		
		addi $t1, $t1, 1
		addi $a1, $a1, SIDE
		j loopO1
saiO1:		addi $t0, $t0, 1
		addi $a0, $a0, SIDE
		j loopO0
saiO0:		jr $ra

drop_I:		li $a0, PAR_1P_CENTER
		li $a1, PAR_1P_Y0
		li $t9, 20
		move $t8, $zero

loop_dropI:	beq $t8, $t9, sai_dropI

		li $a3, PINK

		addi $sp, $sp, -12
		sw $ra, 8($sp)
		sw $a0, 4($sp)
		sw $a1, 0($sp)
		
		jal plot_I
		
		lw $a1, 0($sp)
		lw $a0, 4($sp)
		lw $ra, 8($sp)
		addi $sp, $sp, 12
		
		li $a3, WHITE
		addi $a1, $a1, -7 
		
		addi $sp, $sp, -12
		sw $ra, 8($sp)
		sw $a0, 4($sp)
		sw $a1, 0($sp)
		
		jal plot_I
		
		lw $a1, 0($sp)
		lw $a0, 4($sp)
		lw $ra, 8($sp)
		addi $sp, $sp, 12
		
		bne $t8, $zero, pass1
		
		li $a3, BLACK
		
		addi $sp, $sp, -12
		sw $ra, 8($sp)
		sw $a0, 4($sp)
		sw $a1, 0($sp)
		
		jal plot_I
		
		lw $a1, 0($sp)
		lw $a0, 4($sp)
		lw $ra, 8($sp)
		addi $sp, $sp, 12
		
pass1:		addi $a1, $a1, SIDE
		addi $a1, $a1, SIDE
		addi $t8, $t8, 1
		j loop_dropI
		
sai_dropI:	jr $ra

plot_I:		li $t2, 4

		move $t0, $zero
		
loopI0:		beq $t0, $t2, saiI0
	
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
		
		addi $t0, $t0, 1
		addi $a0, $a0, SIDE
		j loopI0
saiI0:		jr $ra	
		
plot_square:	move $t0, $zero
		li $t2, SIDE
loopx:		beq $t0, $t2, saix
		move $t1, $zero
		add $t3, $t0, $a0
loopy:		beq $t1, $t2, saiy
		add $t4, $t1, $a1
		mult $t4, $s0 		# y*320
		mflo $t4
		add $t4, $t4, $t3	# y*320 + x
		add $t4, $t4, $s2	# endereco
		sb $a3, 0($t4)		# plota pixel na tela
		addi $t1, $t1, 1	# incrementa contador
		j loopy
saiy:		add $t0, $t0, 1
		j loopx
saix:		jr $ra
		
