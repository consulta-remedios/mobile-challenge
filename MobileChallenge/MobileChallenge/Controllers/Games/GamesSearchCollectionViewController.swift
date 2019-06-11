//
//  GamesSearchCollectionViewController.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 11/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit
import Kingfisher

/// Displays the results of the user's search.
class GamesSearchCollectionViewController: UICollectionViewController {

    // MARK: Properties

    /// The cell reuse identifier.
    fileprivate let reuseIdentifier = "game collection cell"

    /// The games to be searched.
    var games: [Item]!

    /// The results of the search.
    private(set) var searchResults = [Item]()

    /// The closure called when a game is selected by the user.
    var selectionHandler: ((Item) -> Void)?

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        precondition(games != nil, "The games to be searched must be injected.")
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
        ) -> Int {
        return searchResults.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let game = searchResults[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        guard let gameCell = cell as? GameCollectionViewCell else {
            preconditionFailure("The cell is supposed to be a GameCollectionViewCell.")
        }

        if let URL = URL(string: game.imagePath) {
            gameCell.gameImageView.kf.setImage(with: URL)
        }
        gameCell.platformLabel.text = game.platform
        gameCell.gameNameLabel.text = game.name
        gameCell.priceLabel.text = "R$ \(game.price)"

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionHandler?(searchResults[indexPath.item])
    }
}

extension GamesSearchCollectionViewController: UISearchResultsUpdating {

    // MARK: UISearchResultsUpdating methods

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased(), !searchText.isEmpty else {
            searchResults = []
            collectionView.reloadData()
            return
        }

        searchResults = games.filter { game in
            return game.name.lowercased().contains(searchText.lowercased())
        }
        collectionView.reloadData()
    }
}
