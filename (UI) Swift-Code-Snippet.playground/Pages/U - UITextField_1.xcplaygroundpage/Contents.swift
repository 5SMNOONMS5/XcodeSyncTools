import Foundation
import UIKit

// 鍵盤不擋住UITextField

class viewcontroller : UIViewController{
  
  var mtf = UITextField()
  var kbSize : CGSize!
  var keyboardIsHidden = false
  var beforeMove : CGFloat = 0.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let myTextField = UITextField()
    myTextField.delegate = self
    view.addSubview(myTextField)
    
    //監聽鍵盤顯示通知
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleKeyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
    
    //監聽鍵盤消失通知
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleKeyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

  }
  
  func handleKeyboardDidShow(notification: NSNotification){
    var viewFrame = self.view.frame
    var info = notification.userInfo!
    kbSize = info[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue.size
    let mtfY = mtf.frame.origin.y + mtf.frame.size.height
    let surplus = viewFrame.height - mtfY
    
    /***
    如果View的高度 - UITextField的Y及高度 >= 鍵盤的高度，
    表示UITextField下方的空間還有能容納鍵盤的位置，就不需要
    調整View的位置。
    ***/
    if surplus >= kbSize.height{
      return
    }
    
    if !keyboardIsHidden {
      keyboardIsHidden = true
      let moveY = kbSize.height - surplus
      beforeMove = moveY
      viewFrame.origin.y -= moveY
      self.view.frame = viewFrame
      let animationDuration : NSTimeInterval = 0.30
      UIView.beginAnimations("ResizeView", context: nil)
      UIView.setAnimationDuration(animationDuration)
      self.view.frame = viewFrame
      UIView.commitAnimations()
    }
  }
  
  func handleKeyboardWillHide(notification: NSNotification){
    
    if keyboardIsHidden {
      keyboardIsHidden = false
      var viewFrame = self.view.frame
      viewFrame.origin.y += beforeMove
      self.view.frame = viewFrame
      
      let animationDuration : NSTimeInterval = 0.30
      UIView.beginAnimations("ResizeView", context: nil)
      UIView.setAnimationDuration(animationDuration)
      self.view.frame = viewFrame
      UIView.commitAnimations()
    }
  }
}

// MARK: - UITextFieldDelegate
extension viewcontroller : UITextFieldDelegate{
  func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
    mtf = textField
    return true
  }
}

