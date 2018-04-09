//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

final class ___FILEBASENAMEASIDENTIFIER___: SCIsNeedNetworkProtocol {

    /// This is one way binding, consider `Bond` for two-way binding instead
    var testBinging = Dynamic<String>("")

    private var model: ___VARIABLE_productName:identifier___Model = ___VARIABLE_productName:identifier___Model()

    var networkProcessingStatus: NetworkProcessingStatus

    convenience init(requestParameters: SCNetworkRequestProtocol?) {
        self.init()
    }

    init() {
        networkProcessingStatus = NetworkProcessingStatus.unKnow
    }

    func isLoading() -> Bool {
        return (networkProcessingStatus == .startLoading) ? true : false
    }

    func start(completion: @escaping ProcessingStatus) {
        completion(.startLoading)
        ___VARIABLE_productName:identifier___Business(baseURL: "https://httpbin.org/get22222").performNetwork { [weak self] (string, status) in
            switch status {
            case .unKnow, .unStable:
                self?.testBinging.value = "unStable"
                self?.networkProcessingStatus = .unKnow
            case .success:
                if let _string = string {
                    /// udpate data via binding
                    self?.testBinging.value = _string
                    self?.networkProcessingStatus = .completed
                } else {
                    self?.networkProcessingStatus = .failed
                }
            case .noNetwork, .timeout, .fail:
                self?.testBinging.value = "failed"
                self?.networkProcessingStatus = .failed
            }
            completion(self?.networkProcessingStatus ?? .failed)
        }
    }
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___ Extension
extension ___FILEBASENAMEASIDENTIFIER___ {


}