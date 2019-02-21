//
//  GameViewController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol GameDetailCoordinatorDelegate {
    
    func gameDetailShowShoppingCart()
    
}

class GameDetailViewController: UIViewController {
    
    // MARK: - Public Variables
    
    var delegate: GameDetailCoordinatorDelegate?
    
    // MARK: - Private Variables
    
    private let viewModel: GameDetailViewModelController
    
    private lazy var cartButton: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "icon-cart"), style: .done, target: self, action: #selector(showShoppingCart))
    }()
    
    // MARK: Outlets
    
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var freightLabel: UILabel!
    @IBOutlet private weak var priceView: UIView!
    
    // MARK: - Life Cycle
    
    init(game: Game, shoppingCart: ShoppingCart, gameRepository: GameRepositoryProtocol) {
        self.viewModel = GameDetailViewModelController(game: game, shoppingCart: shoppingCart, repository: gameRepository)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupControls()
        setupContent()
        fetch()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.cancel()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = viewModel.platform
        navigationItem.largeTitleDisplayMode = .never
        
        priceView.layer.shadowColor = UIColor.black.cgColor
        priceView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        priceView.layer.shadowRadius = 6.0
        priceView.layer.shadowOpacity = 0.4
        priceView.layer.masksToBounds = false
    }
    
    private func setupControls() {
        navigationItem.rightBarButtonItem = cartButton
    }
    
    private func setupContent() {
        coverImage.load(from: viewModel.coverURL)
        
        titleLabel.text = viewModel.title
        descriptionLabel.attributedText = viewModel.description
        priceLabel.text = viewModel.price
        freightLabel.text = viewModel.freight
        
        if viewModel.isPriceHidden {
            let height: CGFloat = priceView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            priceView.transform = CGAffineTransform.init(translationX: 0, y: height)
            priceView.alpha = 0
            titleLabel.alpha = 0
            descriptionLabel.alpha = 0
        } else {
            UIView.animate(withDuration: 0.44, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { [weak self] in
                self?.titleLabel.alpha = 1
                self?.descriptionLabel.alpha = 1
            })
            
            UIView.animate(withDuration: 0.44, delay: 0.26, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { [weak self] in
                self?.priceView.transform = .identity
                self?.priceView.alpha = 1
            })
        }
    }
    
    private func fetch() {
        viewModel.fetch() { [weak self] result in
            switch result {
            case .success:
                self?.setupContent()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction private func showShoppingCart() {
        delegate?.gameDetailShowShoppingCart()
    }
    
    @IBAction private func addToCart() {
        viewModel.addToCart()
        showBanner(title: viewModel.title, body: "Adicionado com sucesso ao carrinho!")
    }
    
}
