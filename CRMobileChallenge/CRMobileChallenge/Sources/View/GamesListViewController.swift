//
//  GamesListViewController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol GamesListCordinatorDelegate {
    
    func gamesListDidSelect(game: Game)
    func gamesListShowShoppingCart()
    
}

class GamesListViewController: UIViewController {
    
    // MARK: - Public Variables
    
    var delegate: GamesListCordinatorDelegate?
    
    // MARK: - Private Variables
    
    private let repository: GameRepositoryProtocol
    
    private lazy var cartButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showShoppingCart))
    }()
    
    // MARK: - Life Cycle
    
    init(repository: GameRepositoryProtocol) {
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
        title = "Games"
    }
    
    private func setupControls() {
        navigationItem.rightBarButtonItem = cartButton
    }
    
    // MARK: Actions
    
    @IBAction private func showShoppingCart() {
        delegate?.gamesListShowShoppingCart()
    }
    
    @IBAction private func showGameDetail() {
        let game = Game(name: "teste", platform: "teste", description: "teste", price: 1, score: 1, image: URL(string: "http://www.google.com.br")!)
        delegate?.gamesListDidSelect(game: game)
    }
    
}
