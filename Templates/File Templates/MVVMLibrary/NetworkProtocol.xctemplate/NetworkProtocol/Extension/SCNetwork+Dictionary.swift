//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

extension Dictionary: SCJSONConvertibleProtocol {

    public typealias ResponseType = String
    
    public func convertJSON() -> ResponseType? {
        
        do {
            let data =  try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            return String(data: data, encoding: String.Encoding.utf8)
        } catch let myJSONError {
            SCPrint(msg: myJSONError, type: SCPrintType.negative)
        }
        return nil
    }
}
