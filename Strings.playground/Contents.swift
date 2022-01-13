// Strings

let name = "Valentin"

// Interpolation
print("Hello there, \(name)")

// Multi line
// always put the quotation marks on seperate lines
let lines = """
 Hey
  my name is Valentin and this
  text is a multi line string
 """
print(lines)
	// white space before the closing quotes determine the 'padding' used for the text
	// here Hey has no padding since closing quotes are indented by one space, other two lines will have a single space character before.

let unicodeText = "\u{1F496}"


// String is value type
let string1 = "Hello"
var copyString1 = string1
copyString1 = "world"
print("original: \(string1), modified: \(copyString1)")


/*
 Accessing characters of string
 */
for c in string1 {
	print(c)
}


/*
 String counts
 Every char is a unicode scalar value -> characters can be constructed with different scalars which will result in different amount of scalar values.
 To access string by subscript use a String index.
 */

//print(string1[0]) isnt allowed since a character can consist of multiple scalar values
print(string1[string1.index(string1.startIndex, offsetBy: 3)]) // expected: 'l' char

/*
 Change string
 */
copyString1.insert("👍", at: copyString1.startIndex)

// a substring from a string is actually not a string but a substring, it has most of the methods a string has.
print(copyString1[copyString1.index(copyString1.startIndex, offsetBy: 1)...]) // expected: 'wordl'
print(copyString1.hasPrefix("👍w")) // expected: true
