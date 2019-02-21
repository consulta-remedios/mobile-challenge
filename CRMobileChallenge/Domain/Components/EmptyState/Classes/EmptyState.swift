//
//  EmptyState.swift
//  EmptyState
//
//  Created by Adriano on 07/02/2019.
//

import Foundation
import UIKit

public class EmptyState: EmptyStateRepresentable {
    
    // MARK: - Public Variables
    
    public var title: String?
    public var image: UIImage?
    public var text: String?
    public var action: EmptyStateActionRepresentable?
    public var customView: UIView?
    public var style: EmptyStateStyle = EmptyStateStyle()
    public var edgeInsets: UIEdgeInsets = .zero
    public var shouldDisplayHandler: () -> Bool
    public var tappedHandler: (() -> Void)?
    public var willAppearHandler: (() -> Void)?
    public var didAppearHandler: (() -> Void)?
    public var didDisappearHandler: (() -> Void)?
    
    // MARK: - Life Cycle
    
    public init(title: String? = nil, image: UIImage? = nil, text: String? = nil, action: EmptyStateActionRepresentable? = nil, style: EmptyStateStyle = EmptyStateStyle(), shouldDisplayHandler: @escaping () -> Bool) {
        self.title = title
        self.image = image
        self.text = text
        self.action = action
        self.style = style
        self.shouldDisplayHandler = shouldDisplayHandler
    }
    
    public init(customView: UIView, shouldDisplayHandler: @escaping () -> Bool) {
        self.customView = customView
        self.shouldDisplayHandler = shouldDisplayHandler
    }
    
}
