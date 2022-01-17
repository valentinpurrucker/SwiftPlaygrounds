// Extensions

/*
 Used when adding new functionality to already existing type, protocol
 You can even change a type to conform to a protocol
 Extensions can add:
 1. Computed props
 2. methods
 3. new inits
 4. subscripts
 5. new nested types
 6. conform to protocol
 */

extension Int {
	var description: String {
		"this is a number without any decimal places"
	}
}

extension Int {
	
	subscript(i: Int) -> Int {
		self * i
	}
	
	
	mutating func double() {
		// in structs we can mutate the struct value itself
		self = self * 2
	}
}

var a = 10
print(a.description)
a.double()
print(a)

print(a[10]) // 20 * 10 = 200
