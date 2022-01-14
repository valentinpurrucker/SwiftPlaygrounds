// Control Flow
/*
 while, for, switch, guard, break, continue
 */

for i in 0...5 {
	print(i)
}

for (i, c) in "👏😂🐳".enumerated() {
	print("\(c) at pos: \(i)")
}

// stride(to) is half open
// stride through is closed range
for i in stride(from: 0, to: 10, by: 2) {
	print(i)
}


/*
 While
 */

var count = 1
while count < 1 {
	print(count) // doesnt print anything since loop condition is already false
	count += 1
}
count = 1

repeat {
	print(count) // will print at least once
	count += 1
} while count < 1


/*
 Conditionals
 */
// mainly for binary decisions
let maxAttempts = 10
var currentAttempt = 9
if currentAttempt > maxAttempts {
	print("too many attempts")
} else {
	// do sth else
}

// multiple decisions -> switch
let role = "Student"

// must be exhaustive -> must cover every possible value
switch role {
	case "Student", "Senior", "student", "senior": // compound case instead of fall through
		print("student discount")
	case "Driver":
		print("no discount")
		
	default:
		print("1% discount only")
		
}

let age = 20
switch age {
	case 0...1:
		print("a baby")
	case 2...13:
		print("child")
	case 15...17:
		print("teen")
//		one sided range
	case 18...:
		print("adult")
	default:
		// could be -1
		print("no valid age")
}

// Tuple in switch

let result: (Int, String) = (200, "Success")
switch result {
	case (_, "Success"):
		print("Success")
	case (400, _):
		print("Fail")
	case (200, "Success-Delayed"):
		print("Success but late")
	default:
		print("sth else")
}

// Value binding -> capture a value that you check against
switch result {
	case (200, let responseMsg):
		print("Success with: \(responseMsg)")
	
	case let (code, msg):
		print("\(code), \(msg)")
}

let expectedMsg = "Success-Delayed"
switch result {
	case (200, let msg) where msg == expectedMsg:
		print("Success")
	case (200, let msg) where msg == expectedMsg:
		print("Failt")
	case let (code, msg):
		print("\(code), \(msg)")
}


/*
 Control transfer (return, break, continue, throw, fallthrough)
 */

for i in 0...10 {
	if i % 2 == 0 {
		continue
	}
	if i > 5 {
		break
	}
	print(i)
}

switch age {
	case 0..<18:
		break // will leave the switch immediately
	case 18...:
		print("adult")
	default:
		break
}

outer : for i in 0...9 {
	for j in 1...3 {
		if j == i {
			break outer
		}
		print(j)
	}
}


// Guards -> always have else branch

func download(from url: String) {
	// do sth, get a result
	let result = (404, "Fail")
	guard result == (200, "Success") else {
		// here you must exit the code that executes the guard
		return
	}
	print("Download successful")
}

download(from: "http://1234.com")


// guard with optional binding
func getIntFromString(_ s: String) -> Int {
	guard let number = Int(s) else {
		fatalError("\(s) cant be converted to int")
	}
	// bound value is available here
	return number
}

getIntFromString("123")


/*
 Api availability (in if or guard statement)
 */

if #available(iOS 10, macOS 10, *) {
	print("running on ios 10 or macos 10")
} else {
	print("running on older version")
}


