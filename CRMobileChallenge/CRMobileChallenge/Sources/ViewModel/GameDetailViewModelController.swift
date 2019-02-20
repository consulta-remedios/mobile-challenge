//
//  GameDetailViewModelController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 20/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit
import Domain

final class GameDetailViewModelController {
    
    // MARK: - Private Variables
    
    private var game: Game
    
    // MARK: - Life Cycle
    
    init(game: Game) {
        self.game = game
    }
    
    var title: String {
        return game.title
    }
    
    var platform: String {
        return game.platform
    }
    
    var description: NSAttributedString {
        return NSAttributedString(string: game.description)
    }
    
    var coverURL: URL {
        return game.image
    }
    
    // MARK: - Public Methods
    
}
