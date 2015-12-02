
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


