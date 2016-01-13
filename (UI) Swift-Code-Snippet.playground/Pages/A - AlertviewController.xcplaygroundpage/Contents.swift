
import UIKit

var alertController : UIAlertController?

class AlertViewController{
  
  func initAlertViewController(){
    
    alertController = UIAlertController(title: "<#  Title  #>", message: "<# message #>", preferredStyle: .Alert)
    
    alertController!.addAction(UIAlertAction(title: "<#  Title  #>", style: .Default, handler: {
      (paramAction:UIAlertAction!) in self.actionCancel()
    }))
    
    alertController!.addAction(UIAlertAction(title: "<#  Title  #>", style: .Default, handler: {
      (paramAction:UIAlertAction!) in self.actionConfrim()
    }))
  }
  
  func actionCancel(){
    alertController!.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func actionConfrim(){
    alertController!.dismissViewControllerAnimated(true, completion: nil)
  }
  
  //add TextField
  func addAccountTextFiled(){
    alertController!.addTextFieldWithConfigurationHandler({
      (textField:UITextField!) in textField.placeholder = "輸入您的帳號"
    })
  }
  
  //add TextField
  func addPasswordTextFiled(){
    alertController!.addTextFieldWithConfigurationHandler({
      (textField:UITextField!) in textField.placeholder = "輸入您的密碼"
    })
  }
  
  // Action Sheet(動作表單 按鈕)
  func addActionSheet(){
    let action = UIAlertAction(title: "Next", style: .Default, handler: {
      (paramAction:UIAlertAction!) in
      
      if let textFields = alertController!.textFields{
        let account = textFields[0].text
        let password = textFields[1].text
        print("Your account is \(account)")
        print("Your password is \(password)")
      }
    })
    alertController!.addAction(action)
  }
}

