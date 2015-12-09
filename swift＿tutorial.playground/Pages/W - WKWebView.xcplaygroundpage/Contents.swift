
import UIKit
import WebKit

internal let stringURL = "http://www.apple.com"

class viewcontroller: UIViewController {
    
  var webView : WKWebView?
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    /* 建立編號設定，設定網頁被載入的方式 */
    let preferences = WKPreferences()
    
    preferences.javaScriptEnabled = false
    
    /* 為編號設定建立一個組態(configuration) */
    let configuration = WKWebViewConfiguration()
    
    configuration.preferences = preferences
    
    webView = WKWebView(frame: view.bounds, configuration: configuration)
    
    if let theWebView = webView{
      
      let urlRequest = NSURLRequest(URL: NSURL(string: stringURL)! )
      
      theWebView.loadRequest(urlRequest)
      
      theWebView.navigationDelegate = self
      
      view.addSubview(theWebView)
    }
  }
}


// MARK: - WKNavigationDelegate
extension viewcontroller : WKNavigationDelegate{
  
  /* 在網頁視圖載入時，啟動進度條 */
  func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
  }
  
  /* 載入完畢，停止進度條 */
  func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
  }
  
  /* 在網頁上的任何動作發生，都會觸發這一段 */
  func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
    
    /* 不允許連結被點 */
    if navigationAction.navigationType == .LinkActivated{
      
      decisionHandler(.Cancel)
      
      let alertController = UIAlertController(title: "動作不被允許", message: "抱歉！點擊連結被禁止。", preferredStyle: .Alert)
      
      alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
      
      presentViewController(alertController, animated: true, completion: nil)
      
      return
    }
    
    decisionHandler(.Allow)
  }
  
}



