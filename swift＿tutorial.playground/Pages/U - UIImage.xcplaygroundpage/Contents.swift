
import Foundation
import UIKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "safari")
        let imageView = UIImageView(image: img)
        //選擇內容模式
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.frame = view.bounds
        imageView.center = view.center
        view.addSubview(imageView)
    }
    
}


