.data
str: .asciiz "The sum = "

.text
main:

	lui $t0, 0x1000
	ori $t0, 0x0001
	
	lui $t1, 0x2000
	ori $t1, 0x0002

	add $t2, $t0, $t1

	li $v0, 4
	la $a0, str
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 10
	syscall