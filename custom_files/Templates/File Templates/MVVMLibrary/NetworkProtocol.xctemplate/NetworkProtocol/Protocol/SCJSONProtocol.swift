//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

public protocol SCJSONDecodablePeorocol {
    
    associatedtype ResponseStruct

    /// Parse JSON
    ///
    /// - Parameter data: data that fetch from network
    /// - Returns: Associatedtype for the one that conform this protocol
    func parseJSON(data: Data) -> ResponseStruct
}

public protocol SCJSONConvertibleProtocol {
    
    associatedtype ResponseType
    
    /// Convert Json Format into given associatedtype
    ///
    /// - Returns: given associatedtype
    func convertJSON() -> ResponseType?
}
