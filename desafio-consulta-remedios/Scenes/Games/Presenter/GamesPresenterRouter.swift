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
            static let ShowDetail = "gameDetailsSegue"
            static let ShowShoppingCart = "shoppingCartSegue"
        }
    }
    
    private weak var viewController: GamesController?
    
    init(viewController: GamesController) {
        self.viewController = viewController
    }
    
    func onShowDetails(game: Game) {
        viewController?.performSegue(withIdentifier: Constants.Segue.ShowDetail, sender: game)
    }
    
    func onShowShoppingCart() {
        viewController?.performSegue(withIdentifier: Constants.Segue.ShowShoppingCart, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.ShowDetail,
            let destinationNavigationController = segue.destination as? UINavigationController,
            let destination = destinationNavigationController.topViewController as? GameDetailsController,
            let game = sender as? Game {
            destination.presenter?.game = game
        }
    }
}
