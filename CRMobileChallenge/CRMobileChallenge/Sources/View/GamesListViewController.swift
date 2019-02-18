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
    
    // MARK: - Private Variable
    
    private let repository: GameRepositoryProtocol
    
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
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Games"
    }
    
}
