
import UIKit

class viewcontroller: UIViewController {
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    /**  engage  UIImagePickerController  */
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .Camera
    imagePicker.allowsEditing = false
    imagePicker.showsCameraControls = true
    self.presentViewController(imagePicker, animated: true, completion: nil)
  }
}

// MARK: - UIImagePickerControllerDelegate
extension viewcontroller : UIImagePickerControllerDelegate{
  
  /**  take  photo  */
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
    /**  leave  UIImagePickerController  */
    picker.dismissViewControllerAnimated(true, completion: nil)
    
    let img = info[UIImagePickerControllerOriginalImage] as? UIImage
    print("This is your image: \(img)")
  }
  
  /**  Dismiss  UIImagePickerController  */
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



