
import UIKit

class VC: UIViewController {
  
  /* 捲動：手離開螢幕，但是內容還繼續的移動
     拖動：手不離開螢幕的移動內容 */
  
  var imageView: UIImageView!
  
  var scrollView: UIScrollView!
  
  let image = UIImage(named: "safari")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView = UIImageView(image: image)
    
    scrollView = UIScrollView(frame: view.bounds)
    
    if let theScrollView = scrollView{
      
      theScrollView.addSubview(imageView)
      
      theScrollView.contentSize = imageView.bounds.size
      
      theScrollView.delegate = self
      
      theScrollView.indicatorStyle = .White
      
      view.addSubview(theScrollView)
    }
    
  }
}

// MARK: - UIScrollViewDelegate
extension VC : UIScrollViewDelegate{
  
  /* 使用者捲動或拖動時呼叫 */
  func scrollViewDidScroll(scrollView: UIScrollView) {
    scrollView.alpha = 0.50
  }
  
  /* 捲動結束後呼叫 */
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    scrollView.alpha = 1
  }
  
  /* 拖動結束後呼叫 */
  func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    scrollView.alpha = 1
  }

}
