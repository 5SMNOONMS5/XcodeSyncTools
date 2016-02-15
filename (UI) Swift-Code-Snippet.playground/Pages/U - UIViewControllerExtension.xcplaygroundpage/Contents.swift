
import UIKit

extension UIViewController {

//: ### All Notifications
  
  // MARK: - Notifications
  public func addNotificationObserver(name: String, selector: Selector) {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
  }
  
  public func removeNotificationObserver(name: String) {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: name, object: nil)
  }
  
  public func removeAllNotificationObserver() {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  public func postNotificationName(name: String) {
    NSNotificationCenter.defaultCenter().postNotificationName(name, object: nil)
  
  }
  
//: ### Notifications ( Keyborad Will Shown )
  //MARK: - Notifications ( Keyborad Will Shown )
  public func addKeyboardWillShowNotification() {
    self.addNotificationObserver(UIKeyboardWillShowNotification, selector: "keyboardWillShowNotification:");
  }
  
  public func removeKeyboardWillShowNotification() {
    self.removeNotificationObserver(UIKeyboardWillShowNotification);
  }
  
  public func keyboardWillShowNotification(notification: NSNotification) {
    let nInfo = notification.userInfo as! [String: NSValue]
    let value = nInfo[UIKeyboardFrameEndUserInfoKey]
    let frame = value?.CGRectValue()
    keyboardWillShowWithFrame(frame!)
  }
  
  public func keyboardWillShowWithFrame(frame: CGRect) {
    
  }
//: ### Notifications ( Keyborad Did Shown )
  //MARK: - Notifications ( Keyborad Did Shown )
  public func addKeyboardDidShowNotification() {
    self.addNotificationObserver(UIKeyboardDidShowNotification, selector: "keyboardDidShowNotification:");
  }
  
  public func removeKeyboardDidShowNotification() {
    self.removeNotificationObserver(UIKeyboardDidShowNotification);
  }
  
  public func keyboardDidShowNotification(notification: NSNotification) {
    let nInfo = notification.userInfo as! [String: NSValue]
    let value = nInfo[UIKeyboardFrameEndUserInfoKey]
    let frame = value?.CGRectValue()
    
    keyboardDidShowWithFrame(frame!)
  }
  
  public func keyboardDidShowWithFrame(frame: CGRect) {
    
  }
//: ### Notifications ( Keyborad Will Hidden )
  //MARK: - Notifications ( Keyborad Will Hidden )
  public func addKeyboardWillHideNotification() {
    self.addNotificationObserver(UIKeyboardWillHideNotification, selector: "keyboardWillHideNotification:");
  }
  
  public func removeKeyboardWillHideNotification() {
    self.removeNotificationObserver(UIKeyboardWillHideNotification);
  }

  public func keyboardWillHideNotification(notification: NSNotification) {
    let nInfo = notification.userInfo as! [String: NSValue]
    let value = nInfo[UIKeyboardFrameEndUserInfoKey]
    let frame = value?.CGRectValue()
    keyboardWillHideWithFrame(frame!)
  }
  
  public func keyboardWillHideWithFrame(frame: CGRect) {
  }

//: ### Notifications ( Keyborad Did Hidden )
  //MARK: - Notifications ( Keyborad Did Hidden )
  public func addKeyboardDidHideNotification() {
    self.addNotificationObserver(UIKeyboardDidHideNotification, selector: "keyboardDidHideNotification:");
  }
  
  public func removeKeyboardDidHideNotification() {
    self.removeNotificationObserver(UIKeyboardDidHideNotification);
  }
  
  public func keyboardDidHideNotification(notification: NSNotification) {
    let nInfo = notification.userInfo as! [String: NSValue]
    let value = nInfo[UIKeyboardFrameEndUserInfoKey]
    let frame = value?.CGRectValue()
    
    keyboardDidHideWithFrame(frame!)
  }
  
  public func keyboardDidHideWithFrame(frame: CGRect) {
  }
//: ### ViewController Flows
  // MARK: - ViewController Flows
  public func pushVC(vc: UIViewController) {
    navigationController?.pushViewController(vc, animated: true)
  }
  
  public func popVC() {
    navigationController?.popViewControllerAnimated(true)
  }
  
  public func presentVC(vc: UIViewController) {
    presentViewController(vc, animated: true, completion: nil)
  }
  
  public func dismissVC(completion completion: (() -> Void)? ) {
    dismissViewControllerAnimated(true, completion: completion)
  }
  
//: ### ViewController Container

  public var navigationBarColor: UIColor? {
    get {
      if let me = self as? UINavigationController {
        return me.visibleViewController!.navigationBarColor
      }
      return navigationController?.navigationBar.tintColor
    }
    set(value) {
      navigationController?.navigationBar.barTintColor = value
    }
  }
//: ### Go to setting
  
  public func gotoSetting(){
    let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
    UIApplication.sharedApplication().openURL(settingsUrl!)
  }

  
}

