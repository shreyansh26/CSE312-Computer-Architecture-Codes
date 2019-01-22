.data
str: .asciiz "The sum = "

.text
main:

	li $t0, 1
	li $t1, 2
	add $t2, $t0, $t1

	# jr $ra
	li $v0, 4
	la $a0, str
	syscall

	move $a0, $t2
	li $v0, 1
	syscall

	li $v0, 10
	syscall