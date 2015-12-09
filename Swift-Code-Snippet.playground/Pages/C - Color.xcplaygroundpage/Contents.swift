
import UIKit

extension UIColor{
  
//: ### Convenience Method For Hex Color

  public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
  }
  
//: ### Get Red Component Form HexColor
  
  public var redComponent: Int {
    var r: CGFloat = 0
    getRed(&r, green: nil, blue: nil, alpha: nil)
    return Int(r * 255)
  }
  
//: ### Get Green Component Form HexColor
  
  public var greenComponent: Int {
    var g: CGFloat = 0
    getRed(nil, green: &g, blue: nil, alpha: nil)
    return Int(g * 255)
  }
  
//: ### Get Blue Component Form HexColor
  
  public var blueComponent: Int {
    var b: CGFloat = 0
    getRed(nil, green: nil, blue: &b, alpha: nil)
    return Int(b * 255)
  }
  
//: ### Get Alpha Component Form HexColor
  
  public var alpha: Int {
    var a: CGFloat = 0
    getRed(nil, green: nil, blue: nil, alpha: &a)
    return Int(a)
  }
}
