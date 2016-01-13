
import UIKit

let view = UIView()

let label = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
label.adjustsFontSizeToFitWidth = true
label.numberOfLines = 0
label.font = UIFont.boldSystemFontOfSize(15)
label.textColor = UIColor.orangeColor()
label.text = "text"
label.text = NSNumberFormatter().currencySymbol   //錢的符號"$"
label.textAlignment = .Right
label.sizeToFit()
view.addSubview(label)
