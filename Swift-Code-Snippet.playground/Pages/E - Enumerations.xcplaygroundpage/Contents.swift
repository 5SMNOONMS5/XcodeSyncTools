
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