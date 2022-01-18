// Acces control

/*
 4 levels:
 public, open (for classes) -> anywhere available
 internal -> visible only in same module = default
 private -> only in its declaration
 fileprivat -> private within the file
 */


struct SomeStruct {
	private var prop: Int {
		10
	}
	// getter & setter automatically have access: private
	// one can give setter lower access than its getter
	private var name = ""
	
	// -> var is public but setter is private
	private(set) var someProp: String = "String"
	
}

let some = SomeStruct()
// some.someProp works
// some.someProp = "10" doesnt work since setter is private
