// Type casting


class Vehicle {
	var seats: Int {
		1
	}
	var wheels: Int {
		2
	}
}

class Car: Vehicle {
	override var seats: Int {
		5
	}
	
	override var wheels: Int {
		4
	}
}


class Bike: Vehicle {
	override var seats: Int {
		1
	}
	
	override var wheels: Int {
		2
	}
	
	let pedals: Int = 2
}


let vehicles: [String: Vehicle] = ["vw": Car(), "Ghost": Bike()]

for vehicle in vehicles {
	// 'is' operator returns true if type is true, false else
	if vehicle.value is Bike {
		// to access props on bike we have to down cast
		// as! means forced cast while as? returns an optional
		let bike = vehicle.value as! Bike
		print("this is a bike \(vehicle.key) with \(bike.pedals) pedals")
	} else if vehicle.value is Car {
		print("This is a car \(vehicle.key)")
	}
}

for vehicle in vehicles {
		// 'is' operator returns true if type is true, false else
	if let bike = vehicle.value as? Bike {
		print("this is a bike with \(bike.pedals) pedals")
	} else if let _ = vehicle.value as? Car {
		print("This is a car")
	}
}
