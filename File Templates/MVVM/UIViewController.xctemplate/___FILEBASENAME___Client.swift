//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Aletheia
import Alamofire

/// ___FILEBASENAMEASIDENTIFIER___
final class ___FILEBASENAMEASIDENTIFIER___: Networkable {

    var parameters: [String : Any]? {
        var  _parameters = ["key": "value"] as [String : Any]
        return _parameters
    }
    
    var method: HTTPMethod = .post
    
    var baseURL: String = Configuration.API.member
    
    var networkClient: NetworkClient = NetworkClient()
    
    init() {
        
    }
    
    func start(completion: @escaping Response) {
        self.networkClient.performRequest(self) { (response) in
            completion(response)
        }
    }
}
