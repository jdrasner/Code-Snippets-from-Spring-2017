(*  Jason Drasner
	Professor Qing Yi
	CS 3160
	Assignment 7 - Programming in ML  *)

(* Problem 1 - average numbers btw. 0 and x using a loop *)
fun average(x:int) =
	let
		val i = ref x;     (* Counter to be modified in loop *)
		val cnt = ref x;   (* Storing x for later *)
		val sum = ref 0;   (* Using 0 so type is int ref *)
		val avg = ref 0.0; (* Using 0.0 so type is real ref *)
	in
		while(!i > 0) do(sum := !sum + !i; i := !i - 1);
		avg := real(!sum) / real(!cnt + 1);
		!avg
	end;
	
(*Testing average*)
	average(30);
	average(10);
	average(5);


(* Problem 2 - Translating from Lisp to ML *)			
	
(* Problem 2A - LISP:
	(define len (lambda (x)
		(cond ((null? x) 0)
		((cons? x) (+ 1 (len (cdr x))))))) *)
		
(* Problem 2A - ML Implementation *)
fun len(x) = case x of
	nil => 0
	| x1::x2 => (1 + len(x2));

(*Testing len*)
	val funcsList = [fn x => x + 1, fn y => y + 1];
	val emperors = ["julius","nero","trajan","augustus"];
	val someNums = [1,2,3,4,5,6,7,8];
	
	len(funcsList); (*Outputs 2*)
	len(emperors);  (*Outputs 4*)
	len(someNums);  (*Outputs 8*)

	
(* Problem 2B - LISP
	(define mult (lambda (x)
		(cond ((null? x) 1)
			  ((number? x) x)
			  ((symbol? x) 1)
			  ((cons? x) ( * (mult (car x)) (mult(cdr x))))))) *)        
	
(* Problem 2B - ML Implementation *)
datatype Btree = empty | node of Btree * Btree | leaf of int;

fun multiply(x) = case x of
    empty => 1
  | leaf(x3) => x3
  | node(x1, x2) => multiply(x1) * multiply(x2);
  
(*Testing multiply*) 
	val tree = node(leaf(2),leaf(4));
	val nuthaTree = node( node(leaf(1),leaf(3)), node(leaf(3),leaf(5)));
	val yetAnother = node(empty, node( node(leaf(70),leaf(2)), empty)); 
	val listImp = node(leaf(1),node(leaf(2),node(leaf(3),node(leaf(4), empty))));
	
	multiply(tree);       (*outputs 8*)
	multiply(nuthaTree);  (*outputs 45*)
	multiply(yetAnother); (*outputs 140*)
	multiply(listImp);    (*outputs 24*)