// Functions

func sayHello(to name: String = "Adam") {
	print("Hello \(name)")
}

sayHello(to: "George")
sayHello()


func sayBye(to name: String, greeted: Bool = false, from: String) {
	if greeted {
		print("Bye \(name) from \(from)")
	} else {
		print("i havent said hello yet, \(name)")
	}
	
}

sayBye(to: "Jimmy", from: "Walter")


func download(from url: String) -> (Int, String) {
	return (200, "Success")
}

let result = download(from: "123.com") // tupel elements can be accessed by index

func downloadNamedTuple(from url: String) -> (code: Int, msg: String)? {
	if url.isEmpty {
		return nil
	}
	return (200, "Success")
}


// optional binding to check for nil
if let namedResult = downloadNamedTuple(from: "123.com") {  // now tuple values have specific names.
	print(namedResult)
} else {
	print("no result")
}


func singleExpressionGreet(name: String) -> String {
	"Hello, \(name)"
}

print(singleExpressionGreet(name: "Valentin"))


/*
 Varargs = Variadic parameters
 All values are available as an array in func body.
 First argument AFTER vararg must be labled
 */

func add(_ numbers: Int...) -> Int {
	var num = 0
	for i in numbers {
		num += i
	}
	return num
}

print(add(1, 2, 3))

/*
 In Out Params
 Reason: Func params are const -> cant change them
 */
func double(_ number: inout Int) {
	number *= 2
}

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
	let temp = b
	b = a
	a = temp
}

var a = 10
var b = 40
double(&a)
print(a)
swapTwoInts(&a, &b)
print("\(a), \(b)")


/*
 Function Types -> define how fuction looks (input and output types)
 */

func sum(_ a: Int, _ b: Int) -> Int {
	a + b
}

let sumType: (Int, Int) -> Int = sum

print(sumType(10, 10))


func doMath(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
	operation(a, b)
}

print(doMath(a: 10, b: 20, operation: sum)) // expected 30

// Function as return type



func makeIncrementer(initial: Int) -> () -> Int {
	var count = initial
	
	func increment() -> Int {
//		nested function has access to all parameters, vars from the outer function
//		-> nested function builds a closure around those things
		count += 1
		return count
	}
	
	return increment
}


let incrementer1 = makeIncrementer(initial: 1)
let incrementer2 = incrementer1 // Func is reference, so both point to same object
print(incrementer1()) // 2
print(incrementer1()) // 3
print(incrementer1()) // 4
print(incrementer2()) // 5
