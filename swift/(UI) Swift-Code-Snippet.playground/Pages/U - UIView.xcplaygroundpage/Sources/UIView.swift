

import UIKit

public extension UIView{
  
  // MARK: - Response Chain
  
  func firstAvailableViewController() -> UIViewController? {
    return traverseResponderChainForUIViewController() as? UIViewController
  }
  
  func traverseResponderChainForUIViewController() -> AnyObject?{
    guard let nextResponder = self.nextResponder() else {
      return nil
    }
    
    if let nextResponder = nextResponder as? UIViewController {
      return nextResponder
    }
    
    if let nextResponder = nextResponder as? UIView{
      return nextResponder.traverseResponderChainForUIViewController()
    }
    return nil
  }
  
  // MARK: - Initialization From NibFile Using generics
  
  class func loadNib<U : UIView>(nibNameOrNil: String? = nil) -> U {
    let view: U? = fromNib(nibNameOrNil)
    return view!
  }
  
  class func fromNib<U : UIView>(nibNameOrNil: String? = nil) -> U? {
    var view: U?
    let name: String
    if let nibName = nibNameOrNil {
      name = nibName
    } else {
      // Most nibs are demangled by practice, if not, just declare string explicitly
      name = "\(U.self)".componentsSeparatedByString(".").last!
    }
    let nibViews = NSBundle.mainBundle().loadNibNamed(name, owner: nil, options: nil)
    for v in nibViews {
      if let tog = v as? U {
        view = tog
      }
    }
    return view
  }
  
  
  
  
  
}

