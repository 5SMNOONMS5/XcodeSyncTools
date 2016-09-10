
import UIKit

let view = UIView()

let imageView = UIImageView(image: UIImage(named: "imageName"))
imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
imageView.contentMode = UIViewContentMode.ScaleAspectFit
imageView.frame = view.bounds
imageView.center = view.center
imageView.backgroundColor = UIColor.blackColor()
view.addSubview(imageView)


//: ### Extension

extension UIImage{
  
  
  class func imageWithColor(color: UIColor) -> UIImage {
    
    let rect = CGRectMake(0, 0, 1, 1)
    // Create a 1 by 1 pixel content
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    color.setFill()
    UIRectFill(rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
  }
}