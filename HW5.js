/* Jason Drasner
   Professor Qing Yi
   CS 3160
   Assignment 5 - JavaScript: Functional Programming on the web
   
   Tested Using JavaScript Shell node.js
   Output Generated using console command filePath>node HW5.js   */
   
// Problem 1 - Atomic Values

	// Part A - Atomic Values supported by Javascript
	
	var number, bool, string, undef, nullzy;
	number = 10;
	bool = true;
	string = "I'm a string";
	undef = undefined;
	nullzy = null;
  
	// Display values for part A
	console.log("Output for Problem 1A:");
	console.log(number);
	console.log(bool);
	console.log(string);
	console.log(undef);
	console.log(nullzy);
	console.log(" ");
  
	// Parts B and C - Using various operators in Javascript
	
	var x, bString, bBool, otherBool, strLength, q, r;
	
	bString = string + number;          // Using concat operator "+"
	x = 2 + 2;                          // Using arithmetic operator "+"
	number = number * number;           // Using arithmetic operator "*"
	bBool = (20 < 10);                  // Using comparison operator "<"
	otherBool = (10 == 10 && 5 == 5);   // Using boolean operators "==" and "&&"
	strLength = bString.length;
	
	q = string + 5;
	r = "5" + 5;
  
	// Display values for parts B and C
	console.log("Output for Problem 1B/1C:");
	console.log(bString);
	console.log(x);
	console.log(number);
	console.log(bBool);
	console.log(otherBool);
	console.log(strLength);
	console.log(q);
	console.log(r);
	console.log(" ");
  

// Problem 2 - Variables

	// Part A - Variable Definition Example
  
	var someVar = true;
  
	// Part B - Variable Assignment Operator Examples
 
	var a, b, c, d, e, f;
	a = 1; b = 1; c = 10; d = 5; e = 100;
	b += a; // b = b + a = 2
	c -= d; // c = c - d = 5
	d *= c; // d = d * c = 25
	e %= d; // e = remainder of e/d = 0
  
	// Output for Problem 2
	console.log("Output for Problem 2:");
	console.log(someVar);
	console.log(a,b,c,d,e);
	console.log(" ");
  
  
// Problem 3 - Compound Values

	// Part A - Arrays and Objects
	
	object = {firstName: "Jason", lastName: "Drasner"}
	var array = [object, 5, 10, "string", nullzy];
	
	console.log("Output for Problem 3A:");
	console.log(array);
	console.log(object.firstName);
	console.log(object.lastName);
	console.log(" ");
	
	// Part B - "new" Operator
	
	var arrayB, objectB;
	arrayB = new Array(1, 2, 3);
	objectB = new Object(1, 2, 3);
	
	console.log("Output for Problem 3B:");
	console.log(arrayB);
	console.log(objectB);
	console.log(" ");
	
	// Part C - "delete" Operator
	
	delete object.lastName;
	delete array[4];
	
	console.log("Output for Problem 3C:");
	console.log(object);
	console.log(array);
	console.log(object.lastName);
	console.log(" ");
	
	// Part D - Array Subscript Operator
	
	array[3] = "value has changed";
	object.lastName = "Sudakis";
	
	console.log("Output for Problem 3D:");
	console.log(object.lastName);
	console.log(array[3]);
	console.log(" ");
	
	// Part E - Predefined Array Methods
	
	var cars = new Array("ford", "gm", "mazda", "subaru");
	var trucks = ["chevy", "pickup"];
	var carsAndTrucks;
	console.log("Output for Problem 3E:");
	console.log(cars.length);
	
	cars.push("chrysler");
	console.log(cars);
	
	cars.pop();
	console.log(cars);
	
	carsAndTrucks = cars.concat(trucks);
	console.log(carsAndTrucks);
	
	var carsString = cars.join();
	console.log(carsString);
	console.log(" ");
	
	
// Problem 4 - Dynamic Type Checking

	// Part A - "typeof" Operator
	
    var typeVar;                 		// Currently undefined...
	
	console.log("Output for Problem 4A:");
	console.log(typeof typeVar);
	
	typeVar = 5;                 		// Now it's a number...
	console.log(typeof typeVar);
	
	typeVar = "string";          		// Now it's a string...
	console.log(typeof typeVar);
	
	typeVar = Object;            		// And so on...
	console.log(typeof typeVar);
	
	typeVar = object;
	console.log(typeof typeVar);
	
	typeVar = true;
	console.log(typeof typeVar);
	console.log(" ");
	
	// Part B - "instanceof" Operator
	
	// Using "cars" array from Problem 3E
	console.log("Output for Problem 4B:");
	console.log(cars instanceof String);
	console.log(cars instanceof Number);
	console.log(cars instanceof Array);
	console.log(cars instanceof Object);
	console.log(" ");
	
	// Part C - "in" Operator
	console.log("Output for Problem 4B:");
	console.log("ford" in cars);          // False - need to specify index val
	console.log(0 in cars);      		  // Checking if index val is in cars (true)
	console.log(5 in cars);      		  // False - does not exist
	console.log("firstName" in object);   // True
	console.log(" ");
	
	
