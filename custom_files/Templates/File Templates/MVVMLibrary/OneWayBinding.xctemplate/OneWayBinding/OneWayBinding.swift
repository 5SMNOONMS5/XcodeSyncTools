//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

public class Dynamic<T> {
    
    public var value: T {
        didSet {
            weakBond?.listener(value)
        }
    }
    
    /// Prevent Strong reference between Dynamic class and Bond class
    public weak var weakBond: Bond<T>?
    
    public init(_ value: T) {
        self.value = value
    }
}

public class Bond<T> {
    typealias Listener = (T) -> Void
    var listener: Listener
    
    init(_ listener: @escaping Listener) {
        self.listener = listener
    }
    
    /// One way binding
    ///
    /// - Parameter dynamic: binding into the given dynamic value
    func bind(dynamic: Dynamic<T>) {
        dynamic.weakBond = self
    }
}

/// reference to swift-evolution 0077-operator-precedence.md, https://github.com/apple/swift-evolution/blob/master/proposals/0077-operator-precedence.md
precedencegroup BindingPrecedence {
    associativity: right
    lowerThan: AssignmentPrecedence
}

/// Custmize advanced operators
infix operator ~~> : BindingPrecedence

/// Simplify the binding syntax
///
/// - Parameters:
///   - left: A given value that listen to the right side value changed
///   - right: A value listened by the left side object
public func ~~> <T>(left: Bond<T>, right: Dynamic<T>) {
    left.bind(dynamic: right)
}