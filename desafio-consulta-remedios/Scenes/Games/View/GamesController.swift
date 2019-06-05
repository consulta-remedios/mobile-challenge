//
//  GamesController.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class GamesController: UIViewController {
    struct Constants { // swiftlint:disable nesting
        struct Nib {
            static let GameCell = "GameCell"
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(
                UINib(nibName: Constants.Nib.GameCell,
                      bundle: .main),
                forCellWithReuseIdentifier: GameCell.identifier)
        }
    }
    
    lazy var searchController : UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "Search"
        controller.hidesNavigationBarDuringPresentation = false
        controller.setBackground(.mainGraySearchBar)
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchController.searchBar
        navigationController?.navigationBar.hideHairline()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}

extension GamesController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GameCell.identifier,
            for: indexPath) as? GameCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension GamesController: GamesPresenterView {
    
}
