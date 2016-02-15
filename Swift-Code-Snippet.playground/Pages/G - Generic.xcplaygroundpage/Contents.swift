


import UIKit

//: ### Generic Type



var a = 10
var b = 20


func swapTwoValues<T>(inout a: T, inout _ b: T) {
  let temporaryA = a
  a = b
  b = temporaryA
}

