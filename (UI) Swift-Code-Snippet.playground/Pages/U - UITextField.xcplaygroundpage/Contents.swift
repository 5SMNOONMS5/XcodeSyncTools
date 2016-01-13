
import UIKit

class VC: UIViewController {
    
    override func viewDidLoad() {
  
        /** 沒有select、selectAll、paste 的 UITextField */
        let customTextField = CustomTextField()
        view.addSubview(customTextField)
      
        /** 正常的 UITextField */
        let textField = UITextField(frame: CGRect(x: 10, y: 100, width: 220, height: 31))
        textField.borderStyle = .RoundedRect
        /** 字體垂直置中 */
        textField.contentVerticalAlignment = .Center
        /** on/off correction */
        textField.autocorrectionType = .No
        textField.textAlignment = .Left
        textField.returnKeyType = .Done
        textField.placeholder = "<# placeholder #>"
        /** display leftView   */
        textField.leftViewMode = .Always
        view.addSubview(textField)
    }
}

//: ###  UITextField Without UIMenuController

class CustomTextField: UITextField {
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        
        if  action == "paste:"  ||
            action == "select:" ||
            action == "selectAll:" {
                return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}

//: ###  UITextField Delegate

extension VC : UITextFieldDelegate{
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}





