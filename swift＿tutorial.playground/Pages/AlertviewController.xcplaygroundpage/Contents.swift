//: [Previous](@previous)

import Foundation
import UIKit


class AlertViewController{
    
    var alertController : UIAlertController!
    
    func initAlertViewController(){
        
        alertController = UIAlertController(title: "CreateBlog", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
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




//: [Next](@next)
