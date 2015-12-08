

import Foundation
import MapKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
  
  
  var textField: UITextField!
  var buttonShare : UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createButton()
    createTextField()
    
    
  }
  
  func createTextField(){
    textField = UITextField(frame: CGRect(x: 20, y: 35, width: 280, height: 30))
    textField.borderStyle = UITextBorderStyle.RoundedRect
    textField.placeholder = "請輸入分享文字..."
    textField.delegate = self
    view.addSubview(textField)
  }
  
  func createButton(){
    buttonShare = UIButton(type: UIButtonType.System)
    buttonShare.frame = CGRect(x: 20, y: 80, width: 280, height: 44)
    buttonShare.setTitle("分享", forState: UIControlState.Normal)
    buttonShare.addTarget(self, action: "handleShare:", forControlEvents: UIControlEvents.TouchUpInside)
    view.addSubview(buttonShare)
  }
  
  func handleShare(sender: UIButton){
    
    if(textField.text!.isEmpty){
      
      let alertControl = UIAlertController(title: nil, message: "請輸入內容再分享", preferredStyle: UIAlertControllerStyle.Alert)
      
      alertControl.addAction(UIAlertAction(title: "確定", style: UIAlertActionStyle.Default, handler: nil))
      
      presentViewController(alertControl, animated: true, completion: nil)
      
      return
    }
    
    /*將你的字串強制轉型(cast)為NSString是非常重要的一步，如果沒有這樣做，
    控制器將無法顯示適當的分享選項*/
    let activityViewControl = UIActivityViewController(activityItems: [NSString(string: textField.text!)], applicationActivities: nil)
    
    presentViewController(activityViewControl, animated: true, completion: {})
    
  }
  
  
}


// MARK: - UITextFieldDelegate
extension viewcontroller : UITextFieldDelegate {
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    //離開第一響應，意指將鍵盤收回
    textField.resignFirstResponder()
    return true
  }

}




