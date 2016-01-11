

import UIKit

class VC : UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
//: ### UITapGestureRecognizer
    
    let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
    tap.numberOfTouchesRequired = 1
    view.addGestureRecognizer(tap)
    
  }
  
  
  
  
  
  
  func handleTap(tap : UITapGestureRecognizer){
    print("handleTap")
  }
  
  
}


