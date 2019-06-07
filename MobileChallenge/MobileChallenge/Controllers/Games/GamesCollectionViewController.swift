//
//  GamesCollectionViewController.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit
import Kingfisher

/// Controller responsible for displaying the games of the store in a grid.
class GamesCollectionViewController: UICollectionViewController {

    // MARK: Properties

    /// The cell reuse identifier.
    private let reuseIdentifier = "game collection cell"

    /// The service used to request any items to be displayed by this controller.
    var storeService: StoreServiceProtocol!

    /// The items being displayed.
    private var items: [Item]? {
        didSet {
            if items != nil {
                self.collectionView?.reloadData()
            }
        }
    }

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        guard storeService != nil else {
            preconditionFailure("The store service must be injected.")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        storeService.requestItems { [weak self] items, error in
            DispatchQueue.main.async {
                if let items = items {
                    self?.items = items

                    print(items.first!)
                } else if let error = error {
                    // TODO: Display the error in an alert.
                    // TODO: Add an extension to display errors.
                }
            }
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pass the selected game to the details controller.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items != nil ? 1 : 0
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let game = items?[indexPath.item] else {
            preconditionFailure("The game must be available at this point.")
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        guard let gameCell = cell as? GameCollectionViewCell else {
            preconditionFailure("The cell is to be a GameCollectionViewCell.")
        }

        // TODO: Display the game's image.
        if let URL = URL(string: game.imagePath) {
            gameCell.gameImageView.kf.setImage(with: URL)
        }
        gameCell.platformLabel.text = game.platform
        gameCell.gameNameLabel.text = game.name
        gameCell.priceLabel.text = "R$ \(game.price)"

        return cell
    }
}
