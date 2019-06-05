//
//  GameCellPresenterView.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 04/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol GameCellPresenterView: AnyObject {
    func displayView(name: String)
    func displayView(price: Double)
    func displayView(platform: String)
    func displayView(image: String)
}
