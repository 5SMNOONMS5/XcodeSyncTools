
import Foundation
import UIKit

let imageView = UIImageView(image: UIImage(named: "1"))

class viewcontroller: UIViewController{
  var picker : UIPickerView!
  var label : UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    label = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 30))
    label.text = "test"
    self.view.addSubview(label)
    
    picker = UIPickerView()
    picker.center = view.center;
    picker.dataSource = self;
    picker.delegate = self;
    self.view.addSubview(picker)
    
  }
  
}

// MARK: - UIPickerViewDelegate
extension viewcontroller : UIPickerViewDelegate{
  
  //填充各個元件row的資料
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return "台南\(row+1)"
  }

  //滾動到某個row會觸發
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    label.text = "台南\(row+1)"
  }

}

// MARK: - UIPickerViewDataSource
extension viewcontroller : UIPickerViewDataSource{

  //回傳需要幾個元件(欄)
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    if pickerView == picker{
      return 1
    }
    return 0
  }
  
  //回傳每個元件各需多少(列)
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView == picker{
      return 10
    }
    return 0
  } 
}

