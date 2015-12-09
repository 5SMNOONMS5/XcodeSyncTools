
import UIKit
import Foundation

//Button word of different colors
let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let button = UIButton(type: .System)
    button.frame = CGRect(x: 110, y: 70, width: 100, height: 44)
    button.setTitle("確認", forState: .Normal)
    button.addTarget(self, action: "buttonTouch", forControlEvents: .TouchUpInside)
    view.addSubview(button)
    
    //Button word of different colors
    let myButton = UIButton(type: .System)
    let placeStr = "屏東縣屏東市第100開票所"
    var numberStr = placeStr.componentsSeparatedByString("第")[1]
    numberStr = numberStr.componentsSeparatedByString("開")[0]
    
    let range: NSRange = (placeStr as NSString).rangeOfString(numberStr)
    
    let myMutableString = NSMutableAttributedString(string: placeStr, attributes: [NSForegroundColorAttributeName: UIColor.blackColor()])
    
  
    
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: hexColorWithRGB(113, green: 112, blue: 113, alpha: 1), range: range)
    
    myButton.setAttributedTitle(myMutableString, forState: .Normal)
  }
  
  func buttonTouch(){
    print("The button was touched")
  }
  
}




