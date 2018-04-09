//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Alamofire // remember to import Alamofire ******

public protocol ___FILEBASENAMEASIDENTIFIER___ {
    /// Will be release future version
//    var enableHTTPDNS: (Bool, Provider) { get }
    
    var endpoint: String { get }
    
    var baseURL: String { get set }
    
    var encoding: ParameterEncoding { get }
    
    var method: HTTPMethod { get }
    
    var parameters: [String : Any]? { get }
    
    var header: [String : String] { get }
    
    var networkClient: SCNetworkClient { get set }
}

public extension SCNetworkRequestProtocol {
    /// Will be release future version
//    var enableHTTPDNS: (Bool, Provider) { return (false, .none) }
    
    var url: String { return baseURL + endpoint }
    
    var baseURL: String { return "" }
    
    var endpoint: String { return "" }
    
    var encoding: Alamofire.ParameterEncoding { return JSONEncoding.default }
    
    var method: Alamofire.HTTPMethod { return .post }
    
    var parameters: [String : Any] { return [:] }
    
    var header: [String : String] { return [:] }
}
