//
//  EmptyStateAction.swift
//  EmptyState
//
//  Created by Adriano on 17/06/2018.
//

import UIKit

public class EmptyStateAction: EmptyStateActionRepresentable {
    
    // MARK: - Public Variables
    
    public var title: String
    public var color: UIColor?
    public var font: UIFont?
    public var handler: () -> Void
    
    // MARK: - Life Cycle
    
    public init(title: String, color: UIColor? = nil, font: UIFont? = nil, handler: @escaping () -> Void) {
        self.title = title
        self.color = color
        self.font = font
        self.handler = handler
    }
    
}
