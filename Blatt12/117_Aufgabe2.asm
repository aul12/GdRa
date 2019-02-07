# Strings
.data
redS: .asciiz "\n\tRot: "
greenS: .asciiz "\n\tGruen: "
yellowS: .asciiz "\n\tGelb: "
nsa: .asciiz "\nNord-Sued Auto: "
nsf: .asciiz "\nNord-Sued Fussgaenger: "
woa: .asciiz "\nWest-Ost Auto: "
wof: .asciiz "\nWest-Ost Fussgaenger: "
red: .word 1
yellow: .word 2
red_yellow: .word 3
green: .word 4

.text

main:	
	# 1. Phase: NSA=Rot, NSF=Gruen, WOA=Gruen, WOF=Rot, 12 Taktzyklen;
	lw $a0, red
	lw $a1, green
	lw $a2, green
	lw $a3, red
	jal set_ampel
	jal print
	li $a0, 12
	jal delay_ticks
	# 2. Phase: NSA=Rot, NSF=Rot, WOA=Gelb, WOF=Rot, 3 Taktzyklen;
	lw $a0, red
	lw $a1, red
	lw $a2, yellow 
	lw $a3, red
	jal set_ampel
	jal print
	li $a0, 3
	jal delay_ticks
	# 3. Phase: NSA=Rot, NSF=Rot, WOA=Rot, WOF=Rot, 2 Taktzyklen;
	lw $a0, red
	lw $a1, red
	lw $a2, red 
	lw $a3, red
	jal set_ampel
	li $a0, 2
	jal delay_ticks
	# 4. Phase: NSA=Rot/Gelb, NSF=Rot, WOA=Rot, WOF=Rot, 3 Taktzyklen;
	lw $a0, red_yellow
	lw $a1, red
	lw $a2, red
	lw $a3, red
	jal set_ampel
	jal print
	li $a0, 3
	jal delay_ticks
	# 5. Phase: NSA=Gruen, NSF=Rot, WOA=Rot, WOF=Gruen, 12 Taktzyklen;
	lw $a0, green
	lw $a1, red
	lw $a2, red
	lw $a3, green
	jal set_ampel
	jal print
	li $a0, 12
	jal delay_ticks
	# 6. Phase: NSA=Gelb, NSF=Rot, WOA=Rot, WOF=Rot, 3 Taktzyklen;
	lw $a0, yellow
	lw $a1, red
	lw $a2, red
	lw $a3, red
	jal set_ampel
	jal print
	li $a0, 3
	jal delay_ticks
	# 7. Phase: NSA=Rot, NSF=Rot, WOA=Rot, WOF=Rot, 2 Taktzyklen;
	lw $a0, red
	lw $a1, red
	lw $a2, red
	lw $a3, red
	jal set_ampel
	jal print
	li $a0, 2
	jal delay_ticks
	# 8. Phase: NSA=Rot, NSF=Rot, WOA=Rot/Gelb WOF=Rot, 3 Taktzyklen;
	lw $a0, red
	lw $a1, red
	lw $a2, red_yellow
	lw $a3, red
	jal set_ampel
	jal print
	li $a0, 3
	jal delay_ticks
	
	j main

	addi	$v0,$zero,10	#exit program
	syscall

# Argumente: $a0: Anzahl der Ticks
delay_ticks:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	li $v0, 32 # sleep syscall
	li $t0, 100
	mul $a0, $a0, $t0 # delay = 1000 * ticks (one second per tick)
	syscall
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

# Schreibt den Zustand in s0 bis s3
# Argumente: $a0: NSA, $a1: NSF, $a2: WOA, $a3: WOF;
# Codierung: Rot -> 1, Gelb -> 2, Rot/Gelb -> 3, Gruen -> 4
set_ampel:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

# Gibt den Zustand einer Ampel aus
# Argumente: a0 Name der Ampel, a1: Zustand der Ampel
print_ampel:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	# Lampenzustand aus Bits berechnen
	andi $t0, $a1, 1
	andi $t1, $a1, 2
	andi $t2, $a1, 4
	
	ble $t1, 0, l1
	li $t1, 1
	
l1:
	ble $t2, 0, l2
	li $t2, 1
	
l2:
	
	li $v0,4 #print(name)
	syscall
	
	la $a0, redS
	addi $v0,$zero,4 #print(redS)
	syscall
	move $a0, $t0
	addi $v0,$zero,1 #print(red)
	syscall
	
	la $a0, yellowS
	addi $v0,$zero,4 #print(yellowS)
	syscall
	move $a0, $t1
	addi $v0,$zero,1 #print(yellow)
	syscall
	
	la $a0, greenS
	addi $v0,$zero,4 #print(greenS)
	syscall
	move $a0, $t2
	addi $v0,$zero,1 #print(green)
	syscall
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
			
# Gibt den Zustand der Ampelanlage aus
print:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	# NSA Ampel
	la $a0, nsa
	move $a1, $s0
	jal print_ampel
	# NSF Ampel
	la $a0, nsf
	move $a1, $s1
	jal print_ampel
	# WOA Ampel
	la $a0, woa
	move $a1, $s2
	jal print_ampel
	# WOF Ampel
	la $a0, wof
	move $a1, $s3
	jal print_ampel
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	

