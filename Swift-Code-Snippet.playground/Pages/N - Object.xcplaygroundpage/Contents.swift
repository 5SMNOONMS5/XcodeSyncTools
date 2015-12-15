
import UIKit

extension NSObject {
  
  public var className: String {
    return self.dynamicType.className
  }
  
  public static var className: String {
    return stringFromClass(self)
  }
  
}

public func stringFromClass(aClass: AnyClass) -> String {
  return NSStringFromClass(aClass).componentsSeparatedByString(".").last!
}


//: ### Usage


class aUIViewClass: UIView {
  
}

let className = stringFromClass(aUIViewClass)

