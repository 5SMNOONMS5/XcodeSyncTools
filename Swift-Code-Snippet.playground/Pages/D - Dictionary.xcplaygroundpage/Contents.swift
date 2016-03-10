
import UIKit

extension Dictionary{
  
//: Combines with other dictionary
  public mutating func union(other: Dictionary) -> Dictionary {

    if other.count == 0 && self.count == 0{
      print("dictionaries contain empty dictionary")
    }
    
    for (key,value) in other {
      self.updateValue(value, forKey:key)
    }
    return self
  }
  
}

public func += <KeyType, ValueType>
  (inout left: Dictionary<KeyType, ValueType>,
        right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
      left.updateValue(v, forKey: k)
    }
}

var characters1: [String: String] = ["A":"1","C":"3",]
var characters2: [String: String] = ["B":"2","D":"4"]
var characters3: [String: String] = ["E":"5","F":"6"]
var emptyCharacters = [String: String]()

characters1

characters1.union(characters2)

characters1 += characters3


//: Creat a empty dictionary
var dicNamesOfIntegers = [Int: String]()


var airports: [String: String] = ["YYZ": "Toronto Pearson",
                                  "DUB": "Dublin"]

airports.count


let empty = (airports.isEmpty) ? "empty" : "not empty"


//: Add one more item
airports["LHR"] = "London"
airports.count


if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
  print(airports["DUB"]!)
}


if let removedValue = airports.removeValueForKey("DUB") {
  print(airports)
}

let airportCodes = [String](airports.keys)

let airportNames = [String](airports.values)









