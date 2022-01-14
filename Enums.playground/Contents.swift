// Enumerations
/*
 Type for a specific group of related values
 Enums can have a raw value for each case (rawValue) -> Only primitives or an associated value -> can be any object
 */

// CaseIterable Proto makes enum iterable

enum Direction : CaseIterable {
	case NORTH
	case EAST
	case SOUTH
	case WEST
}

let direction: Direction = .NORTH

switch direction {
	case .NORTH:
		break
	case .EAST:
		break
	case .SOUTH:
		break
	case .WEST:
		break
}

for i in Direction.allCases {
	print(i)
}

enum Code {
	case qr(String)
	case barcode(Int, Int, Int)
}

let appleCode: Code = .barcode(1, 2, 3) // <- assiciated value

switch appleCode {
	case .qr(let code):
		print(code)
	case let .barcode(a, b, c):
		print(a, b, c)
}

// ! Associated values are different for each assignement

// Raw value is a inital value that is the same for all assignements and are of the same type

enum Symbol : String {
	case a = "a"
	case b = "b"
	case c = "c"
}

let a = Symbol.a
print(a.rawValue)

// Raw value enums receive an initializer
// will return an optional, either the case for the raw value or nil
let letterC = Symbol(rawValue: "c")

/*
 Recursive enums -> enums that themself have the enum as an asso. value
 */

enum MathExpression {
	case number(Int)
	indirect case sum(MathExpression, MathExpression) // indirect before each case
}

indirect enum MathExpressionIndirect {
	case number(Int)
	case sum(MathExpression, MathExpression)
}

let math: MathExpressionIndirect = .sum(MathExpression.number(10), MathExpression.number(20))
