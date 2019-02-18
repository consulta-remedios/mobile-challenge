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

class GamesListViewController: UIViewController {
    
    // MARK: - Private Variable
    
    private let gamesListCoordinator: GamesListCoordinator
    
    // MARK: - Life Cycle
    
    init(gamesListCoordinator: GamesListCoordinator) {
        self.gamesListCoordinator = gamesListCoordinator
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
