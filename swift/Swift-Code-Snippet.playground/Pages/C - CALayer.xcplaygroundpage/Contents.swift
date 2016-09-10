
import UIKit

//: ### Convert Hex Code Into Color
let a : CGFloat = 10

fabs(a)

class vc: UIView {
    
    func addGradient() {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRectMake(0, 0, 10, 10)
        gradient.colors = [UIColor.blackColor(),
                           UIColor.redColor(),
                           UIColor.greenColor()]
        layer.insertSublayer(gradient, atIndex: 0)
    }
}



