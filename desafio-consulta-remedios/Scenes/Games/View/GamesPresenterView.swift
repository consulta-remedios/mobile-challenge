//
//  GamesPresenterView.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol GamesPresenterView: AnyObject {
    func startLoading(text: String, backgroundColor: UIColor)
    func stopLoading()
    func reloadData()
    func showMessage(
        icon: Icon,
        text: String,
        sizeIcon: Int,
        backgroundColor: UIColor,
        isButton: Bool,
        titleButton: String)
    func hideMessage()
}
