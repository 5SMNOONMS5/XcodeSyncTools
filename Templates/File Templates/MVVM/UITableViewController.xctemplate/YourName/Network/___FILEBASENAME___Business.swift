//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

/// FIXME: Add MVVMLibrary First
import Alamofire
import Foundation

final class ___FILEBASENAMEASIDENTIFIER___: SCNetworkRequestProtocol {

    var networkClient: SCNetworkClient = SCNetworkClient()

    typealias ResponseType = SCResponseNetworkStatus

    var baseURL: String

    var method: HTTPMethod = HTTPMethod.get

    var parameters: [String : Any]? {
        return [:]
    }

    init(baseURL: String?) {
        self.baseURL  = baseURL ?? ""
    }

    /// FIXME: Enter your return type
    func performNetwork(callback: @escaping (<#TypeSaft. Same as  ___FILEBASENAMEASIDENTIFIER___ class#>, SCResponseNetworkStatus) -> Void) {

        /// Start request
        self.networkClient.performRequest(self) { (data, networkStatus) in
            /// FIXME: Enter your return type
            var response: <#TypeSaft. Same as  ___FILEBASENAMEASIDENTIFIER___ class#>? = nil
            
            defer { callback(response, networkStatus) }
            
            if networkStatus == .noNetwork { return }

            guard let data = data else { return }

            if networkStatus == .success {
                response = self.parseJSON(data: data)
            }
        }
    }
}

// MARK: - SCJSONDecodablePeorocol
extension ___FILEBASENAMEASIDENTIFIER___: SCJSONDecodablePeorocol {
    
    /// FIXME: Enter your return type
    typealias ResponseStruct = <#TypeSaft. Same as  ___FILEBASENAMEASIDENTIFIER___ class#>
    
    /// FIXME: This is just a demo, add your own parse logic 
    func parseJSON(data: Data) -> <#TypeSaft. Same as  ___FILEBASENAMEASIDENTIFIER___ class#> {
        
        /// FIXME: Your Parse process here
        return nil
    }
}