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
    private let shoppingCart: ShoppingCart
    
    private lazy var closeButton: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "icon-close"), style: .done, target: self, action: #selector(close))
    }()
    
    // MARK: - Life Cycle
    
    init(shoppingCart: ShoppingCart, repository: PurchaseRepositoryProtocol) {
        self.shoppingCart = shoppingCart
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupControls()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Carrinho de Compras"
    }
    
    private func setupControls() {
        navigationItem.leftBarButtonItem = closeButton
    }
    
    // MARK: Actions
    
    @IBAction private func close() {
        delegate?.shoppingCardDismiss()
    }
    
}
