
import UIKit

class viewcontroller: UIViewController {
    
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let label = UILabel(frame: CGRect(x: <#  float #>, y: <#  float #>, width: <#  float #>, height: <#  float #>))
    label.adjustsFontSizeToFitWidth = true
    label.numberOfLines = 0
    label.font = UIFont.boldSystemFontOfSize(15)
    label.textColor = UIColor.orangeColor()
    label.text = "<# text #>"
    label.text = NSNumberFormatter().currencySymbol   //錢的符號"$"
    label.textAlignment = .Right
    label.sizeToFit()
    view.addSubview(label)
    
    
    
  }
}

