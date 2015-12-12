
import UIKit

extension UIDevice{
//: ### Device UUID
  
  public class func deviceUUID() -> String {
    return UIDevice.currentDevice().identifierForVendor!.UUIDString
  }
  
//: ### System Name

  public class func systemName() -> String {
    return UIDevice.currentDevice().systemName
  }
  
//: ### System Version

  public class func systemVersion() -> String {
    return UIDevice.currentDevice().systemVersion
  }
  
//: ### Device Name
  
  public class func deviceName() -> String {
    return UIDevice.currentDevice().name
  }
  
//: ### Device Language
  
  public class func deviceLanguage() -> String {
    return NSBundle.mainBundle().preferredLocalizations[0]
  }
  
//: ### Device Language
  
  public class func deviceModelString() -> String {
    return DeviceList[deviceModel()] ?? deviceModel()
  }
  
//: ### Device Model
  
  public class func deviceModel() -> String {
    
    /* [XSI] Hardware type */
    var systemInfo = utsname()
    
    uname(&systemInfo)
 
    let machine = systemInfo.machine
    
    var identifier = ""
    
    let mirror = Mirror(reflecting: machine)
    
    for child in mirror.children {
      
      let value = child.value
      
      if let value = value as? Int8 where value != 0 {
        identifier.append(UnicodeScalar(UInt8(value)))
      }
    }
    return identifier
  }
  
//: ### Compare System Version
  
  public class func isSystemVersionOver(requiredVersion: String) -> Bool {
    
    switch systemVersion().compare(requiredVersion,
      options: NSStringCompareOptions.NumericSearch) {
      
    case .OrderedSame:
      print("curretn iOS device version is same as \(requiredVersion)")
      return true
    case .OrderedDescending:
      print("curretn iOS device version is greater than \(requiredVersion)")
      return true
    case .OrderedAscending:
      print("curretn iOS device version is less than \(requiredVersion)")
      return false
    }
  }
}

//: ### DeviceLists

private let DeviceList = [
  /* iPod 5 */          "iPod5,1": "iPod Touch 5",
  /* iPod 6 */          "iPod7,1": "iPod Touch 6",
  /* iPhone 4 */        "iPhone3,1":  "iPhone 4", "iPhone3,2": "iPhone 4", "iPhone3,3": "iPhone 4",
  /* iPhone 4S */       "iPhone4,1": "iPhone 4S",
  /* iPhone 5 */        "iPhone5,1": "iPhone 5", "iPhone5,2": "iPhone 5",
  /* iPhone 5C */       "iPhone5,3": "iPhone 5C", "iPhone5,4": "iPhone 5C",
  /* iPhone 5S */       "iPhone6,1": "iPhone 5S", "iPhone6,2": "iPhone 5S",
  /* iPhone 6 */        "iPhone7,2": "iPhone 6",
  /* iPhone 6 Plus */   "iPhone7,1": "iPhone 6 Plus",
  /* iPhone 6S */       "iPhone8,1": "iPhone 6S",
  /* iPhone 6S Plus */  "iPhone8,2": "iPhone 6S Plus",
  
  /* iPad 2 */          "iPad2,1": "iPad 2", "iPad2,2": "iPad 2", "iPad2,3": "iPad 2", "iPad2,4": "iPad 2",
  /* iPad 3 */          "iPad3,1": "iPad 3", "iPad3,2": "iPad 3", "iPad3,3": "iPad 3",
  /* iPad 4 */          "iPad3,4": "iPad 4", "iPad3,5": "iPad 4", "iPad3,6": "iPad 4",
  /* iPad Air */        "iPad4,1": "iPad Air", "iPad4,2": "iPad Air", "iPad4,3": "iPad Air",
  /* iPad Air 2 */      "iPad5,3": "iPad Air 2", "iPad5,4": "iPad Air 2",
  /* iPad Mini */       "iPad2,5": "iPad Mini", "iPad2,6": "iPad Mini", "iPad2,7": "iPad Mini",
  /* iPad Mini 2 */     "iPad4,4": "iPad Mini 2", "iPad4,5": "iPad Mini 2", "iPad4,6": "iPad Mini 2",
  /* iPad Mini 3 */     "iPad4,7": "iPad Mini 3", "iPad4,8": "iPad Mini 3", "iPad4,9": "iPad Mini 3",
  /* iPad Mini 4 */     "iPad5,1": "iPad Mini 4", "iPad5,2": "iPad Mini 4",
  /* iPad Pro */        "iPad6,7": "iPad Pro", "iPad6,8": "iPad Pro",
  /* AppleTV */         "AppleTV5,3": "AppleTV",
  /* Simulator */       "x86_64": "Simulator", "i386": "Simulator"
]

//: Example:

UIDevice.deviceUUID()

UIDevice.systemName()

UIDevice.deviceModelString()

UIDevice.isSystemVersionOver("7.1")


