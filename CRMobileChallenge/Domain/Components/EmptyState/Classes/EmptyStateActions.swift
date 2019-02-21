//
//  EmptyStateActions.swift
//  EmptyState
//
//  Created by Adriano on 16/08/2018.
//

import Foundation

private struct AssociatedKeys {
    static var emptyStatesKey = "emptyStates.key"
}

public protocol EmptyStateActions: class {
    
    var emptyStates: [EmptyStateRepresentable] { get set }
    
    func reloadEmptyState()
    
}

extension EmptyStateActions {
    
    public var emptyStates: [EmptyStateRepresentable] {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.emptyStatesKey) as? [EmptyStateRepresentable] ?? [] }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.emptyStatesKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            reloadEmptyState()
        }
    }
    
}

extension Array where Iterator.Element == EmptyStateRepresentable {
    
    public mutating func remove<T: EmptyStateRepresentable>(_ emptyState: T) {
        let stateIndex = index { currentEmptyState -> Bool in
            guard let current = currentEmptyState as? T,
                current.uid == emptyState.uid else { return false }
            return true
        }

        guard let index = stateIndex else { return }
        
        remove(at: index)
    }
    
}
