//
//  EmptyStateStyle.swift
//  EmptyState
//
//  Created by Adriano on 07/02/2019.
//

import UIKit

public final class EmptyStateStyle {
    
    public var titleFont: UIFont
    public var titleColor: UIColor
    public var textFont: UIFont
    public var textColor: UIColor
    public var backgroundColor: UIColor
    
    public init(titleFont: UIFont = UIFont.preferredFont(forTextStyle: .title1),
                titleColor: UIColor = .gray,
                textFont: UIFont = UIFont.systemFont(ofSize: 17),
                textColor: UIColor = .gray,
                backgroundColor: UIColor = .white) {
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.textFont = textFont
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
}
