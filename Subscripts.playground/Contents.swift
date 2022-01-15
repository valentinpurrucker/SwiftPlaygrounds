// Subscripts

struct Book {
	var pages: [String] = []
	
	init() {
		for i in 0...100 {
			pages.append("page \(i)")
		}
	}
	
	
	subscript(_ index: Int) -> String {
		get {
			pages[index]
		}
		// optionally also a set(newValue) -> same as for computed props
	}
}

let book = Book()
print(book[10]) // page 10
