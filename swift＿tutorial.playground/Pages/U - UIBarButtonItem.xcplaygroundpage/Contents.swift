import Foundation
import UIKit

//Left
let imageView = UIImageView(image: UIImage(named: "1"))

//Right
let imageView2 = UIImageView(image: UIImage(named: "2"))

class viewcontroller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Left
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: "back"), forState: UIControlState.Normal)
        btn.frame = CGRectMake(0, 0, 48, 48)
        btn.addTarget(self, action: "backEvent", forControlEvents: UIControlEvents.TouchUpInside)
        let leftBtn = UIBarButtonItem(customView: btn)
        navigationItem.leftBarButtonItem = leftBtn
        
        //Right
        let items = ["Up","Down"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.momentary = true
        segmentedControl.addTarget(self, action: "segmentedControlTapped:", forControlEvents: UIControlEvents.ValueChanged)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentedControl)
    }
    
    func backEvent(){
        navigationController?.popViewControllerAnimated(true)
    }
    
    func segmentedControlTapped(sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            print("You were pressed up")
        }else{
            print("You were pressed down")
        }
    }
    
}

