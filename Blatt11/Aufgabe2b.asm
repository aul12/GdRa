.data
str1:	.asciiz	"Please enter your name and press Enter!\n\n"
str2:	.asciiz	"\nHello "
str3:	.asciiz	"An empty string is not a valid name!\n"
name:	.space	50

.text
main:	la	$a0,str1	#print str1
	addi	$v0,$zero,4
	syscall

######### start of your own code ###########	
label1:	
	addi	$v0,$zero,8	#read input
	la	$a0,name
	addi	$a1,$zero,50
	syscall
	
	lb $t0, 0($a0)
	bne $t0, '\n', label2
	
	la	$a0,str3	#print str3
	addi	$v0,$zero,4
	syscall
	
	la	$a0,str2	#print str2
	addi	$v0,$zero,4
	syscall
	
	j label1

######### end of your own code ############
		
label2:	la	$a0,str2	#print str2
	addi	$v0,$zero,4
	syscall
	la	$a0,name	#print the entered name
	syscall
	j	end		#go to the programm end label
	
end:	addi	$v0,$zero,10	#exit the programm
	syscall
