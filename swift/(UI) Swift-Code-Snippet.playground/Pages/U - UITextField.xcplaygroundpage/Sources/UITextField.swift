
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
    textField.keyboardAppearance = .Dark
    textField.keyboardType = .EmailAddress
    textField.secureTextEntry = true
    textField.placeholder = "<# placeholder #>"
    textField.inputAccessoryView?.hidden = true
    textField.reloadInputViews()
    
    /** display leftView   */
    textField.leftViewMode = .Always
    view.addSubview(textField)
  }
  
//: ###  Check email validation

  func isValidEmail(email:String) -> Bool {
    
    let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluateWithObject(email)
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

//: ###  UITextField Delegate , Click keyboard return button will dismiss the keyboard

extension VC : UITextFieldDelegate{
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}









