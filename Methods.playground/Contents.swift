// Methods


struct Car {
	let wheels = 4
	var seats = 5
	
	func honk() {
		print("honk")
	}
	
	func drive() {
		print("drive")
	}
	
	mutating func addSeat() {
		if seats < 8 {
			return
		}
		seats += 1
	}
	// for class type methods -> class keyword
	static func turnOnLight() {
		print("turn on lights")
	}
}
