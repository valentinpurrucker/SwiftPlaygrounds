// Protocols
/*
 Blueprint, that can be adopted by class, struct, enum
 Implement protocol = conform to protocol
 */

protocol Vehicle {
	// can require that conforming type must provide property -> this doesnt say whether computed or stored but only if its gettable and/or settable
	// always var keyword
	var wheels: Int { get }
	var seats: Int { get set }
	var description: String { get }
	
	func drive()
	
	func honk()
	
	mutating func addSeat(amount seats: Int)
}


struct Car: Vehicle {
	var wheels: Int = 4
	
	var seats = 5
	
	let description: String = "This is a car"
	
	func drive() {
		print("Driving a car")
	}
	
	func honk() {
		print("Honking in a car")
	}
	
	mutating func addSeat(amount seats: Int) {
		self.seats += seats
	}
}


func makeVehicleDrive(vehicle: Vehicle) {
	vehicle.drive()
}

makeVehicleDrive(vehicle: Car())


/*
 Delegation
 Define an object that does functionality. If your struct also needs to do that functionality, just delegate it to the other object
 Is used with appdelegate in ios app
 */

protocol Printer {
	func printing(_ text: String)
}

protocol PrinterDelegate: AnyObject {
	func writeToStdOut(printer: Printer, _ text: String)
}

struct ConsoleOutput: Printer {
	
	weak var delegate: PrinterDelegate?
	
	func printing(_ text: String) {
		delegate?.writeToStdOut(printer: self, text)
	}
}

class StdOutPrinter: PrinterDelegate {
	func writeToStdOut(printer: Printer, _ text: String) {
		print(text)
	}
}

var consoleOutput = ConsoleOutput()
let stdOutPrinter = StdOutPrinter()
consoleOutput.delegate = stdOutPrinter
consoleOutput.printing("Hello world")


protocol Description {
	var description: String { get }
}

extension Int: Description {
	var description: String {
		"\(self) is an Int"
	}
}

extension String: Description {
	var description: String {
		"\(self) is a String"
	}
}

print("Hello".description)
print(100.description)

/*
 Protocol only for class instances -> make it inherit from 'AnyObject'
 */


/*
 Composition
 Make requirement for multiple protocol conformations
 Use ampersand with any number of protocols.
 */

protocol A {
	func a()
}


protocol B {
	func b()
}

struct AB: A, B {
	func a() {
//		<#code#>
	}
	
	func b() {
//		<#code#>
	}
}

// ab must conform both to A AND B protocol
func requireAB(ab: A & B) {
	ab.a()
	ab.b()
	ab.doSome()
}


/*
 Protocol extensions
 Can add properties, methods, subscript, init IMPLEMENTATIONS
 */

extension A {
	func doSome() {
		print("im doing something in a protocol, so every type conforming to me can use this implementation")
	}
}
