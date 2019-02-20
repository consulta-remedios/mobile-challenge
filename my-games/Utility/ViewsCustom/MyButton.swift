//
//  MyButton.swift
//  my-games
//
//  Created by Caio Cardozo on 07/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}
