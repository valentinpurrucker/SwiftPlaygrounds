// Closures = Lambda
/*
 Will save a reference to everything available to them in scope (vars, consts)
 Closure can be:
 - Global function -> has name but doenst close over anything / doenst capture anything
 - Nested function -> has name and captures everything from parent function
 - CLosure expression -> no name but also capture everything from parent context
 */

func doMath(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
	operation(a, b)
}

// with named func
func multiply(a: Int, b: Int) -> Int {
	a * b
}

print(doMath(10, 5, operation: multiply)) // 50

// with closure expression

print(doMath(10, 5, operation: {(a: Int, b: Int) -> Int in return a * b})) // 50

// Swift will infer param types and return type
print(doMath(10, 5, operation: {a, b in return a * b}))

// Single expression return -> omit return keyword
print(doMath(10, 5, operation: {a, b in a * b}))

print(doMath(10, 5, operation: {$0 * $1}))

// In general you can pass all closure references (even operator functions) to a function type.

//Trailing closure -> for readability purpose iff func type is last parameter
// for single trailing closure omit the argument label, for every other

print(doMath(10, 5) { a,b in a * b })

func download(onSuccess: (String) -> Void, onFail: (String) -> Void) {
	onSuccess("Success")
}

download() { (msg: String) -> Void in print(msg)
	
} onFail: { error in
	print(error)
}


/*
 Escaping
 When you get a closure but dont call it before function ends and only after, you must annotate it with @escaping
 */

typealias Listener = (String) -> Void

var listeners: [Listener] = []

func addListener(listener: @escaping Listener) {
//	the closure is not called here but instead later -> function already finished when that happends
	listeners.append(listener)
}


/*
 Autoclosure
 Dont usually implement yourself but use it (assert func)
 You just pass plain expression but when called it returns that value for the expression you passed.
 */

func autoClosing(fun: @autoclosure () -> Int) {
	print(fun())
}


// autoClosing(fun: {() -> Int in 10}) isnt valid
autoClosing(fun: 10)
