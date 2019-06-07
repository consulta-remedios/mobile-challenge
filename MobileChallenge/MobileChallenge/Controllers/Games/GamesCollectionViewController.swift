//
//  GamesCollectionViewController.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit

/// Controller responsible for displaying the games of the store in a grid.
class GamesCollectionViewController: UICollectionViewController {

    // MARK: Properties

    /// The cell reuse identifier.
    private let reuseIdentifier = "Cell"

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

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .red
        // TODO: Configure the cell
        return cell
    }
}
