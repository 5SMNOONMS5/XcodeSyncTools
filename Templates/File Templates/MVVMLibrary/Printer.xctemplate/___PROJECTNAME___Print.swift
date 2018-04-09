//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

public enum SCPrintType {
    /// normal print
    case normal
    /// something you think need more attention
    case highLight
    /// something is bad, EX: API JSON parse fail
    case negative
    /// involve inside the deinit function
    case destory
    /// csutom graphic function
    case custom(graph: String)
}

/// Graphical print, works strictly in Release Mode
///
/// - Parameters:
///   - msg: Generics type message, feed me anything.
///   - type: given a type
///   - file: Working file name.
///   - functionName: Working function name.
///   - lineNumber: Working line number of current file.
public func SCPrint<T>(msg: T,
                       type: SCPrintType = SCPrintType.normal,
                       file: String = #file,
                        functionName: String = #function,
                        lineNumber: Int = #line) {
    #if DEBUG
        var graphicString: String = ""
        switch type {
        case .highLight:
            graphicString = "❇️❇️❇️❇️❇️"
        case .negative:
            graphicString = "❌❌❌❌❌"
        case .destory:
            graphicString = "😎😎😎😎😎"
            print("\(graphicString) \(msg) Has successfully remove reference and also dealloc from memory")
            return
        case .custom(let graph):
            graphicString = graph
        case .normal:
            break
        }
        print(" \(graphicString) \((file as NSString).lastPathComponent)[\(lineNumber)], \(functionName): \(msg)")
    #endif
}