//
//  GameDetailsPresenterRouter.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class GameDetailsPresenterRouter {
    struct Constants {
        struct Segue {
            static let ShowShoppingCart = "shoppingCartSegue"
        }
    }
    
    private weak var viewController: GameDetailsController?
    
    init(viewController: GameDetailsController) {
        self.viewController = viewController
    }
    
    func onDismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func onShowShoppingCart() {
        viewController?.performSegue(withIdentifier: Constants.Segue.ShowShoppingCart, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}
