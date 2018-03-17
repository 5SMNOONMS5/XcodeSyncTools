//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Foundation

final class ___FILEBASENAMEASIDENTIFIER___: SCIsNeedNetworkProtocol {

    public var responseText: Dynamic<String> = Dynamic<String>("")

    var networkProcessingStatus: NetworkProcessingStatus

    convenience init(requestParameters: SCNetworkRequestProtocol?) {
        self.init()
    }

    init() {
        self.networkProcessingStatus = .unKnow
    }

    func start(completion: @escaping ProcessingStatus) {
        completion(.startLoading)
        ___VARIABLE_productName:identifier___Business(baseURL: "http://httpbin.org/ip").performNetwork { [weak self] (string, status) in
            switch status {
            case .unKnow, .unStable:
                self?.networkProcessingStatus = .unKnow
            case .success:
                if let _string = string {
                    /// udpate data via binding
                    self?.responseText.value = _string
                    self?.networkProcessingStatus = .completed
                } else {
                    self?.networkProcessingStatus = .failed
                }
            case .noNetwork, .timeout, .fail:
                self?.networkProcessingStatus = .failed
            }
            completion(self?.networkProcessingStatus ?? .failed)
        }
    }
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___ Extension
extension ___FILEBASENAMEASIDENTIFIER___ {


}