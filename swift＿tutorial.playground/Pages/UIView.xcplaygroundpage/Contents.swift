
import UIKit


class vc : UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//: ### Remove Subviews

        let subViews = self.view.subviews
        
        for subview in subViews{
            if subview is UITableView {
                subview.removeFromSuperview()
            }
        }
    }
}


