//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

/// Network Errors reported
public enum SCNetworkError: Error {
    
    /// Incorrect URL is supplied. Error code: 0.
    case invalidUrlString 
    
    /// Response HTTP status code is not 200. Error code: 1.
    case httpStatusCodeIsNot200
    
    /// Response is missing Content-Type http header. Error code: 2.
    case missingResponseContentTypeHttpHeader
    
    /// Response Content-Type http header is not an image type. Error code: 3.
    case notAnImageContentTypeInResponseHttpHeader
    
    /// Failed to convert response data to UIImage. Error code: 4.
    case failedToReadImageData
    
    /// Simulated error used in unit tests. Error code: 5.
    case simulatedError
    
    /// Custom error description, usually better design for error description is came from service
    var localizedDescription: String {
        switch self {
        case .invalidUrlString:
            return "Invalid URL"
            
        case .httpStatusCodeIsNot200:
            return "Response HTTP status code is not 200."
            
        case .missingResponseContentTypeHttpHeader:
            return "Response HTTP header is missing content type."
            
        case .notAnImageContentTypeInResponseHttpHeader:
            return "Response content type is not an image type. Content type needs to be  'image/jpeg', 'image/pjpeg', 'image/png' or 'image/gif'"
            
        case .failedToReadImageData:
            return "Could not convert response data to an image format."
            
        case .simulatedError:
            return "Test error."
        }
    }
    
    /// Error code
    var code: Int {
        return (self as Error)._code
    }
}
