// Collections
/*
 Array, Set, Dictionary
 */

let items: [String] = ["item1", "item2", "..."]
// cant change items since its constant
var itemsVar: [String] = ["item1", "item2", "..."]
itemsVar.append("new item")
let removedItem = itemsVar.remove(at: 1)

let defaultArray = Array(repeating: 1, count: 5)

var itemsAll = items + itemsVar

// will replace the items and if needed delete the one not having a new value assigned.
itemsAll[0...1] = ["replacing item"]

/*
 Iterate either over entries or indices
 */
for _ in itemsAll {
	// will print the item
}

for _ in itemsAll.indices {
	// will give the indices
}

for (_, _) in itemsAll.enumerated() {
	// will return the index AND the element as a tupel.
}


/*
 Set : unorder and unique values.
 */

var foodSet: Set = ["apple", "kiwi", "cacao", "milk"] // without type annotation it would be an array type.
foodSet.insert("bread")

// Set is unordered
for _ in foodSet {
	// will iterate over items
}

for _ in foodSet.sorted() {
	// will sort the elements
}


/*
 Set operations
 */
let evenNum: Set = [2, 4, 6, 8, 10]
let unevenNum: Set = [1, 3, 5, 7, 9]

print(evenNum.union(unevenNum)) // combine both sets.
print(evenNum.intersection(unevenNum)) // empty
print(evenNum.subtracting(unevenNum)) // same as evenNum


/*
 Dictionaries
 unordered key-value pairs
 */

var cityDict: [String: String] = [:] // empty dict
cityDict["12345"] = "City1"
cityDict = [:]
cityDict = ["12345": "City1", "123": "City2"]
if let updated = cityDict.updateValue("City10", forKey: "123") {
	// update will return the old value if there was a value for the key, or nil if new key's been inserted
	print(updated)
}

for (_, _) in cityDict {
	// iterating will return you the (key, value) tuple for each entry.
}

for _ in cityDict.keys {
	// will give you all keys. Same with values.
}
