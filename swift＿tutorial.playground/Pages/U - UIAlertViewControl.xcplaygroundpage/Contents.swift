
import Foundation
import UIKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(animated: Bool) {
    
    let itemsToShare = [
      "Items1" as NSString,
      "Items2" as NSString,
      "Items3" as NSString
    ]
    
    let activityControl = UIActivityViewController(activityItems: itemsToShare, applicationActivities: [StringReverserActivity()])
    
    presentViewController(activityControl, animated: true, completion: nil)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

class StringReverserActivity:UIActivity{
  
  var activityItems = [NSString]()
  
  //activity的唯一識別碼
  override func activityType() -> String? {
    
    return NSBundle.mainBundle().bundleIdentifier!+".StringReverserActivity"
  }
  
  //顯示的文字
  override func activityTitle() -> String? {
    return "Reverse String"
  }
  
  //顯示的圖片
  override func activityImage() -> UIImage? {
    return UIImage(named: "Reverser")!
  }
  
  //當由activity所組成的陣列被傳到activity view controller的建構器時，這個陣列就會被設定
  override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
    for object:AnyObject in activityItems{
      if object is String{
        return true
      }
    }
    return false
  }
  
  //canPerformWithActivityItems回傳true時，呼叫此方法
  override func prepareWithActivityItems(paramActivityItems: [AnyObject]) {
    for object : AnyObject in paramActivityItems{
      if object is String{
        activityItems.append(object as! String)
      }
    }
  }
  
  //當iOS希望你在之前所提供的那些任意物件上實際執行動作時，這個方法就會被呼叫
  override func performActivity() {
    var reversedStrings = ""
    
    for string in activityItems{
      reversedStrings += (reverseOfString(string as String))+"\n"
    }
    
    print(reversedStrings)
  }
  
  
  func reverseOfString(string: String)->String{
    var result = ""
    var characters = [Character]()
    
    for character in string.characters {
      characters.append(character)
    }
    
    for character in characters.reverse(){
      result += "\(character)"
    }
    
    return result
  }
  
}


