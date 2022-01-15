// Initializers


struct SomeStruct {
	let someProp: Int
	
	
	init(someProp: Int) {
		self.someProp = someProp
	}
	
	init(someOtherProp: Int) {
		someProp = someOtherProp
	}
	
	init(someMoreProp: Int, someEvenMoreProp: Int) {
		someProp = someMoreProp + someEvenMoreProp
	}
}


/*
 Both structs and classes can get default init iff all props have some default value and dont define own init func.
 Structs in addition have memberwise init for every prop in struct iff they dont define own init func.
 */


/*
 Initializer delegation -> call other init from within init
 */

struct DelegateStruct {
	let someProp: Int
	let someOtherProp: String
	
	init() {
		someProp = 10
		someOtherProp = "Hello there"
	}
	
	init(someProp: Int, someOtherProp: String) {
		self.someProp = someProp
		self.someOtherProp = someOtherProp
	}
	
	init(someProp: Int) {
		self.init(someProp: someProp, someOtherProp: "Hello \(someProp)")
	}
}


class SuperClass {
	let someProp: Int
	
	init() {
		someProp = 10
	}
	
	init(someProp: Int) {
		self.someProp = someProp
	}
}

class SubClass: SuperClass {
	let someOtherProp: String
	
	// designated init
	// must init ALL props, both from itself and all from parent
	// every class must have at least on designated, this can be inherited though.
	override init() {
		someOtherProp = "Hello"
		super.init()
	}
	
	init(someOtherProp: String, someProp: Int) {
		self.someOtherProp = someOtherProp
		super.init(someProp: someProp)
	}
	
	// secondary init = convenience init
	/*
	 Convenience MUST call other conveniece or somewhere in the change eventually a designated init
	 Designated MUST call super init (designated)
	 */
	convenience override init(someProp: Int) {
		if someProp == -1 {
			self.init(someOtherProp: "Bye bye", someProp: someProp)
		} else {
			self.init()
		}
	}
}

/*
 A designated init MUST init all stored props in class before calling super init
 If you dont define own designated init you inherit all designated from parent
 If you have an implementation for all designated inits you automaitcally get to inherit all convenience init too.
 */


/*
 Failable Init
 e.g. Int(s: String) returns either an int or nil if string cant be parsed as number
 */

struct Person {
	let name: String
	let age: Int
	// ? after init
	init?(name: String, age: Int) {
		if age < 0 {
			return nil
		}
		self.name = name
		self.age = age
	}
}

/*
 Required init
 */

class RequiringInit {
	required init(prop: Int) {
		// do sth
	}
}

class RequiredInit: RequiringInit {
	required init(prop: Int) {
		// init
		super.init(prop: 10)
	}
}


/*
 Deinit
 -> do some cleanup work when class is being destroyed
 */

class DeinitClass {
	let prop = "Hello world"
	
	deinit {
		// here you have access to all props
		print("Deleting this instance, it had prop=\(prop) assigned")
	}
}
