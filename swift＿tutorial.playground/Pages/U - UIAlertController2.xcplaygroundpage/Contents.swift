import Foundation
import MapKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定Alert View的title、message、style
       let controller = UIAlertController(title: "Please enter your username", message: "This is usually 10 characters long", preferredStyle: .Alert)
        
        //在Alert View加入TextField
        controller.addTextFieldWithConfigurationHandler({
            (textField:UITextField!) in textField.placeholder = "輸入您的帳號"
        })
        
        controller.addTextFieldWithConfigurationHandler({
            (textField:UITextField!) in textField.placeholder = "輸入您的密碼"
        })
        
        // action sheet(動作表單 按鈕)
        let action = UIAlertAction(title: "Next", style: .Default, handler: {
            (paramAction:UIAlertAction!) in
            if let textFields = controller.textFields{
                let theTextFields = textFields
                //textField的內容照順序以陣列顯示
                let account = theTextFields[0].text
                let password = theTextFields[1].text
                print("Your account is \(account)")
                print("Your password is \(password)")
            }
            })
        
        controller.addAction(action)
        
        //顯示 UIAlertController
        dispatch_async(dispatch_get_main_queue(), {
            self.presentViewController(controller, animated: true, completion: nil)
        })
    }
    
}
