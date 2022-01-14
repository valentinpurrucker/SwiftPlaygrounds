// Properties
/*
 Types of proeprties:
 Stored: store a const or variable value in an instance
 Computed: calculate a value based off some other value
 Instance: belong to a specific instance
 Type: belong to the type and are the same for all instances.
 */

// Stored

struct Screen {
	var width = 300
	var height = 200
	
	lazy var heaveComp = 1_000_000 // will assign the value only on first access
}

var pcScreen = Screen()
pcScreen.width = 400

let phoneScreen = Screen()
// phoneScreen.height = 600 isnt allowed since phonescreen is constant and so are ALL properties in it.

// Computed

struct Line {
	var a: Int
	var b: Int
	
	var length: Int {
		get {
			b - a
		}
		// setter is always optional
		set(length) { // if parameter isnt named, newValue is the default value
			b = a + length
		}
	}
	
	// read only doesnt have to define 'get {}' explicitly
	var lengthShort: Int {
		b - a
	}
	
	// Property observer
	var observeThis: Int = 100 {
		willSet(newValue) {
			print("variable gonna be: \(newValue)")
		}
		
		didSet(oldValue) {
			print("variable changed from \(oldValue) -> \(observeThis)")
		}
	}
}

var line = Line(a: 10, b: 20)
line.observeThis = 1_000

/*
 Property wrappers
 seperates the code storing the actual value and declaring the value
 */


// must have a 'wrappedValue' prop
@propertyWrapper
struct PrintWrapper {
	
	private var value: String = ""
	
//	this value is exposed to the declaring property
	var wrappedValue: String {
		get {
			print("value is: \(value)")
			return value
		}
		set {
			print("value was: \(value)")
			value = newValue
		}
	}
	
	// must define with parameter wrappedValue
	init(wrappedValue: String) {
		self.value = wrappedValue
	}
}


struct Printer {
	@PrintWrapper var name: String = "abc123"
}

var printer = Printer()
printer.name


/*
 Type property
 is lazy and only initialized once.
 */

struct Structure {
	static var prop = "Name: Structure"
	
	static var it: Int {
		1_000_000_000
	}
}

