//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Bond
import Aletheia
import Foundation
import ReactiveKit

/// ___FILEBASENAMEASIDENTIFIER___
final class ___FILEBASENAMEASIDENTIFIER___ {

    let name = Observable<String?>("")
    
    init() {
        
    }
    
    func requestAPI(completion: @escaping (_ any: Any?) -> ()) {
        ___VARIABLE_viewName___Client().start { (response) in
            if let data = response.value as? Data {
                if let object = self.parseJSON(data: data) {
                    completion(object)
                } else {
                    completion(data.al.jsonErrorType(type: APIError.self))
                }
            } else {
                completion(APIError(code: nil,
                                    message: response.error?.localizedDescription))
            }
        }
    }
}

extension ___FILEBASENAMEASIDENTIFIER___: JSONDecodablePeorocol {

    typealias ResponseStruct = ___VARIABLE_viewName___Model?
    
    func parseJSON(data: Data) -> ___VARIABLE_viewName___Model? {
        return data.al.jsonType(type: ___VARIABLE_viewName___Model.self)
    }
}

