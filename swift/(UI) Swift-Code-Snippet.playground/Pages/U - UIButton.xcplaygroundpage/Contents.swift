

import UIKit

class viewcontroller: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let btn = UIButton(type: .System)
    
    btn.frame = CGRect(x: 110, y: 70, width: 100, height: 44)
    
    btn.setTitle("Title", forState: .Normal)
    
    btn.addTarget(self, action: "buttonTouch", forControlEvents: .TouchUpInside)
    
    btn.titleLabel?.textColor  = UIColor.redColor()
    
    btn.layer.cornerRadius = 5
    
    view.addSubview(btn)
  }
  
  func buttonTouch(){
    print("The button was touched")
  }
  
}




