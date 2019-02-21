//
//  EmptyStateAction.swift
//  EmptyState
//
//  Created by Adriano on 16/08/2018.
//

import UIKit

public protocol EmptyStateActionRepresentable {
    
    var title: String { get }
    var color: UIColor? { get }
    var font: UIFont? { get }
    var handler: () -> Void { get set }
    
}
