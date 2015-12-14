import Foundation
import UIKit

class viewcontroller: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    //啟動照相功能
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .Camera
    imagePicker.showsCameraControls = true
    self.presentViewController(imagePicker, animated: true, completion: nil)
  }
}

// MARK: - UIImagePickerControllerDelegate
extension viewcontroller : UIImagePickerControllerDelegate{
  
  //取得照片
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
    //離開拍照畫面
    picker.dismissViewControllerAnimated(true, completion: nil)
    
    let img = info[UIImagePickerControllerOriginalImage] as? UIImage
    print("This is your image: \(img)")
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    picker.dismissViewControllerAnimated(true, completion: nil)
    navigationController?.popViewControllerAnimated(true)
  }
  
}

// MARK: - UINavigationControllerDelegate
extension viewcontroller : UINavigationControllerDelegate{
  func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
    
    
  }
  
  func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
    
  }
}



