#### Jason Drasner, CS 3160, Professor Qing Yi,     ####
####  Assignment 10 - Learning to Program in Python ####


### Note the importance of idententation in Python ###

## Problem 1 -- Atomic Values
print("\nProblem 1 Output: ")

# Booleans
print(True)
print(False or 5 > 3)
print(True and False)
print(5 <= 2 or 3 == 3)
print(True != True)

# Integers and Floats (numeric literals)
print(3)
print(3.1415926535)
print(2.5e4)
print(2**5/8-3+1.5*4//2)
print(10 % 4)

# Imaginary numbers
print(.7j)
print(2.5J)

# Strings
print("efg"+"hij")
print('abc'+'\n', 'jason'+'\n'+'\tdrasner')
print(r'escaping\n\t' ) # r prefix disables processing of escape sequences
print("""this is a multi-
line string """)



## Problem 2 -- Compound Value Types
print("\nProblem 2 Output: ")

# Lists
alist = ['a','b','c',2.25,19,4e7,.7j,True]
smallList = ['hi','world','earth']
concatList = [1,2,3]+[4,5,6] # Concat two lists with '+'
print(concatList)
print(len(concatList)) # Getting list length w/len()

# Tuples - are like read-only lists
atuple = ('abc', 123, "jason")
anotherTuple = ('efg', "drasner")
print(atuple, anotherTuple)

# Bytes
someByte = b'jasondrasner'
print(someByte)



## Problem 3 -- Variable Assignment
print("\nProblem 3 Output: ")
myName = ('jason','drasner')
thisPlanet = smallList[2]
print(thisPlanet)
a1,a2,a3 = 1,2,3
a4 = a5 = 4
print(a3, a5)

# Some List operations
print(alist)      # Prints whole list
print(alist[0])   # Prints first element
print(alist[2:4]) # Prints elements 3-5
print(alist[2: ]) # Prints elements 3 onwards



## Problem 4 -- Type Checking
print("\nProblem 4 Output: ")

# Using type()
print(type(3),type(3.14),type(1<2),type(3J),type("string"))
print(type([]),type(['a',3.14,"hello",3j]),type(()))

# Type Checking w/isinstance() and type() is whatever
print("Checking Types: ", isinstance(3,int), isinstance(3.14,float), isinstance("hello world",str))
print("Checking Types: ", type(smallList) is list, type({}) is dict, type(atuple) is tuple)



## Problem 5 -- Type Conversion
print("\nProblem 5 Output: ")
string = "12345"
string2= "3.2"
print(int(string) + 5)    # string to int
print(float(string2) + 5) # string to float
print(str(int(string)))   # string to int back to string



### Problems 6 and 7 -- Statements, Control Flow, Input/Output
print("\nProblems 6 and 7 Output: ")

import random
number = random.randint(1, 100)
guessesTaken = 0
guesses = []

print('Hello there! What is your name?')
name = input()
print('Alight ' + name + ', prepare yourself. Guess a number between 1 and 100.')
while guessesTaken < 7:
	print('Guess a number.')
	guess = int(input())
	guesses = guesses + [guess]
	guessesTaken += 1

	if(guess < number):
		print('Too low')
	if(guess > number): 
		print('Too high')
	if(guess == number):
		print('You got it!')
		break

# If User picked correct number
if(guess == number):
	print("Good job " + name + "! You did well.")

	# File I/O - outputting numbers tried with File I/O
	my_list = guesses
	f = open("output.txt", "w") # Using write mode attribute
	for item in my_list:
	    f.write(str(item) + "\n")

	f.close()
	i = 0
	f = open("output.txt", "r") # Using read mode attribute
	while(i < len(guesses)):
		print(f.readline()) 
		i += 1

# If User took too many tries
if(guess != number):
	print("Sorry " + name + " you took too many guesses and have failed this test.")
	print("This is the number: " + str(number))
	print("These are the numbers you tried: \n")
	loopCnt = 0
	loopEnd = len(guesses) - 1
	for x in guesses: # Using a for loop to display all guesses
		if(loopCnt != loopEnd):
			print(str(x) + ",")
			loopCnt += 1
		else:
			print(str(x) + "\n")
	print("Sharper crayons are surely available.")

# Pause after displaying results/insults - using input()
print("Please press <enter> to continue.")
input()



## Problem 8 -- Translate factorial function to python
print("\nProblem 8 Output: ")
# fun fact(n) = if n = 1 then 1 else n * fact(n-1);
# Translation below:
def fact(n):
	if(n == 1):
		return 1
	else:
		return n * fact(n -1)


# Testing fact()
print(fact(1))
print(fact(4)) # outputs 24
print(fact(8)) # outputs 40320



## Problem 9 -- Factorial function using while loop
print("\nProblem 9 Output: ")

def fact1(n):
	if(n > 1):
		product = n
		currNum = product
		while(currNum > 1):
			product *= currNum - 1
			currNum -= 1
		return product
	elif (n == 1 or n == 0): 
		return 1
	else:
		print("n must be a positive integer greater than 0")


# Testing fact1()
print(fact1(1))
print(fact1(4))   # outputs 24
print(fact1(8))   # outputs 40320
print(fact1(-44)) # can't do it - outputs "None"



## Problem 10 -- Examples of other built-in operations in python
print("\nProblem 10 Output: ")

# Using all() - returns true if all elements of the iterable are true (or if empty)
someIterable = [5 > 4, 3 == 3.0, 9e5 < 1e6 ]
print(all(someIterable)) # any() works in a similar fashion

# Using bytearray object and the iterable range
bArr = bytearray(range(30))
print(bArr) # Uses hex to describe binary data

# Using exec to dynamically execute python code
x = y = 5
someCode = "print(x**y); print(\n);" # prints 3125 and newline
exec(someCode) # only 1st arg given so code is executed in current scope

# Using filter(func, iterable) to filter a list
someList = [3,5,15,25,44,50] # Used in the next few examples
# Weeding out elements !% by 5
def divisiblebyfive(x):
	if(x % 5 == 0):
		return x

divisbyfive = filter(divisiblebyfive, someList)
for x in divisbyfive:
	print(str(x))

# Using min()
print(min(someList))

# Using sum()
print(sum(someList))