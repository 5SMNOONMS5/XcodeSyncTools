

import UIKit

//: ### interpolation
 
 let string1 = "Hello"
 let string2 = "     Word"
 let string3 = string1 + string2
 var string4 = "Swift is strngg"


//: ### check specific within String

for index in string1.characters.indices {
    
    if string1[index] == "H"{
        print("\(string1) contain H character")
        break
    }
}

//: ### remove all white space


string3.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())


//: ### String length


string3.characters.count


//: ### 該字串是否包含括號內的string


(string1 as NSString).containsString("H")
string1.characters.contains("H")


//: ### 將"."插入至倒數第二個字前


string4.insert("o", atIndex: (string4.endIndex.advancedBy(-2)))


//: ### 移除最後一個字


let range = string4.endIndex.advancedBy(-1)..<string4.endIndex
string4.removeRange(range)


//: ### 取得第一個"t"的位置


let startT = string4.rangeOfString("t", options:.LiteralSearch , range: nil, locale: nil)!.startIndex


//: ### 取得最後一個"t"的位置


var result2 : String.CharacterView.Index? = nil

for index in string4.characters.indices{
  if string4[index] == "t"{
    result2 = index
  }
}

if let lastT = result2{
print(lastT, terminator: "")
}



