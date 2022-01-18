// Operator Methods
/*
 Structs, classes can provide implementation of operator -> operators are overloaded
 Are declared as type methods
 */

struct Message: Equatable {
	var msg: String
	
	// binary operator -> two sides of values for operator
	static func + (left: Message, right: Message) -> Message {
		Message(msg: left.msg + " " + right.msg)
	}
	
	// prefix op
	static prefix func - (msg: Message) -> Message {
		let reversed = String(msg.msg.reversed())
		return Message(msg: reversed)
	}
	
//	 compound assignement operator
//	 must be inout since you actually modifiy the value
	static func += (left: inout Message, right: Message) {
		left.msg += right.msg
	}
	
	// Equivalence
	static func == (left: Message, right: Message) -> Bool {
		left.msg == right.msg
	}
}

var msg1 = Message(msg: "Hello")
let msg2 = Message(msg: "World")

print((msg1 + msg2).msg)
print(-msg1)
msg1 += msg2
print(msg1)

print(msg1 == msg2)


// Result builders
/*
 Allows to create nested data like list, tree in declarative way
 is main building block of swiftui
 requires resultBuilder attribute
 */

// Example: Builder for text (Text, Space, Caps, special chars)
protocol Drawable {
	func draw() -> String
}

@resultBuilder
struct DrawingBuilder {
	// allows you to write lines in a block of code like you write normal code.
	static func buildBlock(_ components: Drawable...) -> Drawable {
		Line(content: components)
	}
	
	// allows to use if else in the builder
	static func buildEither(first component: Drawable) -> Drawable {
		component
	}
	
	static func buildEither(second component: Drawable) -> Drawable {
		component
	}
	
}

// @DrawingBuilder turns a closure into a value that the resultbuilder builds by applying buildBlock function
func draw(@DrawingBuilder content: () -> Drawable) -> Drawable {
	content()
}

struct Line: Drawable {
	
	var content: [Drawable]
	
	func draw() -> String {
		content.map { element in
			element.draw()
		}.joined(separator: "")
	}
}

struct Text: Drawable {
	
	var content: String
	
	init(_ content: String) {
		self.content = content
	}
	
	
	func draw() -> String {
		content
	}
}

struct Space: Drawable {
	func draw() -> String {
		" "
	}
}

struct Stars: Drawable {
	var amount: Int = 1
	func draw() -> String {
		String(repeating: "*", count: amount)
	}
}

struct Caps: Drawable {
	var content: Drawable
	
	func draw() -> String {
		content.draw().uppercased()
	}
}


let helloWorld = Line(content: [
		Stars(amount: 3),
		Text("Hello"),
		Space(),
		Caps(content: Text("World")),
		Stars(amount: 3)
])

print(helloWorld.draw()) // ***Hello WORLD***

func caps(@DrawingBuilder content: () -> Drawable) -> Drawable {
	Caps(content: content())
}


let helloWorldDeclarative = draw {
	Stars(amount: 3)
	Text("Hello")
	Space()
	caps {
		Text("World")
	}
	Stars(amount: 3)
}
print(helloWorldDeclarative) // ***Hello WORLD***
/*
 the declarative way calls draw method that will turn the closure into whatever our resultbuilder returns from buildBlock
 So the result is a line that contains a star, a text, a space and caps that itself again contains a line and a text. last is another star drawable.
 Line(Stars, Text, Space, Caps(Line(Text)), Stars) is the actual structure.
 */
