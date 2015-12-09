
import Foundation

//: ### Convenience method for GCD dispatch_after


public func delay(delay: NSTimeInterval, closure:() -> ()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

//: Example:

func doSomething() {
    
}

func doSomethingElse() {
    
}

delay(0.5) {
    doSomething()
}

delay(3.0) {
    doSomethingElse()
}
