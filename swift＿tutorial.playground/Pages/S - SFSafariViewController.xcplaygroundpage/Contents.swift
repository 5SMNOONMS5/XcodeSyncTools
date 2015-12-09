import UIKit
import Foundation
import SafariServices

// After
let imageView1 = UIImageView(image: UIImage(named: "1"))

// Before
let imageView2 = UIImageView(image: UIImage(named: "2"))

// URL 
internal let stringURL = "https://en.wikipedia.org/wiki/Cupertino,_California"

class viewcontroller: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    //設定網址及是否使用「閱讀器」
    let safariVC = SFSafariViewController(URL:NSURL(string: stringURL)!, entersReaderIfAvailable: false)
    
    safariVC.delegate = self
    self.presentViewController(safariVC, animated: true, completion: nil)
  }
}

// MARK: - SFSafariViewControllerDelegate

extension viewcontroller : SFSafariViewControllerDelegate{
  
  //關閉  SFSafariViewController

  func safariViewControllerDidFinish(controller: SFSafariViewController) {
    controller.dismissViewControllerAnimated(true, completion: nil)
  }
}



