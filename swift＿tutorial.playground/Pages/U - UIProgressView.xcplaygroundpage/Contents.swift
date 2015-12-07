import Foundation
import UIKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let progressView = UIProgressView(progressViewStyle: .Bar)
    progressView.center = view.center
    progressView.progress = 20.0/30.0
    progressView.trackTintColor = UIColor.lightGrayColor()
    progressView.tintColor = UIColor.blueColor()
    view.addSubview(progressView)
    
  }
  
}

