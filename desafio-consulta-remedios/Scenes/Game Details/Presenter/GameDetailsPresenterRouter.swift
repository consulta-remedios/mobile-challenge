//
//  GameDetailsPresenterRouter.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class GameDetailsPresenterRouter {
    struct Constants { // swiftlint:disable nesting
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
    
    func onShowShoppingCart(rootController: RootController) {
        viewController?.performSegue(
            withIdentifier: Constants.Segue.ShowShoppingCart,
            sender: rootController)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.ShowShoppingCart,
            let destinationNavigationController = segue.destination as? UINavigationController,
            let destination = destinationNavigationController.topViewController as? ShoppingCartController,
            let rootController = sender as? RootController {
            destination.presenter?.rootController = rootController
        }
    }
}
