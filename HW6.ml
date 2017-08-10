(*
	Jason Drasner
	Professor Qing Yi
	CS 3160
	Assignment 6 - Learning ML
								*)
						
(* Problem 1 - Types of Atomic Values *)

	val unitVal = ();
	val intVal = 5;
	val boolVal = true;
	val realVal = 3.14;
	val strVal = "hello world";


(* Problem 2 - Conditional Operators *)

	"Broncos" = "Broncos" andalso not("Raiders" = "Chiefs");
	5 = 4 orelse 3 = 3;


(* Problem 3 - Operations to Support Int and Real Values *)

	(* Int Expressions *)
	5 + 4 - 3 * 2 div 1;
	(6 + 2) mod 2;
	
	(* Real Expressions (AKA FLOATING POINT) *)
	2.5 * 10.0 - 3.0 + 4.5 / real(2);
	
	(* Trying to mix real and int:
		i.e. 2.0 + 5 - gives an error: 
			operator and operand don't agree
				use real() to explicitly convert int to real *)


(* Problem 4 - '^' Operator - Supports string concatenation *)

	val someString = "Hello " ^ "world!";


(* Problem 5 - Compound Values Examples *)

	(* List *)
	val funcsList = [fn x => x + 1, fn y => y + 1];

	(* Tuple *)
	val address = (1600, "Pennsylvania Ave", "Washington, D.C.");

	(* Record - similar to tuples, w/named components *)
	val someRec =  {firstName = "Jason", lastName = "Drasner"};

	(* Function *)
	fun myFunc(x,y) = x + y * 2;
	myFunc(3,2);

	(* Reference - creates a ref cell containing x *)
	val x = ref "some string";
	
	
(* Problem 6 - Operations on a list *)

	(*Building a list of strings*)
	val colors = ["red", "blue"]@["yellow"];
	val names = "John"::["Adams"];
	
	(*Testing if a list is empty*)
	names = nil;
	
	(*Pulling apart a list*)
	hd colors;
	tl colors;
	

(* Problem 7 - Operations on a tuple *)

	(*Building a tuple*)
	val someTuple = (1, 2, 3, "some string");
	
	(*Pulling it apart*)
	#1(someTuple); 
	#4(someTuple);
	
	
(* Problem 8 - Operations on a record *)

	(*Building a record *)
	val someRecord = {term1 = "this", term2 = "is", term3 = "ML"};
	
	(*Pulling it apart*)
	#term1(someRecord); #term2(someRecord); #term3(someRecord);
	
	
(* Problem 9 - Operations to build a function and invoke w/args *)

	fun f(x,y,z) = (x + y) * z;
	f(1,2,3);
	
	
(* Problem 10 - Operations to build reference cell, modify and extract value *)

	(*Building, modifying, and extracting value*)
		val r = ref 3.0; r := 7.6; !r;

		
(* Problem 11 - Examples of defining new variables in ML *)

	fun multiply(a,b,c) = a*b*c;
	val pi = 3.1415926535;
	
	
(* Problem 12 - Example of defining a new data type in ML *)
	
	datatype suit = spades | hearts | diamonds | clubs;
	val firstCard = spades;

	
(* Problem 13 -	Control-Flow Operations in ML *)

    if 6 div 3 = 2 then "hello" else "goodbye";
	if firstCard = hearts orelse firstCard = diamonds then "red card" else "black card";
	
    (*while/do statement*)
	val y = ref 10; while (!y > 0) do y := !y div 2;
	!y;

	
(* Problem 14 - Modifying Reference Storages *)

	let val myvar = ref 1;
	in
		myvar := !myvar + 5;
		myvar
	end;
	
	
(* Problem 15 - Using loops to modify variables *)
	
	(* Explicitly declaring type of mylist to avoid type errors *)
	val mylist : int list ref = ref [];
	
	val i = ref 0;
	
	(* Prepending integers 1-50 to mylist *)
	while (!i < 50) do ( i := !i + 1; mylist := !i :: !mylist);
	
	(* Displaying mylist *)
	!mylist;
	