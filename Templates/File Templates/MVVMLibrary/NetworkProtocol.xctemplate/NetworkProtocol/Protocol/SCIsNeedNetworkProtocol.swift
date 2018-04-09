//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

typealias ProcessingStatus = (_ status: NetworkProcessingStatus) -> Void

protocol SCIsNeedNetworkProtocol {
    /// FIXME: will release soon 
    init(requestParameters: SCNetworkRequestProtocol?)
    
    var networkProcessingStatus: NetworkProcessingStatus { get }
    
    func isLoading() -> Bool
    
    func start(completion: @escaping ProcessingStatus)
}

extension SCIsNeedNetworkProtocol {
    
    func isLoading() -> Bool {
        return (self.networkProcessingStatus == .startLoading) ? true : false
    }
}