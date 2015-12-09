
import UIKit
import Foundation

//: ### Defining a closure: Closures are typically enclosed in curly braces { } and are defined by a function type () -> (), where -> separates the arguments and the return type, followed by the in keyword which separates the closure header from its body.
let padawans = ["Knox", "Avitla", "Mennaus"]
padawans.map({
    (padawan: String) -> String in
    "\(padawan) has been trained!"
})
//: ### Closures with known types: When the type of the closure's arguments are known, you can do as follows:

func applyMutliplication(value: Int, multFunction: Int -> Int) -> Int {
    return multFunction(value) * value
}

applyMutliplication(2,
    multFunction:{(value) in value * 3})

//: ### Let me explain what's happening. The compiler can infer that we return a string from the closure that we pass to the map function, which means there's no reason to include it in the closure expression definition. We can only do this if the closure's body includes a single statement though. In that case, we can put that statement on the same line as the closure's definition, as shown in the below example name "first". Because there's no return type in the definition and no -> symbol preceding the return type, we can omit the parentheses enclosing the closure's parameters.

var states = ["California", "New York", "Texas", "Alaska"]

states.map {(state: String) -> String in
    return state.substringToIndex(state.endIndex).uppercaseString
}

let first = states.map({ state in state.substringToIndex(state.endIndex).uppercaseString })

print(first)
//: ### In the closure body, we reference the arguments using shorthand argument names Swift provides us with. The first argument is referenced by $0, the second by $1, etc. In the updated example "Second" , I have omitted the list of parameters and the in keyword, and replaced the state argument in the closure's body with the shorthand argument name $0. The resulting statement is more concise without compromising readability.
let Second = states.map({ $0.substringToIndex($0.endIndex).uppercaseString })

//: ### Normal
UIView.animateWithDuration(0.5,
    
    animations: {
        
        //animation block
    
    },completion: {(let completion:Bool) in
        
        //Completion block
})
//: ### advanced 
UIView.animateWithDuration(0.5,
    
    animations: {
        
        //animation block
    },
    completion: { completion in

        //Completion block
})
//: ### Using Trailing Closure
UIView.animateWithDuration(0.5,
    
    animations: {
        
        //animation block
        
    }) { completion in
        
        //Completion block
}
//: ### replace completion to _
UIView.animateWithDuration(0.5,
    
    animations: {
        
        //animation block
        
    }) { _ in
        
        //Completion block
        
}



