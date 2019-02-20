//
//  MyImageView.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func setImage(imageURL: String?){
        if let imgURL = imageURL {
            UIView.animate(withDuration: 0.5) {
                self.sd_setImage(with: URL(string: imgURL), completed: nil)
            }
        }
        else {
            self.image = UIImage(named: PLACEHOLDER_NO_PHOTO)
        }
        
    }
}
