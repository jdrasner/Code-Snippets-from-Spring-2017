
#### Jason Drasner, Professor Qing Yi, CS 3160, 
####    Assignment 8 - Learning to Program in Ruby

#This is a ruby comment


## Problem 1 - Atomic Values

	print "\nPROBLEM 1: \n" 
	# Numbers and associated operators
	(5.5 - 4) / 2 * (2 + 1)
	10 % 4 # Using Mod operator
	2 ** 5 # Using exponent operator


	# Symbols
	:symbol

	# Boolean
	true
	false 
	true || false 
	true && false
	1 == 1.0      #returns true
	1.eql?(1.0)   #returns false
	5 != 4        #returns true
	5 >= 4        #returns true
	5 <= 4        #returns false
	5 <=> 4       #returns 0 if eq, 1 if 1st operand > 2nd operand, -1 if 1st operand < 2nd operand

	# Strings
	'Jason'
	"Drasner"

	# Void Value
	nil


## Problem 2 - Compound Values

	print "\nPROBLEM 2: \n" 
	# Hash Map
	{ :firstName => "Jason", :lastName => "Drasner", :class => "CS3160" }

	# Arrays
	[1,2,3,4,5]
	[6,7] + [8,9]
	([10] + [20,30,40,50]).size

	# Ranges
	# Inclusive range (..)
	1..10 # => 1 - 10
	"a".."g"
	# Exclusive range (...)
	1...10 # => 2 - 9

	# Trying out some operations
	["Jason","Drasner"].include?("Drasner")
	["Jason","Drasner"].include?("Drazzner")
	('a'..'g').min
	('a'..'g').max
	('a'...'g').min
	('a'...'g').max
	[1,2,3,4,5,6,7].min
	[1,2,3,4,5,6,7].max


## Problem 3 - Variable Assignment

	print "\nPROBLEM 3: \n" 
	# Using Ruby Parallel Assignment
	a,b,c,d = 2,4,8,16

	# Chaining assignments together
	e = f = 32

	# More assignments
	array = [1,2,3,4,5]
	array += [6,7]
	array [3]
	range = 1..10
	hm = {:schl => "UCCS", :city => "Colorado Spgs", :state => "CO"}
	hm[:city]
	defined? hm
	defined? g
	
	# Using a global variable
	$someGlobVar = "This is a global var"
	puts $someGlobVar
	
	# Using a local variable
	@someLocalVar = "This is a local var"
	puts @someLocalVar
	

## Problem 4 - Dynamic Type Checking

	print "\nPROBLEM 4: \n"
	# Use class attribute
	array.class
	range.class
	hm.class
	3.class
	3.1415926535.class
	:schl.class
	true.class
	false.class
	"string".class
	1_2_3.class
	nil.class
	

## Problem 5 - Type Conversion

	print "\nPROBLEM 5: \n"
	x = "5"
	y = 3.14
	
	# convert a value to an integer: x.to_i
	x.to_i
	y.to_i
	
	# convert a value to a float.to_f
	x.to_f
	y.to_f

	# convert a value to a symbol
	x.to_sym
	# y.to_sym - undef method

	# convert a value to a string
	x.to_s
	y.to_s
	['a','b','c'].to_s

	# convert a value to an array 
	"14".to_a # => "No method error"
	x.to_a    # => "No method error"
	hm.to_a

	# convert a string to an array
	"abcdefg".split
	" a b c d e f g".split
	
	
## Problem 6 - Simple Program I/O

	print "\nPROBLEM 6: \n"
	puts "Hello there! What is your favorite food?";
	#read a single line from stdin
	food = gets
	
	puts "Thank you for telling me that. I like " + food + " too. What is your name?"
	name = gets
	
	print "Hello " + name + "\nI'll tell all the others you like " + food
	print "I'm sure they won't make fun of you"
	
	
## Problem 7 - Control Flow

	print "\n\nPROBLEM 7: \n"
	chk = 50;
	print "chk verified\n" if chk < 50
	print "chk verified\n" unless chk <= 50

	chk = 45;
	print "chk verified\n" if chk < 50
	print "chk verified\n" unless chk <= 50

	# While loop example
	while chk < 50 do chk += 1
		if 		chk < 50 then print "less than 50\n"
		elsif	chk == 50 then print "check verified\n" 
		end 
	end


		
	# For loop example
	for cnt in 'a'..'g'
		puts "Value of local var is #{cnt}"
	end
	
	
## Problem 8 - Translating Factorial Function

	print "\nPROBLEM 8: \n"
	# Translate function below to Ruby:
	# fun fact(n) = if n = 1 then 1 else n * fact(n-1); #
	
	# Ruby Translation: #
	def fact(a1 = "number")
		if a1 == 1 then return 1
		else return (a1 * fact(a1 - 1))
		end
	end
	
	print fact(1)
	print fact(5) #5! = 120
	print fact(8) #8! = 40320
	
	
## Problem 9 - New Factorial Function (uses while loop)

	print "\n\nPROBLEM 9: \n"
	def fact1(a1)
		if a1 == 1 then return 1
		else
			count = 0
			currProduct = 1
			while count < a1 do
				currProduct = currProduct * (a1 - count) 
				count += 1
			end
			return currProduct
		end
	end
	
	print fact1(1)
	print fact1(5)
	print fact1(8)

	
# Wait 5 seconds before automatically exiting
sleep(5)