import Foundation
import UIKit

class viewcontroller: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //啟動照相功能
    useCamera()
    
    //啟動相簿功能
    useAlbum()
    
  }
  
  func useCamera(){
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .Camera
    imagePicker.showsCameraControls = true
    self.presentViewController(imagePicker, animated: true, completion: nil)
  }
  
  func useAlbum(){
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .SavedPhotosAlbum
    self.presentViewController(imagePicker, animated: true, completion: nil)
  }
  
  func imageResize(originImg: UIImage,scaledToSize newSize: CGSize)->UIImage{
    
    UIGraphicsBeginImageContext(newSize)
    originImg.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
    let newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg
  }
  
  func fixImageOrientation(src:UIImage)->UIImage {
    
    if src.imageOrientation == UIImageOrientation.Up {
      return src
    }
    
    var transform: CGAffineTransform = CGAffineTransformIdentity
    
    switch src.imageOrientation {
    case UIImageOrientation.Down, UIImageOrientation.DownMirrored:
      transform = CGAffineTransformTranslate(transform, src.size.width, src.size.height)
      transform = CGAffineTransformRotate(transform, CGFloat(M_PI))
      break
    case UIImageOrientation.Left, UIImageOrientation.LeftMirrored:
      transform = CGAffineTransformTranslate(transform, src.size.width, 0)
      transform = CGAffineTransformRotate(transform, CGFloat(M_PI_2))
      break
    case UIImageOrientation.Right, UIImageOrientation.RightMirrored:
      transform = CGAffineTransformTranslate(transform, 0, src.size.height)
      transform = CGAffineTransformRotate(transform, CGFloat(-M_PI_2))
      break
    case UIImageOrientation.Up, UIImageOrientation.UpMirrored:
      break
    }
    
    switch src.imageOrientation {
    case UIImageOrientation.UpMirrored, UIImageOrientation.DownMirrored:
      CGAffineTransformTranslate(transform, src.size.width, 0)
      CGAffineTransformScale(transform, -1, 1)
      break
    case UIImageOrientation.LeftMirrored, UIImageOrientation.RightMirrored:
      CGAffineTransformTranslate(transform, src.size.height, 0)
      CGAffineTransformScale(transform, -1, 1)
    case UIImageOrientation.Up, UIImageOrientation.Down, UIImageOrientation.Left, UIImageOrientation.Right:
      break
    }
    
    let ctx:CGContextRef = CGBitmapContextCreate(nil, Int(src.size.width), Int(src.size.height), CGImageGetBitsPerComponent(src.CGImage), 0, CGImageGetColorSpace(src.CGImage), CGImageAlphaInfo.PremultipliedLast.rawValue)!
    
    CGContextConcatCTM(ctx, transform)
    
    switch src.imageOrientation {
    case UIImageOrientation.Left, UIImageOrientation.LeftMirrored, UIImageOrientation.Right, UIImageOrientation.RightMirrored:
      CGContextDrawImage(ctx, CGRectMake(0, 0, src.size.height, src.size.width), src.CGImage)
      break
    default:
      CGContextDrawImage(ctx, CGRectMake(0, 0, src.size.width, src.size.height), src.CGImage)
      break
    }
    
    let cgimg:CGImageRef = CGBitmapContextCreateImage(ctx)!
    let img:UIImage = UIImage(CGImage: cgimg)
    
    return img
  }
  
  
}

// MARK: - UIImagePickerControllerDelegate
extension viewcontroller : UIImagePickerControllerDelegate{
  
  //取得照片
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
    //離開拍照畫面
    picker.dismissViewControllerAnimated(true, completion: nil)
    
    var img = info[UIImagePickerControllerOriginalImage] as? UIImage
    
    //照片來源是相機則存入相簿
    if(picker.sourceType == .Camera){
      UIImageWriteToSavedPhotosAlbum(img!, self, nil, nil)
    }
    
    
    //修正照片角度
    img = fixImageOrientation(img!)
    
    //設定照片寬高
    if img!.size.height > 1024 || img!.size.width > 1024{
      if img!.size.height > img!.size.width{
        img = imageResize(img!, scaledToSize: CGSizeMake(768, 1024))
      }else{
        img = imageResize(img!, scaledToSize: CGSizeMake(1024, 768))
      }
    }
    
    //照片壓縮
    let imgData = UIImageJPEGRepresentation(img!, 0.5)
    
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    picker.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
}

// MARK: - UINavigationControllerDelegate
extension viewcontroller : UINavigationControllerDelegate{
  func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
    
    
  }
  
  func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
    
  }
}




