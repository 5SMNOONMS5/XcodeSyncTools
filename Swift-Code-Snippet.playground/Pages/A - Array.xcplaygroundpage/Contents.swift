

import Foundation.NSArray

//: ###  You can create an empty array of a certain type using initializer syntax:


var someInts = [Int]()

//: Creating an Array by Adding Two Arrays Together

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

//: Basic array method practice

someInts.append(3)

someInts += [5]

someInts += [5,10,15,20]

someInts[0]

someInts[2...4]

someInts.removeLast()

for int in someInts {
  print(int)
}

for (index, value) in someInts.enumerate() {
  print("Item \(index + 1): \(value)")
}

someInts = []

if someInts.isEmpty{
  print("array is empty now")
}

someInts.insert(10, atIndex: 0)

someInts.removeAtIndex(0)








//: ### Extension Array
extension Array{
  
//: random
  
  public func random() -> Element {
    let index = Int(arc4random_uniform(UInt32(self.count)))
    return self[index]
  }
  
//: random
  
  
  
  
}

