(***  Jason Drasner
	  Professor Qing Yi
	  CS 3160
	  Assignment 11 - Continuation Passing/Exception Handling ***)


(** Problem 1 - Translate to Tail Recursion using Continuation Passing Style **)

(* Part a *)
fun find(x,[]) = 0
	| find(x,y1::y2) = if (x = y1) then 1+find(x,y2) else find(x,y2);

(* CPS Translation *)
fun findCPS(x,[],k) = k(0)
	| findCPS(x,y1::y2,k) = if (x = y1) then findCPS(x,y2,fn r1 => k(1+r1)) else findCPS(x,y2,k);

(* Testing find and findCPS *)
val list = [1,2,3,3,3,2,1,0];
find(1,list); 
find(3,list);
find(0,list);
find(5,list);

findCPS(1,list,fn x => x);
findCPS(3,list,fn x => x);
findCPS(0,list,fn x => x);
findCPS(5,list,fn x => x);

(* Part b *)
datatype btree = Empty | Leaf of int | Node of btree * btree;
fun Max(Empty) = 0
	| Max(Leaf(x)) = x
	| Max(Node(b1,b2)) = let val n1 = Max(b1); val n2 = Max(b2) in
							if n1 < n2 then n2 else n1 end;

(* CPS Translation *)
fun MaxCPS(Empty,k) = k(0)
	| MaxCPS(Leaf(x),k) = k(x)
	| MaxCPS(Node(b1,b2),k) = MaxCPS(b1, fn r1 =>  
							  MaxCPS(b2, fn r2 => if r1 < r2 then k(r2) else k(r1)));
											 
(* Testing Max and MaxCPS *)
val tree = Node(Leaf 4, Leaf 5);
val deepTree = Node(Node(Node(Node(Leaf 1, Leaf 2),Node(Leaf 7, Leaf 3)),Leaf(2)),Leaf 1);
val leaf = Leaf(18);
val empty = Empty;

Max(tree);
Max(deepTree);
Max(leaf);
Max(empty);

MaxCPS(tree, fn x => x);
MaxCPS(deepTree, fn x => x);
MaxCPS(leaf, fn x => x);
MaxCPS(empty, fn x => x);


(** Problem 2 -- Exception Handling in ML **)

exception MultBy0 of int;
fun global(x,y) =
	let fun compose(f, g) =
			f(g(x) handle MultBy0(z) => z+1 )
			handle MultBy0(z)=>z+1;
		fun mult(x) = if (y = 0) then raise MultBy0(x)
				  	  else if (x=0) then raise MultBy0(y) else x*y;
	in 
		let val x = 4 in
			compose(mult,mult)
		end
end;


(* Testing global using original function 
	 and an 'add' variation - change else to x+y *)

global(0,5); (* *=> 30 *) (* +=> 11 *)
global(1,5); (* *=> 25 *) (* +=> 11 *)
global(1,3); (* *=> 9 *)  (* +=> 7 *)
global(3,0); (* *=> 5 *)  (* +=> 5 *)


(*
 *
 *	List of events occured when global(0,5) is called
 *		1. Enter first let expression
 *		2. Enter second let expression
 *		3. Make function call compose(mult,mult)
 *		4. First call to mult in mult(mult(0))
 *		5. mult call raises MultBy0(y) exception since x=0
 *		6. MultBy0 exception is handled inside f(), becomes mult(6)
 *		7. mult(6) evaluates to (x=6) * (y=5) = 30
 *		8. compose(mult,mult) returns 30
 *		9. global(0,5) returns 30
 *
 *)