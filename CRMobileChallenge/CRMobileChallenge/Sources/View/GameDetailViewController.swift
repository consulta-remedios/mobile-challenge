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
    
    private let game: Game
    
    private lazy var cartButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showShoppingCart))
    }()
    
    // MARK: - Life Cycle
    
    init(game: Game) {
        self.game = game
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
        title = game.platform
    }
    
    private func setupControls() {
        navigationItem.rightBarButtonItem = cartButton
    }
    
    // MARK: Actions
    
    @IBAction private func showShoppingCart() {
        delegate?.gameDetailShowShoppingCart()
    }
    
}
