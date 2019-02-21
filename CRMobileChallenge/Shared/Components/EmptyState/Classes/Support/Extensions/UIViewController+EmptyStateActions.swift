//
//  UIViewController+EmptyStateActions.swift
//  EmptyState
//
//  Created by Adriano on 7/2/18.
//

import UIKit

extension UIViewController: EmptyStateActions {
    
    public var emptyStates: [EmptyStateRepresentable] {
        get { return view.emptyStates }
        set { view.emptyStates = newValue }
    }
    
    public func reloadEmptyState() {
        view.reloadEmptyState()
    }
    
}
