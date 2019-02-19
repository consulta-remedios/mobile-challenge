//
//  UIView+XIB.swift
//  Shared
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public static var identifier: String {
        return "\(self)"
    }
    
    public static var nib: UINib {
        return UINib(nibName: "\(self)", bundle: Bundle(for: self))
    }
    
    public static func loadFromXib<T>(withOwner: Any? = self, options: [UINib.OptionsKey : Any] = [:]) -> T where T: UIView {
        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        
        return view
    }
    
}
