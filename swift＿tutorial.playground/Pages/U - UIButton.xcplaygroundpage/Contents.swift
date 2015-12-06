
import Foundation
import UIKit

class viewcontroller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let button = UIButton(type: UIButtonType.System)
        button.frame = CGRect(x: 110, y: 70, width: 100, height: 44)
        button.setTitle("確認", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonTouch", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
    }
    
    func buttonTouch(){
        print("The button was touched")
    }
    
}



