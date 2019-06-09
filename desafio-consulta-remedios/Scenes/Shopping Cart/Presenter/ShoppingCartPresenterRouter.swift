//
//  ShoppingCartPresenterRouter.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 06/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class ShoppingCartPresenterRouter {
    struct Constants { // swiftlint:disable nesting
        struct Segue { 
            static let ShowGames = "unwindSegueToGames"
        }
    }
    private weak var viewController: ShoppingCartController?
    
    init(viewController: ShoppingCartController) {
        self.viewController = viewController
    }
    
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func rootViewControllerDismiss() {
        viewController?.performSegue(withIdentifier: Constants.Segue.ShowGames, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}
