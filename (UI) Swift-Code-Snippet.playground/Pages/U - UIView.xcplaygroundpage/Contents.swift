
import UIKit

extension UIView{
  
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
}




