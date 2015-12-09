
import UIKit
import Foundation

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
    
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let label = UILabel(frame: CGRect(x: 80, y: 100, width: 200, height: 200))
    
    label.adjustsFontSizeToFitWidth = true
    label.numberOfLines = 0
    label.font = UIFont.boldSystemFontOfSize(15)
    label.textColor = UIColor.orangeColor()
    
    label.text = "The new Apple Developer Program combines everything you need to develop, distribute, and manage your apps on all Apple platforms into one single program, making it easier than ever to bring your creativity to over a billion customers around the world. Get your apps ready for the App Store on iPhone, iPad, Mac, and Apple Watch, by enrolling in the Apple Developer Program today."
    
    view.addSubview(label)
    
  }
  
  
}

