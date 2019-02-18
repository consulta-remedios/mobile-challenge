//
//  PurchaseCoordinator.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import UIKit

final class PurchaseCoordinator {
    
    // MARK: - Private Variables
    
    private let presenter: UIViewController
    private let navigation = UINavigationController()
    
    // MARK: - Life Cycle
    
    init(presenter: UIViewController) {
        self.presenter = presenter
    }
    
}

extension PurchaseCoordinator: Coordinator {
    
    func start() {
        let controller = PurchaseViewController()
        controller.delegate = self
        navigation.setViewControllers([controller], animated: false)
        presenter.present(navigation, animated: true)
    }
    
}

extension PurchaseCoordinator: PurchaseCoordinatorDelegate {
    
    func purchaseDismiss() {
        navigation.dismiss(animated: true)
    }
    
}
