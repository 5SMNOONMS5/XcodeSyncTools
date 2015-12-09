


import UIKit
import Foundation

class AlertViewController{
    
    var alertController : UIAlertController!
    
    func initAlertViewController(){
      
      <#  Title  #>
      
        alertController = UIAlertController(title: "<#  Title  #>", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {
            (paramAction:UIAlertAction!) in self.actionCancel()
        }))
        
        alertController.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: {
            (paramAction:UIAlertAction!) in self.actionConfrim()
        }))
    }
    
    func actionCancel(){
        alertController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func actionConfrim(){
        
    }
}

