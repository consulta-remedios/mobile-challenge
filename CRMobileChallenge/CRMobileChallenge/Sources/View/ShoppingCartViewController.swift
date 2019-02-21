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
    
    private let viewModel: ShoppingCartViewModelController
    
    private lazy var closeButton: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "icon-close"), style: .done, target: self, action: #selector(close))
    }()
    
    // MARK: Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var priceView: UIView!
    @IBOutlet private weak var checkoutButton: UIButton!
    
    // MARK: - Life Cycle
    
    init(shoppingCart: ShoppingCart, repository: PurchaseRepositoryProtocol) {
        self.viewModel = ShoppingCartViewModelController(shoppingCart: shoppingCart, repository: repository)
        
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.updatedOrderHandler = { [weak self] in
            self?.setupContent()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupControls()
        setupContent()
        showPrinceView()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Carrinho de Compras"
        
        priceView.layer.shadowColor = UIColor.black.cgColor
        priceView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        priceView.layer.shadowRadius = 6.0
        priceView.layer.shadowOpacity = 0.4
        priceView.layer.masksToBounds = false
    }
    
    private func setupControls() {
        navigationItem.leftBarButtonItem = closeButton
    }
    
    private func setupContent() {
        priceLabel.text = viewModel.price
        checkoutButton.isEnabled = viewModel.isEnableCheckoutButton
        checkoutButton.alpha = viewModel.isEnableCheckoutButton ? 1 : 0.4
    }
    
    private func showPrinceView() {
        let height: CGFloat = priceView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        priceView.transform = CGAffineTransform.init(translationX: 0, y: height)
        priceView.alpha = 0
        
        UIView.animate(withDuration: 0.44, delay: 0.26, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { [weak self] in
            self?.priceView.transform = .identity
            self?.priceView.alpha = 1
        })
    }
    
    private func finalizePurchase() {
        let alert = UIAlertController(
            title: "Finalizar compra",
            message: "Tem certeza que gostaria de finalizar sua compra?",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Sim", style: .default) { [weak self] _ in
            self?.viewModel.checkout { [weak self] result in
                switch result {
                case .success:
                    self?.successPurchase()
                case .failure(let error):
                    self?.failurePurchase(error: error)
                }
            }
        })
        
        alert.addAction(UIAlertAction(title: "Ainda não", style: .cancel))
        
        present(alert, animated: true)
    }
    
    private func successPurchase() {
        delegate?.shoppingCardPurchaseCompleted()
    }
    
    private func failurePurchase(error: Error) {
        let alert = UIAlertController(
            title: "Compra não realizada =(",
            message: "Infelizmente a compra não foi finalizada pois aconteceram algum problemas, por favor verifique sua conexão com a internet e tente novamente mais tarde.",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
        
        print(error.localizedDescription)
    }
    
    // MARK: Actions
    
    @IBAction private func checkout() {
        finalizePurchase()
    }
    
    @IBAction private func close() {
        delegate?.shoppingCardDismiss()
    }
    
}
