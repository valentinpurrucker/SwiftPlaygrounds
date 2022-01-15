// Inheritance
// only available for classes

class Vehicle {
	var speed: Float = 0
	var seats: Int = 1
	
	// computed prop
	final var info: String {
		"Vehicle has \(seats) seats and is driving at \(speed) km/h"
	}
	
	func drive() {
		print("driving")
	}
	
	func accelerate() {
		speed += 10
	}
}


class Car: Vehicle {
	var tires = 4
	
	// must always be var since all computed props are vars.
	override var seats: Int {
		get {
			5
		}
		set {
			super.seats
		}
	}
	
	/*
	 Not allowed since info is final
	override var info: String {
		"car"
	}
	 */
	
	override func drive() {
		print("driving in a car")
	}
	
	override func accelerate() {
		speed += 50
	}
}

let vw = Car()
vw.seats = 10
print(vw.seats)
