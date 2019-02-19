//
//  UIImageView+Load.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 19/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func load(from url: URL) {
        self.kf.setImage(with: url, options: [.transition(.fade(0.26))])
    }
    
}
