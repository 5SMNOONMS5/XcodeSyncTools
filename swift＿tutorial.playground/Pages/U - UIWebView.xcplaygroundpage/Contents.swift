
import Foundation
import UIKit

//Load HTML
let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Load HTML
    let myWebView = UIWebView(frame: view.bounds)
    let htmlString = "<br/>iOS <strong>Programming</strong>"
    myWebView.loadHTMLString(htmlString, baseURL: nil)
    view.addSubview(myWebView)
    
    //Load URL
    /* 再status bar底下描繪web view */
    var frame = view.bounds
    frame.origin.y = UIApplication.sharedApplication().statusBarFrame.height
    frame.size.height -= frame.origin.y
    
    let webView = UIWebView(frame: view.bounds)
    webView.delegate = self
    webView.scalesPageToFit = true
    
    let url = NSURL(string: "http://www.apple.com")
    let request = NSURLRequest(URL: url!)
    webView.loadRequest(request)
    view.addSubview(webView)
    
  }
  
}

// MARK: - UIWebViewDelegate
extension viewcontroller : UIWebViewDelegate{
  
  func webViewDidStartLoad(webView: UIWebView) {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
  }
  
  func webViewDidFinishLoad(webView: UIWebView) {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
  }
  
  func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
  }

}