// Problem 5 - Functions

	// Part A - Lisp to JavaScript Translation
	
		/*  Lisp Function to be translated:
			(define add (lambda (x y) (+ x y)))  */
			
	function add(x, y) {
		return x + y;
	}
	
	// Invoking function to evaluate 100 + 22:
	
	console.log("Output for Problem 5, Parts A-C:");
	console.log( add( 100, 22 )); // Outputs 122
	
	// Part B - Nested Functions
	
	function foo() {
		var x1 = 2, x2 = 25;
		var multiply = function() {return x1 * x2}
		return multiply;
	}
	
	var m = foo();
	console.log(m()); // Outputs 50
	
	// Part C - "this" keyword
	
	// One example
	var person = {firstNm: "Jason", 
	              lastNm: "Drasner",
				  showBothNames: function(){
					  console.log(this.firstNm + " " + this.lastNm);
				  }
	}
	
	person.showBothNames(); // Outputs "Jason Drasner"
	
	// Another example
	function foo2() {
		var x, y, z;
		x = 2; y = 3;
		this.subtract = function() {z = y - x; return z}
		return this;
	}
	
	var subAnswer = foo2();
	console.log(subAnswer.subtract()); // Outputs 1
	console.log(" ");
	

// Problem 6 - Control Flow

	console.log("Output for Problem 6:");

	// While Statement Example
	var num = 0
	while (num <= 5) {
		num++
		console.log("num currently equals: " + num);
	}
	console.log("End Loop");
	
	// If-else Statement Example
	if (num == 5)
		console.log("num is " + num);
	
	if (num != 5) 
		console.log("num is not equal to 5");
	
	
	// Switch Statement Example
	function getVeg() {
		var veggies = 'carrots';
		return veggies;
	}
	
	switch (getVeg()) {
		case 'broccoli':
			console.log("Broccoli is green");
			break;
		case 'carrots':
			console.log("Carrots are orange");
			break;
		case 'peas': 
			console.log("Peas are small");
			break;
		default:
			console.log("Eat your vegetables!!");
	}
	
	//	For/Continue Statement Example
	var count, something = "abc";
	for(count = 0; count < 5; count++) {
		something += "d";
		if (something == "abcd") {continue;}  //skip output of "abcd"
		console.log(something);
	}
	
	// Do/while Statement Example
	var txt = "";
	var cnt = 0;
	do {
		txt = "Count is " + cnt;
		console.log(txt);
		cnt++;
	}
	while (cnt < 4);
	
	// "For in" Statement Example
	var objct = new Object();
	objct.hello = 'hello';
	objct.there = 'there';
	var objItems;
	
	for (var item in objct) {
		objItems += item;
	}
	
	console.log(objItems); // should log 'hellothere'
	console.log(" ");
	

// Problem 7 - Functional Programming Practice

	/* Translate the following Lisp code to JavaScript:
	
		(define EvalExp (lambda (x)
			(cond ((cons? x)
				(let ((op (car x)) (d1 (EvalExp (cadr x)))
								   (d2 (EvalExp (caddr x))))
					(cond ((eq? op ’+) (+ d1 d2))
						  ((eq? op ’*) (* d1 d2)))))
				((number? x) x))))
				
		(EvalExp ’(+ 2 3))
		(EvalExp ’(+ 2 (* 2 7)))         End Lisp code */
		
	// JavaScript Implementation using an object
	var evaluate = function(x) {
		switch (typeof(x)) {
			case "number":
				return x;
			case "object":
					var op = x[0];
					var d1 = evaluate(x[1]);
					var d2 = evaluate(x[2]);
					switch (op) { // Added subtraction and division operations
						case '+':
							return d1 + d2;
						case '-':
							return d1 - d2;
						case '*':
							return d1 * d2;
						case '/':
							return d1 / d2;
						default:
					console.log("Invalid op"); }	
			default:
				console.log("typeof(x) did not yield a number or object");
		}
	}

	console.log("Problem 7 Output:");
	console.log(evaluate(2+3));
	console.log(evaluate(2+2*7));
	
	// Additional Test Cases:
	console.log(evaluate(2+2+3*4/4-5));
	console.log(evaluate(+ 2 - 3 + 4));