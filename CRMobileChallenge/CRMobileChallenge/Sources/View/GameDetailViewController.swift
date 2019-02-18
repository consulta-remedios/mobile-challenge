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
    func gameDetailDismiss()
    
}

class GameDetailViewController: UIViewController {
    
    // MARK: - Public Variables
    
    var delegate: GameDetailCoordinatorDelegate?
    
    // MARK: - Private Variables
    
    private let game: Game
    
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
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = game.platform
    }
    
}
