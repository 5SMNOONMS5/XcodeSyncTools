
import UIKit

class VC: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    //UISwitch寬高已經是固定的，不需要在設定
    let mySwitch = UISwitch(frame: CGRect(x: 100, y: 100, width: 0, height: 0))
    mySwitch.setOn(true, animated: true)
    mySwitch.addTarget(self, action: "switchIsChanged:", forControlEvents: .ValueChanged)
    self.view.addSubview(mySwitch)
  }
  
  func switchIsChanged(sender: UISwitch){
    print("Sender is \(sender)")
    if sender.on{ print("The switch is turned on") }
    else{ print("The switch is turned off") }
  }
  
}



