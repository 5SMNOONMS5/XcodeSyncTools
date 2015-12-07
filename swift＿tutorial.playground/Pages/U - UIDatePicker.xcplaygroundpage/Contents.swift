

import Foundation
import MapKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController {
  
  var datePicker: UIDatePicker!
  var dateLocale : NSLocale!
  var label:UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    label = UILabel(frame: CGRect(x: 70, y: 120, width: 120, height: 30))
    label.text = "test"
    self.view.addSubview(label)
    
    datePicker = UIDatePicker()
    datePicker.center = view.center
    
    //選擇日期模式
    datePicker.datePickerMode = UIDatePickerMode.Date
    
    //選擇繁體中文
    dateLocale = NSLocale(localeIdentifier: "zh_TW")
    datePicker.locale = dateLocale
    
    //設定選項變更事件
    datePicker.addTarget(self, action: "datePickerDateChanged:", forControlEvents: UIControlEvents.ValueChanged)
    
    self.view.addSubview(datePicker)
  }
  
  func datePickerDateChanged(datePicker: UIDatePicker){
    
    //設定取值格式
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    //取出的時間套用設定好的格式
    let dateString = formatter.stringFromDate(datePicker.date)
    
    label.text = dateString
  }
  
}




