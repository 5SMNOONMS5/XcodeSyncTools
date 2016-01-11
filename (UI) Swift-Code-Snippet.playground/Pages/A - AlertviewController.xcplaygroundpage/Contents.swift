
import UIKit

class AlertViewController{
    
    var alertController : UIAlertController!
    
    func initAlertViewController(){
 
        alertController = UIAlertController(title: "<#  Title  #>", message: "<# message #>", preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "<#  Title  #>", style: .Default, handler: {
            (paramAction:UIAlertAction!) in self.actionCancel()
        }))
        
        alertController.addAction(UIAlertAction(title: "<#  Title  #>", style: .Default, handler: {
            (paramAction:UIAlertAction!) in self.actionConfrim()
        }))
    }
    
    func actionCancel(){
        alertController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func actionConfrim(){
        alertController.dismissViewControllerAnimated(true, completion: nil)
    }
}

