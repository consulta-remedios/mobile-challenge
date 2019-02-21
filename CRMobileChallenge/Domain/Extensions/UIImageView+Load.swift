//
//  UIImageView+Load.swift
//  Shared
//
//  Created by Adriano Souza Costa on 19/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

public extension UIImageView {
    
    public func load(from url: URL, placeholder: UIImage? = nil, animated: Bool = true) {
        let options: KingfisherOptionsInfo = animated ? [.transition(.fade(0.26))] : []
        self.kf.setImage(with: url, options: options)
    }
    
}
