.data
	prompt1: .asciiz "Enter the first number: "
	prompt2: .asciiz "Enter the second number: "
	answer: .asciiz "The gcd is: "

.text
main:
	# Read first number
	li $v0, 4
	la $a0, prompt1
	syscall

	li $v0, 5
	syscall

	move $t0, $v0

	# Read second number
	li $v0, 4
	la $a0, prompt2
	syscall

	li $v0, 5
	syscall

	move $t1, $v0

start:
	beqz $t0, end
	beqz $t1, end

	sub $t2, $t0, $t1
	bltz $t2, other

	move $t2, $t1
	div $t0, $t1
	mfhi $t0

	j start

other:
	move $t2, $t0
	div $t1, $t0
	mfhi $t1

	j start

end:
	move $v1, $t2

	# Print answer
	li $v0, 4
	la $a0, answer
	syscall

	li $v0, 1
	move $a0, $v1
	syscall

	jr $ra