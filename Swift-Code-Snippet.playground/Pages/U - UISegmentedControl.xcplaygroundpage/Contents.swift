

import UIKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let segments = ["iPhone","iPad","iPod","iMac"];
    
    let segmented = UISegmentedControl(items: segments)
    
    //按鈕選取後會立即消失被選取狀態
    segmented.momentary = true
    
    segmented.center = view.center
    
    segmented.addTarget(self, action: "segmentedValueChanged:", forControlEvents: .ValueChanged)
    segmented.addTarget(<#T##target: AnyObject?##AnyObject?#>, action: "segmentedValueChanged:", forControlEvents: .ValueChanged)
    
    self.view.addSubview(segmented)
    
  }
  
  func segmentedValueChanged(sender:UISegmentedControl){
    
    let selectedIndex = sender.selectedSegmentIndex
    
    print("取得被選取的index = \(selectedIndex)")
    
    let selectedText = sender.titleForSegmentAtIndex(selectedIndex)
    
    print("藉由被選取的index來取得文字內容 =\(selectedText)")
    
  }
  
}


