

import UIKit

//Load HTML

let imageView = UIImageView(image: UIImage(named: "1"))

internal let stringHTML = "<br/>iOS <strong>Programming</strong>"

internal let stringURL = "http://www.apple.com"

class VC: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    //Load HTML
    let myWebView = UIWebView(frame: view.bounds)
    
    myWebView.loadHTMLString(stringHTML, baseURL: nil)

    /* Load URL 再 status bar 底下描繪 web view */
    var frame = view.bounds
    
    frame.origin.y = UIApplication.sharedApplication().statusBarFrame.height
    
    frame.size.height -= frame.origin.y
    
    let webView = UIWebView(frame: view.bounds)
    
    webView.delegate = self
    
    webView.scalesPageToFit = true
    
    let request = NSURLRequest(URL: NSURL(string: stringURL)!)
    
    webView.loadRequest(request)
    
    view.addSubview(webView)
  }
  
}

// MARK: - UIWebViewDelegate
extension VC : UIWebViewDelegate{
  
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


