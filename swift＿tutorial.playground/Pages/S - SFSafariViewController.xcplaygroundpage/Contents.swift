import UIKit
import Foundation
import SafariServices

//Use After
let imageView1 = UIImageView(image: UIImage(named: "1"))

//Use Before
let imageView2 = UIImageView(image: UIImage(named: "2"))

class viewcontroller: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //設定網址及是否使用「閱讀器」
    let safariVC = SFSafariViewController(URL:NSURL(string: "https://en.wikipedia.org/wiki/Cupertino,_California")!, entersReaderIfAvailable: false)
    
    safariVC.delegate = self
    self.presentViewController(safariVC, animated: true, completion: nil)
    
  }
  
}

// MARK: - SFSafariViewControllerDelegate
extension viewcontroller : SFSafariViewControllerDelegate{
  
  //關閉SFSafariViewController
  func safariViewControllerDidFinish(controller: SFSafariViewController) {
    controller.dismissViewControllerAnimated(true, completion: nil)
  }
  
}



