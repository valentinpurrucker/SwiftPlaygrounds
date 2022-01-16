// Error handling

/*
 Throw error -> instance must conform to error protocol
 */


enum MyError: Error {
	case Error1
	case Error2(msg: String)
}


func trySomething() throws {
	throw MyError.Error2(msg: "This is the reason why an error has been thrown")
}


/*
 if code throws an error you have to handle it
 Options:
 1. Propagate error to caller
 2. catch error
 3. error to optional value
 4. assertion
 */

// 1.
func doSomething() throws {
	// whenever you call sth. that can throw an error mark it with try
	defer {
		print("do this regardless of how the function leaves")
	}
	try
		trySomething()
}


func catchError() {
	do {
		try doSomething()
	} catch MyError.Error1 {
		print("Error1 has been caught")
	} catch MyError.Error2(let msg) {
		print("Error2 has been caught with msg: \(msg)")
	} catch {
		print("some error has been caught")
	}
	
}


func optionalError() {
	let a = try? doSomething()
	if a == nil {
		print("error has been thrown")
	} else {
		print("call was successful")
	}
}


catchError()
