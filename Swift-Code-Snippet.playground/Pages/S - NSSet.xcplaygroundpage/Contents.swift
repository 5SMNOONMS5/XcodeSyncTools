
import UIKit

//: initializer syntax NSSet

var letters = Set<Character>()

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]


//: Basic syntax practice

letters.insert("a")

letters = []

if let removedGenre = favoriteGenres.remove("Rock") {
  print("\(removedGenre)? I'm over it.")
}

if favoriteGenres.contains("Funk") {
  print("I get up on the good foot.")
}

for genre in favoriteGenres {
  print("\(genre)")
}

for genre in favoriteGenres.sort() {
  print("\(genre)")
}

//: Fundamental Set Operations : The illustration below depicts two sets–a and b– with the results of various set operations represented by the shaded regions.

var sample = UIImage(named: "1")



let oddDigits: Set = [1, 3, 5, 7, 9]

let evenDigits: Set = [0, 2, 4, 6, 8]

let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()



//: Set Membership and Equality

//: The illustration below depicts three sets–a, b and c– with overlapping regions representing elements shared among sets. Set a is a superset of set b, because a contains all elements in b. Conversely, set b is a subset of set a, because all elements in b are also contained by a. Set b and set c are disjoint with one another, because they share no elements in common.

var sample2 = UIImage(named: "2")


let houseAnimals: Set = ["🐶", "🐱"]

let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]

let cityAnimals: Set = ["🐦", "🐭"]


//: Use the isSubsetOf(_:) method to determine whether all of the values of a set are contained in the specified set.
houseAnimals.isSubsetOf(farmAnimals)

//: Use the isSupersetOf(_:) method to determine whether a set contains all of the values in a specified set.
farmAnimals.isSupersetOf(houseAnimals)

//: methods to determine whether a set is a subset or superset, but not equal to, a specified set.
cityAnimals.isStrictSupersetOf(farmAnimals)

//: Use the isDisjointWith(_:) method to determine whether two sets have any values in common.
farmAnimals.isDisjointWith(cityAnimals)





















