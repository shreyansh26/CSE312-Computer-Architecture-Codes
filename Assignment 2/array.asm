.data
	.align 2
	prompt1: .asciiz "Input array: \n"
	prompt2: .asciiz "Enter number: "
	prompt3: .asciiz "The numbers are: \n"
	prompt4: .asciiz "\n"
	prompt5: .asciiz "Done"
	arr: .word 0, 0, 0, 0, 0, 0, 0, 0

.text
main:
	li $v0, 4
	la $a0, prompt1
	syscall

	la $t0, arr  ## Array address
	li $t1, 8  ## Counter

read:
	li $v0, 4
	la $a0, prompt2
	syscall

	li $v0, 5
	syscall

	sw $v0, 0($t0)
	addi $t0, 4
	sub $t1, 1

	bgtz $t1, read

	la $t0, arr  ## Array address
	li $t1, 8  ## Counter

	li $v0, 4
	la $a0, prompt3
	syscall

print:
	li $v0, 1
	lw $a0, 0($t0)
	syscall

	li $v0, 4
	la $a0, prompt4
	syscall

	addi $t0, 4
	sub $t1, 1

	bgtz $t1, print

	li $v0, 4
	la $a0, prompt5
	syscall