

import Foundation
import MapKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
  
  var label : UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    label = UILabel(frame: CGRect(x: 130, y: 120, width: 120, height: 30))
    self.view.addSubview(label)

    //按鈕選取後會立即消失被選取狀態
    //segmented.momentary = true
    
    let segments = ["iPhone","iPad","iPod","iMac"];
    let segmented = UISegmentedControl(items: segments)
    segmented.center = view.center
    segmented.addTarget(self, action: "segmentedValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    self.view.addSubview(segmented)
    
  }
  
  func segmentedValueChanged(sender:UISegmentedControl){
    
    //取得被選取的index
    let selectedIndex = sender.selectedSegmentIndex
    
    //藉由被選取的index來取得文字內容
    let selectedText = sender.titleForSegmentAtIndex(selectedIndex)
    
    label.text = selectedText
  }
  
}




