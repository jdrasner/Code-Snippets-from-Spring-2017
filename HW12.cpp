/* Jason Drasner,
  * Professor Qing Yi, 
   * CS 3160 Assignment 12 - Memory Layout of C++ Classes */


// <exp> ::= <number> | <var> | <exp> + <exp> | <exp> ( <expList> )
// <expList> ::= <exp> | <exp> , <expList>

// This grammar can be represented using the AST (Abstract Syntax Tree) data 
// structure using the following datatype definition in ML:

// datatype Exp = Number of int | Var of string | Plus of Exp*Exp
//              | FunCall of Exp * ExpList
// and ExpList = Single of Exp | Multi of Exp * ExpList


//** Problem 1, Part A -- Extend C++ Classes to fully implement AST **//

#include <stdio.h>
typedef enum {TYPE_INT, TYPE_FLOAT, TYPE_VOID} ValType;

// Basically the class for <exp> in the BNF
class AST {
	ValType type;
	protected:
		AST(ValType t) { type = t; }
	public:
		ValType get_val_type() { return type; }
		virtual int num_of_children() = 0;
		virtual void print()
			{
				if (type == TYPE_INT) printf("int");
				else if (type == TYPE_VOID) printf("void");
				else if (type == TYPE_FLOAT) printf("float");
				else printf("ERROR(unrecognized type)");
			}
};

// Adding a Number class that holds integers as content -- <number> in the BNF
// class Number : public AST {
// 	private:
// 		const int number;
// 	public:
// 		Number(const int _number, ValType _t) : number(_number), AST(_t) {}
// 		const int get_number() { return number; }
// 		int num_of_children() { return 0; }
// 		/* AST::print invokes the impl of print in the AST class */
// 		virtual void print() { printf("%i : ", number); AST::print(); }
// };

// Variables class -- <var> in the BNF
class Var : public AST {
	private:
		const char* name;
	public:
		Var(const char* _name, ValType _t) : name(_name), AST(_t) {}
		const char* get_name() { return name; }
		int num_of_children() { return 0; }
		/* AST::print invokes the impl of print in the AST class */
		virtual void print() { printf("%s : ", name); AST::print(); }
};

// "Plus Class" -- <exp> + <exp> in the BNF
class Plus : public AST {
	private:
		AST *opd1, *opd2;
	public:
		Plus(AST* _opd1, AST* _opd2) : opd1(_opd1), opd2(_opd2),
					AST(_opd1->get_val_type()) {}
		AST* get_opd1() { return opd1; }
		AST* get_opd2() { return opd2; }
		int num_of_children() { return 2; }
		virtual void print() { opd1->print(); printf("+\n"); opd2->print(); printf("\n"); }
};

// // FunCall class for <exp>(<expList>)
// class FunCall : public AST {
// 	private:
// 		AST *opd1, *opd2;
// 	public:
// 		FunCall(AST* _opd1, AST* _opd2) : opd1(_opd1), opd2(_opd2),
// 					AST(_opd1->get_val_type()) {}
// 		AST* get_opd1() { return opd1; }
// 		AST* get_opd2() { return opd2; }
// 		int num_of_children() { return 2; }
// 		virtual void print() {opd1->print(); printf("("); opd2->print(); printf(")\n"); }
// };

// class ExpList {
// private:

// public:
// 	ExpList() // Constructor
// }



int main() {	

	AST* res = new Plus( new Var("x1",TYPE_INT), new Var("y1", TYPE_FLOAT));
	res->print();

	// // Additonal testing unrelated to part c
	// AST* res2 = new Plus(new Number(925,TYPE_INT), new Var("aVar", TYPE_INT));
	// res2->print();

	//AST* res3 = new FunCall(new Var("foo",TYPE_VOID), new Number(3.14159, TYPE_FLOAT));
	//res3->print();

	// AST* res4 = new ExpList(new Plus(new Number(1,TYPE_INT)), new FunCall(new Var("foo",TYPE_VOID), new Number(3.14159, TYPE_FLOAT)));
	// res4->print();

	Var* aVar = new Var("hello",TYPE_VOID);
	aVar->print();

}