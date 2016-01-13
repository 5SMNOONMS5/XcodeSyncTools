

import UIKit

//: ### interpolation
 
 let string1 = "Hello"
 let string2 = "     Word"
 let string3 = string1 + string2
 var string4 = "Swift is strngg"
 let string5 = "TestIn Range"


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

/** contain character " H " */
(string1 as NSString).containsString("H")
/** contain white space */
(string2 as NSString).containsString(" ")

string1.characters.contains("H")


//: ### 該字串在原本字串的 NSRange

let range = (string5 as NSString).rangeOfString("tIn")
range.location
range.length



//: ### 將"."插入至倒數第 2 個字前


string4.insert("o", atIndex: (string4.endIndex.advancedBy(-2)))


//: ### 移除最後一個字


let lastObject = string4.endIndex.advancedBy(-1)..<string4.endIndex
string4.removeRange(lastObject)


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

//: ### 







//: ### subscript

extension String{
  
  subscript (i: Int) -> Character {
    return self[self.startIndex.advancedBy(i)]
  }
  
  subscript (i: Int) -> String {
    return String(self[i] as Character)
  }
  
  subscript (r: Range<Int>) -> String {
    let start = startIndex.advancedBy(r.startIndex)
    let endIndex = startIndex.advancedBy(r.endIndex)
    return substringWithRange(Range(start: start, end: endIndex))
  }
}



