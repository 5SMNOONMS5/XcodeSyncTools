
import UIKit

class viewcontroller: UIViewController {
    
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let imageView = UIImageView(image: UIImage(named: "safari"))
    imageView.frame = CGRect(x: <#  float #>, y: <#  float #>, width: <#  float #>, height: <#  float #>)
    imageView.contentMode = UIViewContentMode.ScaleAspectFit
    imageView.frame = view.bounds
    imageView.center = view.center
    imageView.backgroundColor = UIColor.blackColor()
    view.addSubview(imageView)
  }
  
}


