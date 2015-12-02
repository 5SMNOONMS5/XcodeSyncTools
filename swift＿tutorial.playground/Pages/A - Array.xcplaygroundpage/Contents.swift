

import Foundation.NSArray

//: ###  You can create an empty array of a certain type using initializer syntax:


var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)

someInts = []

//: ### Lazy Initialization

class DataImporter {
   
    lazy var players: [String] = self.initialPlayers()
    
    func initialPlayers() -> [String] {
        var players = ["John Doe"]
        return players
    }
    
}





// the DataImporter instance for the importer property has not yet been created




