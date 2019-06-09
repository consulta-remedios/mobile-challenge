//
//  UIShadowedRadiusButton.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class UIShadowedRadiusButton: UIButton {
    override func didMoveToWindow() {
        backgroundColor = .mainGreen
        layer.cornerRadius = 5
        setTitleColor(.white, for: .normal)
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    override func awakeFromNib() {
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
