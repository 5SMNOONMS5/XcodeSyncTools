
import UIKit

class viewcontroller: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    //Countdown five second
    registerNotificationforSecond(second: 5.0,message: "Boom!")
    
    //Specify date
    registerLocalNotificationForDate(time: "2015-12-25", message: "Merry Christmas")
    
    //Determine whether there is notification
    let setting = UIApplication.sharedApplication().currentUserNotificationSettings()
    
    if UIUserNotificationType.None == setting?.types{
      //Open
    }else{
      //Close
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    
    super.viewWillAppear(animated)
    
    //註冊推播
    let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
    UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    
  }
  
  func registerNotificationforSecond(second second: Double, message : String ){
    
    let notification:UILocalNotification = UILocalNotification()
    
    notification.alertBody = message
    
    notification.applicationIconBadgeNumber = 1
    
    notification.fireDate = NSDate(timeIntervalSinceNow: second)
    
    UIApplication.sharedApplication().scheduleLocalNotification(notification)
  }
  
  func registerLocalNotificationForDate(time time : String, message : String ) {
    
    //e.g. 2015-9-10 17:25
    let dateComp = NSDateComponents()
    let t = time.componentsSeparatedByString("-") as [String]
    let t1 = t[2].componentsSeparatedByString(" ") as [String]
    let t2 = t1[1].componentsSeparatedByString(":") as [String]
    
    dateComp.year = Int(t[0])!
    dateComp.month = Int(t[1])!
    dateComp.day = Int(t1[0])!
    dateComp.hour = Int(t2[0])!
    dateComp.minute = Int(t2[1])!
    dateComp.second = 0;
    dateComp.timeZone = NSTimeZone(forSecondsFromGMT: 28800)
    
    let calender = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
    
    let date = calender.dateFromComponents(dateComp)!
    
    //註冊推播
    let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
    UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    
    //推播內容及推播時間
    let notification:UILocalNotification = UILocalNotification()
    notification.alertBody = message
    notification.applicationIconBadgeNumber = 1
    notification.fireDate = date
    UIApplication.sharedApplication().scheduleLocalNotification(notification)
  }
}

// Set below function in AppleDelegate
func applicationDidBecomeActive(application:UIApplication) {
  // 回到app時，將badge設回0，刪除在app icon上的數字
  application.applicationIconBadgeNumber = 0
}


