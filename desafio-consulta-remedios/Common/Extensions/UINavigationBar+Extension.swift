//
//  UINavigationBar+Extension.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 03/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func hideHairline(isTransparent: Bool = false) {
        shadowImage = UIImage()
        if isTransparent { setBackgroundImage(UIImage(), for: .default) }
    }
}
