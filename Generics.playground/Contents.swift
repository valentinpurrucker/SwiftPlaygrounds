// Generics

// 'Element' is placeholder type
func swapElements<Element>(a: inout Element, b: inout Element) {
	let tempB = b
	b = a
	a = tempB
}

var a = 10
var b = 100
swapElements(a: &a, b: &b)


// Associated types -> Generic types in protocols

protocol Stack {
	
	associatedtype Element
	
	var isEmpty: Bool { get }
	
	// 'Element' type doesnt exist cuase we want to use it as a placeholder
	mutating func push(_ element: Element)
	
	mutating func pop() -> Element?
}

struct StackImplementation<Element>: Stack {
	
	// associated type is automatically inferred but it can also be declared explicitly by a typealias
	// typealias Element = Int
	
	var elements: [Element] = []
	
	var isEmpty: Bool {
		elements.isEmpty
	}
	
	mutating func push(_ element: Element) {
		elements.append(element)
	}
	
	mutating func pop() -> Element? {
		if isEmpty {
			return nil
		}
		return elements.removeLast()
	}
}

// Where clause
extension StackImplementation where Element: Equatable  {
	func isTop(_ element: Element) -> Bool {
		guard let last = elements.last else {
			return false
		}
		return last == element
	}
}

var intStack = StackImplementation<Int>()
intStack.push(10)
intStack.push(100)
intStack.push(1000)

intStack.isTop(20)

print(intStack.pop()!) // 1000
print(intStack.pop()!) // 100
print(intStack.pop()!) // 10


// Equal only works with types conforming to Equatable protocol
func equalCheck<Element: Equatable>(_ a: Element, _ b: Element) -> Bool {
	a == b
}

// Type paramter inferred to be of type Int
print(equalCheck(10, 100))

	// Type paramter inferred to be of type String
print(equalCheck("10", "10"))
