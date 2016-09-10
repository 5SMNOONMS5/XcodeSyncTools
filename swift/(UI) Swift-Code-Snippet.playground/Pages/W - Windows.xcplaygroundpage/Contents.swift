
import UIKit

//: ### Get Topmost View Controller

func topMostController() -> UIViewController{
  
  var topMostController = UIApplication.sharedApplication().keyWindow?.rootViewController
  
  while((topMostController?.presentingViewController) != nil){
    topMostController = topMostController?.presentingViewController
  }
  return topMostController!
}

