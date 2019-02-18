//
//  ShoppingCartViewController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol ShoppingCartCoordinatorDelegate {
    
    func shoppingCardDismiss()
    func shoppingCardChangeAddress()
    func shoppingCardChangePaymentMethod()
    func shoppingCardPurchaseCompleted()
    
}

class ShoppingCartViewController: UIViewController {
    
    // MARK: - Public Variables
    
    var delegate: ShoppingCartCoordinatorDelegate?
    
    // MARK: - Private Variables
    
    private let repository: PurchaseRepositoryProtocol
    
    // MARK: - Life Cycle
    
    init(repository: PurchaseRepositoryProtocol) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Carrinho de compras"
    }
    
}
