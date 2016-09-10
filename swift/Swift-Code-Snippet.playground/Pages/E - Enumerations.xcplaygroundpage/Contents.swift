
//: ### Define enumerations

enum CompassPoint: String {
    case North, South, East, West
}

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

//: ### Get rawValue

let earthsOrder = Planet.Earth.rawValue

let sunsetDirection = CompassPoint.West.rawValue

//: ### Get rawValue via parameter

if let somePlanet = Planet(rawValue: 3) {
  switch somePlanet {
  case .Venus:
    print("Venus")
  case .Earth:
    print("Earth")
  case .Mars:
    print("Mars")
  default:
    print("Not a safe place for humans")
  }
}


//: ### A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. The compiler has to insert a layer of indirection when it works with recursive enumerations , You indicate that an enumeration case is recursive by writing indirect before it.

indirect enum ArithmeticExpression {
  case Number(Int)
  case Addition(ArithmeticExpression, ArithmeticExpression)
  case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

//: ###  The Addition and Multiplication cases have associated values that are also arithmetic expressions—these associated values make it possible to nest expressions.


func evaluate(expression: ArithmeticExpression) -> Int {
  switch expression {
  case .Number(let value):
    return value
  case .Addition(let left, let right):
    return evaluate(left) + evaluate(right)
  case .Multiplication(let left, let right):
    return evaluate(left) * evaluate(right)
  }
}


let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))






