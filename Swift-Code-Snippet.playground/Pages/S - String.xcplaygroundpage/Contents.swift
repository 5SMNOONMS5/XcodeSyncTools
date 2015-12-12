

import UIKit

//: ### interpolation
 
 let string1 = "Hello"
 let string2 = "     Word"
 let string3 = string1 + string2


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


