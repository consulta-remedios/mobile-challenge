//
//  GamesPresenterRouter.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class GamesPresenterRouter {
    struct Constants {
        struct Segue {
            static let ShowDetail = "gameDetailSegue"
            static let ShowShoppingCart = "shoppingCartSegue"
        }
    }
    
    private weak var viewController: GamesController?
    
    init(viewController: GamesController) {
        self.viewController = viewController
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
