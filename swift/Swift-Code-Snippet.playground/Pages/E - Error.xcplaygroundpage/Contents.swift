
import UIKit

enum NameErrorType: ErrorType{
  case Empty
  case ISNumber
}

class VC : UIViewController{
  
  override func viewDidLoad(){
    super.viewDidLoad()
    
    do{
      let result = try getUserFullName("Stephen",lastName:"Chen")
      print(result)
    }catch NameErrorType.Empty{
      print("空白")
    }catch NameErrorType.ISNumber{
      print("輸入了數字")
    }catch {
      print("something worng")
    }
  }
  
  func getUserFullName(firstName:String , lastName:String) throws -> String{
    guard firstName != "" && lastName != "" else
    { throw NameErrorType.Empty }
    guard Int(firstName) == nil && Int(lastName) == nil else
    { throw NameErrorType.ISNumber }
    return firstName + " " + lastName
  }
}






