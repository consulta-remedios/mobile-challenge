//
//  EmptyStateRepresentable.swift
//  EmptyState
//
//  Created by Adriano on 07/02/2019.
//

import Foundation
import UIKit

public protocol EmptyStateRepresentable: UniqueRepresentable {
    
    var title: String? { get }
    var image: UIImage? { get }
    var text: String? { get }
    var action: EmptyStateActionRepresentable? { get set }
    var customView: UIView? { get set }
    var style: EmptyStateStyle { get }
    var edgeInsets: UIEdgeInsets { get set }
    var shouldDisplayHandler: () -> Bool { get set }
    var tappedHandler: (() -> Void)? { get set }
    var willAppearHandler: (() -> Void)? { get set }
    var didAppearHandler: (() -> Void)? { get set }
    var didDisappearHandler: (() -> Void)? { get set }
    
}
