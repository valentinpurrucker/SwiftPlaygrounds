// Optional chaining

struct Person {
	let name: String
	let age: Int
	
	init?(name: String, age: Int) {
		if (name.isEmpty || age < 0) {
			return nil
		}
		self.name = name
		self.age = age
	}
	
	func sayHello(to person: Person?) -> Greeting? {
		return Greeting(receiver: person, sender: self)
	}
}


struct Greeting {
	let receiver: Person?
	let sender: Person?
	
	var msg: String {
		get {
			if let r = receiver, let s = sender {
				return "Hello \(r.name) from \(s.name)"
			} else {
				return "No valid greeting"
			}
		}
	}
}

let me = Person(name: "Valentin", age: -22) // nil

// calling me.sayHello doesnt work since me could be nil
// optional chaining either calls the prop, subscript, method if there is a value or return null

let greetMessage: String? = me?.sayHello(to: Person(name: "Lewis", age: -50))?.msg // will either return msg or nil if any of the calls is nil.


