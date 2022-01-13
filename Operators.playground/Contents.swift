// Operators (most important things)

/*
 Ternary
 Same as in Java
 */

let ternaryCheckConstant = 10
print(ternaryCheckConstant == 10 ? "equal" : "no equal")


/*
 Nil Coalescing
 Provide a default for an optional
 */
let optionalInt: Int? = nil
print("Number is: \(optionalInt ?? 0)")

/*
 Ranges
 */
let halfOpenRange = 0..<10 // is exclusive
let closedRange = 0...10 // inclusive
for _ in closedRange {
	// will print 0 to 9
}
for _ in halfOpenRange {
	// will print 0 to 10
}

let groceries = ["apple", "banana", "kiwi", "cacao", "milk"]
for _ in groceries[1...] {
	// will print everything starting from index 1
}
