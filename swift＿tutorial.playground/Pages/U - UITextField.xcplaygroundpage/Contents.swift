import Foundation
import UIKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //沒有select、selectAll、paste的UITextField
    let myTextField = CustomTextField()
    myTextField.text = "Test"
    
    //正常的UITextField
    let textField = UITextField(frame: CGRect(x: 10, y: 100, width: 220, height: 31))
    textField.borderStyle = UITextBorderStyle.RoundedRect
    
    //字體垂直置中
    textField.contentVerticalAlignment = .Center
    
    //字體水平置中
    textField.textAlignment = .Left
    
    textField.placeholder = "請輸入金額"
    let currencyLabel = UILabel(frame: CGRectZero)
    
    //錢的符號"$"
    currencyLabel.text = NSNumberFormatter().currencySymbol
    
    currencyLabel.font = textField.font
    currencyLabel.textAlignment = .Right
    currencyLabel.sizeToFit()
    
    /*
    讓label的寬度寬一點，如此他才能在label的文字本身是向右對齊的情況下，
    在文字欄位的左視圖上正確地對齊
    */
    currencyLabel.frame.size.width += 10
    textField.leftView = currencyLabel
    
    //顯示leftView的時機
    textField.leftViewMode = UITextFieldViewMode.Always
    
    view.addSubview(textField)
  }
  
}


class CustomTextField: UITextField {
  override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
    if action == "paste:" || action == "select:" || action == "selectAll:" {
      return false
    }
    return super.canPerformAction(action, withSender: sender)
  }
}


