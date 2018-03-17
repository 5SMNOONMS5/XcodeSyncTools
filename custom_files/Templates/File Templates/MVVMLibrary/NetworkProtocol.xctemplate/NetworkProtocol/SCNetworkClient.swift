//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Alamofire
import Foundation

public struct SCNetworkClient: SCNetworkClientProtocol {

    public var sessionManager: Alamofire.SessionManager?
    
    /// Thanks to https://github.com/Alamofire/Alamofire/issues/157
    ///
    /// - Parameter timeoutInterval: default is 30 seconds
    public init(timeoutInterval: TimeInterval = 30) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutInterval
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    /// Network request
    ///
    /// - Parameters:
    ///   - request: parameter that conform to SCNetworkRequestProtocol
    ///   - callback: return Tuple type (data, SCResponseNetworkStatus)
    public func performRequest<GCRequest: SCNetworkRequestProtocol>(_ request: GCRequest,
                                                                    callback: @escaping SCResponse) {
    
        SCPrint(msg: "Start request： \(request.baseURL) ", type: .normal)
        
        self.sessionManager?.request(request.baseURL,
                                     method: request.method,
                                     parameters: request.parameters,
                                     encoding: URLEncoding.default,
                                     headers: request.header)
        .validate()
        .responseJSON(completionHandler: { (response) in
            
            var data: Data? = nil
            var responseNetworkStatus: SCResponseNetworkStatus = .unKnow
            
            defer {
                callback(data, responseNetworkStatus)
            }
            
            /// No Network
            if let isReachable = NetworkReachabilityManager()?.isReachable {
                if (!isReachable) {
                    SCPrint(msg: "Request URL： \(request.baseURL) fail, Status: \(response.result.description) Reason: \(response.description)", type: .negative)
                    responseNetworkStatus = SCResponseNetworkStatus.noNetwork
                    return
                }
            } else {
                SCPrint(msg: "NetworkReachabilityManager Can't be init correctly", type: .negative)
            }
            
            switch (response.result) {
            /// Success
            case .success:
                
                SCPrint(msg: "Request URL： \(request.baseURL) Success", type: .highLight)
                responseNetworkStatus = SCResponseNetworkStatus.success
                data = response.data
            /// Fail               
            case .failure(let error):
                
                responseNetworkStatus = SCResponseNetworkStatus.fail
                
                /// Error handle, thanks to the https://stackoverflow.com/questions/29131253/swift-alamofire-how-to-get-the-http-response-status-code
                var statusCode = response.response?.statusCode
                if let error = response.result.error as? AFError {
                    statusCode = error._code
                    switch error {
                    case .invalidURL(let url):
                        SCPrint(msg: "Invalid URL: \(url) - \(error.localizedDescription)", type: .negative)
                    case .parameterEncodingFailed(let reason):
                        SCPrint(msg: "Parameter encoding failed: \(error.localizedDescription)", type: .negative)
                        SCPrint(msg: "Failure Reason: \(reason)", type: .negative)
                    case .multipartEncodingFailed(let reason):
                        SCPrint(msg: "Multipart encoding failed: \(error.localizedDescription)", type: .negative)
                        SCPrint(msg: "Failure Reason: \(reason)", type: .negative)
                    case .responseValidationFailed(let reason):
                        SCPrint(msg: "Response validation failed: \(error.localizedDescription)", type: .negative)
                        SCPrint(msg: "Failure Reason: \(reason)", type: .negative)
                        
                        switch reason {
                        case .dataFileNil, .dataFileReadFailed:
                            SCPrint(msg: "Downloaded file could not be read", type: .negative)
                        case .missingContentType(let acceptableContentTypes):
                            SCPrint(msg: "Content Type Missing: \(acceptableContentTypes)", type: .negative)
                        case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                            SCPrint(msg: "Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)", type: .negative)
                        case .unacceptableStatusCode(let code):
                            SCPrint(msg: "Response status code was unacceptable: \(code)", type: .negative)
                            statusCode = code
                        }
                    case .responseSerializationFailed(let reason):
                        SCPrint(msg: "Response serialization failed: \(error.localizedDescription)", type: .negative)
                        SCPrint(msg: "Failure Reason: \(reason)", type: .negative)
                    }
                } else if error._code == NSURLErrorTimedOut {
                    SCPrint(msg: "Request timeout: \(error.localizedDescription)", type: .negative)
                    responseNetworkStatus = SCResponseNetworkStatus.timeout
                } else if let error = response.result.error as? URLError {
                    SCPrint(msg: "URLError occurred: \(error.localizedDescription)", type: .negative)
                } else {
                    SCPrint(msg: "Unknown error: \(String(describing: response.result.error))", type: .negative)
                }
            }
        })
    }
}
