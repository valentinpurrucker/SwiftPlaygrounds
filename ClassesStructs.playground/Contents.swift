// Classes and Structs

/*
 Both:
 define props
 define methods
 define subscripts
 define initializer
 conform to protocols
 can be extended (through extension)
 
 Classes can do a bit more:
 inherit from others
 typecast a class at runtime
 deinitialized
 classes are references NOT value types
 */


struct User {
	let id: Int
	let name: String
	var age: Int
	
}

class Person {
	let id: Int = 0
	let name: String = "Valentin"
	var age: Int = 22
}


// Structs come with memberwise initializer, classes dont.
let user = User(id: 1, name: "Valentin", age: 22)
let person = Person()

var user2 = user
let person2 = person

user2.age = 30
person2.age = 30

print(user, user2, person.age, person2.age)

// print(user === user2) doesnt work since its a value type
print(person === person2)
