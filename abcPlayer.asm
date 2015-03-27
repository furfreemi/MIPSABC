# MIPS ABC Player
# Start .text segment (program code)
.text
	
.globl	main

main:
 
# Open File
open:
	li	$v0, 13		# Open File Syscall
	la	$a0, file	# Load File Name
	li	$a1, 0		# Read-only Flag
	li	$a2, 0		# (ignored)
	syscall
	move	$s6, $v0	# Save File Descriptor
	#blt	$v0, 0, err	# Goto Error
 
# Read Data
read:
	li	$v0, 14		# Read File Syscall
	move	$a0, $s6	# Load File Descriptor
	la	$a1, buffer	# Load Buffer Address
	li	$a2, 1024	# Buffer Size
	syscall
 
# Print Data
print:
	li	$v0, 4		# Print String Syscall
	la	$a0, cont	# Load Contents String
	syscall
 
# Close File
close:
	li	$v0, 16		# Close File Syscall
	move	$a0, $s6	# Load File Descriptor
	syscall
 
# Error
	#li	$v0, 4		# Print String Syscall
	#la	$a0, fnf	# Load Error String
	#syscall
 
	# Play a midi chord :
	
	
    	li $v0, 31  		# syscall to play midi  
    	li $a0, 60 	     	# set midi pitch to c
    	li $a1, 1000		# set midi duration to 1000 ms (1 second)  
    	li $a2, 0		# set midi instrument to piano d
	li $a3, 127		# TURN IT UP TO 11
    	syscall
    	
    	li $v0, 31  		# syscall to play midi  
    	li $a0, 64  	     	# set midi pitch to e 
    	li $a1, 1000		# set midi duration to 1000 ms (1 second)  
    	li $a2, 0		# set midi instrument to piano d
	li $a3, 127		# TURN IT UP TO 11
    	syscall
    	
    	li $v0, 31  		# syscall to play midi  
    	li $a0, 64  	     	# set midi pitch to g
    	li $a1, 1000		# set midi duration to 1000 ms (1 second)  
    	li $a2, 0		# set midi instrument to piano d
	li $a3, 127		# TURN IT UP TO 11
    	syscall
    	   	
    	li $v0, 31  		# syscall to play midi  
    	li $a0, 72  	     	# set midi pitch to hi c
    	li $a1, 1000		# set midi duration to 1000 ms (1 second)  
    	li $a2, 0		# set midi instrument to piano d
	li $a3, 127		# TURN IT UP TO 11
    	syscall
    	
	li	$v0,10		# exit
	syscall


# Start .data segment (data!)
	.data
file:	.asciiz	"C:\\ABC Project\\sample.abc"
cont:	.ascii  "File contents: "
buffer: .space 1024 
newline:   .asciiz	"\n"