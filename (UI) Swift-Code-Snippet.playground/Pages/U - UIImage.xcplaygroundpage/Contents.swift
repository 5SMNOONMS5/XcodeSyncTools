
import UIKit

let view = UIView()

let imageView = UIImageView(image: UIImage(named: "imageName"))
imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
imageView.contentMode = UIViewContentMode.ScaleAspectFit
imageView.frame = view.bounds
imageView.center = view.center
imageView.backgroundColor = UIColor.blackColor()
view.addSubview(imageView)

