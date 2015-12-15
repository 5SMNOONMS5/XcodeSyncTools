

import Foundation.NSArray

//: ###  You can create an empty array of a certain type using initializer syntax:


var someInts = [Int]()

print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)

someInts = []





//: ### Extension Array
extension Array{
  
//: random
  
  public func random() -> Element {
    let index = Int(arc4random_uniform(UInt32(self.count)))
    return self[index]
  }
  
//: random
  
  
  
  
}

