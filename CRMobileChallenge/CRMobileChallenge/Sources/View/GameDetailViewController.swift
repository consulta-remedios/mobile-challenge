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
    
    // MARK: - Life Cycle
    
    init(game: Game, gameRepository: GameRepositoryProtocol) {
        self.viewModel = GameDetailViewModelController(game: game, repository: gameRepository)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupControls()
        fetch()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = viewModel.platform
        navigationItem.largeTitleDisplayMode = .never
        setupPartialData()
    }
    
    private func setupControls() {
        navigationItem.rightBarButtonItem = cartButton
    }
    
    private func fetch() {
        viewModel.fetch() { [weak self] result in
            switch result {
            case .success:
                self?.setupFullData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupPartialData() {
        coverImage.load(from: viewModel.coverURL)
    }
    
    private func setupFullData() {
        setupPartialData()
        
        titleLabel.text = viewModel.title
        descriptionLabel.attributedText = viewModel.description
    }
    
    // MARK: Actions
    
    @IBAction private func showShoppingCart() {
        delegate?.gameDetailShowShoppingCart()
    }
    
}
