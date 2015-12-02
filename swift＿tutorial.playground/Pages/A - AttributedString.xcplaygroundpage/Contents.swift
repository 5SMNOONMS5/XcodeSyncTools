
import UIKit
import Foundation

var myMutableString = NSMutableAttributedString()


myMutableString = NSMutableAttributedString(
    string: "I Love Pizza!",
    attributes: [NSFontAttributeName:UIFont(
        name: "Georgia",
        size: 18.0)!])


myMutableString.addAttribute(NSBackgroundColorAttributeName,
    value: UIColor.greenColor(),
    range: NSRange(location: 0,length: myMutableString.length))



myMutableString.addAttribute(NSFontAttributeName,
    value: UIFont(
        name: "Chalkduster",
        size: 24.0)!,
    range: NSRange(location: 7,length: 5))


myMutableString.addAttribute(NSForegroundColorAttributeName,
    value: UIColor.redColor(),
    range: NSRange(location:2,length:4))


myMutableString.addAttribute(NSStrokeWidthAttributeName,
    value: 2,
    range: NSRange(
        location: 0,
        length: 1))

