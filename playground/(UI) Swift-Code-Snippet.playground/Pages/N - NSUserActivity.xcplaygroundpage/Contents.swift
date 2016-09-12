

import UIKit

let imageView = UIImageView(image: UIImage(named: "1"))

class VC: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let myActivity = NSUserActivity(activityType: "com.appcoda.searchAPIs.detail")
    
    myActivity.title = "Cupertino"
    
    myActivity.eligibleForSearch = true
    
    myActivity.keywords = Set(arrayLiteral: "Cupertino", "Silicon Valley", "California", "San Jose", "San Francisco", "Apple Inc", "Mothership")
    
    self.userActivity = myActivity
    
    myActivity.eligibleForHandoff = false
    
    myActivity.becomeCurrent()
    
  }
}





