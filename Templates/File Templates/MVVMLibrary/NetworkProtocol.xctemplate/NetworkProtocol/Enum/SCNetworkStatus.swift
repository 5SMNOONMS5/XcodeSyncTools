//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

public enum SCResponseNetworkStatus: Int {
    
    /// everything work fine
    case success = 200
    
    /// there is no internet connect
    case noNetwork
    
    /// internet connect unstable
    case unStable
    
    /// timeout
    case timeout
    
    /// for the status network not yet response
    case unKnow

    /// fail
    case fail
    
    var description: String {
        switch self {
        case .success:
            return "Your own network success message"
        case .noNetwork:
            return "Your own no network message"
        case .unStable:
            return "Your own network un stable message"
        case .timeout:
            return "Your own network timeout message"
        case .fail:
            return "Your own network fail message"
        case .unKnow:
            return "Network not yet response"
        }
    }
}

enum NetworkProcessingStatus {
    case unKnow
    case startLoading
    case completed
    case failed
}
