
######## start own your own code ########
main:	
	li $t0, 53 # x = 53
	li $t1, 2  # y = 2
	li $t2, 6  # z = 6
	mul $t3, $t1, $t2 # temp = y * z
	sub $t3, $t0, $t3 # temp = x - temp
	addi $t3, $t3, 1 # temp = temp + 1
	
	move $a0, $t3 # print(temp)
	li $v0, 1 
	syscall
######## end own your own code #########

	addi	$v0,$zero,10	#exit program
	syscall
