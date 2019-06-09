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
    
    lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "Search"
        controller.hidesNavigationBarDuringPresentation = false
        controller.setBackground(.mainGraySearchBar)
        return controller
    }()
    var presenter: GamesPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchController.searchBar
        navigationController?.navigationBar.hideHairline()
        presenter?.present()
    }
    
    @IBAction func showShoppingCartButtonTapped(_ sender: Any) {
        presenter?.onShowShoppingCartButtonTapped()
    }
    
    @IBAction func unwindToGames(segue:UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter?.prepare(for: segue, sender: sender)
    }
}

extension GamesController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.games.count ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GameCell.identifier,
            for: indexPath) as? GameCell else { return UICollectionViewCell() }
        presenter?.configure(for: indexPath.row, cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.onDidSelect(for: indexPath.row)
    }
}

extension GamesController: GamesPresenterView {
    func startLoading(text: String, backgroundColor: UIColor) {
        view.displayLoadingIndicator(text: text, backgroundColor: backgroundColor)
    }
    
    func stopLoading() {
        view.dismissLoadingIndicator()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func showMessage(
        icon: Icon,
        text: String,
        sizeIcon: Int,
        backgroundColor: UIColor,
        isButton: Bool,
        titleButton: String) {
        view.displayMessageView(icon: icon,
                                text: text,
                                sizeIcon: sizeIcon,
                                backgroundColor: backgroundColor,
                                isButton: isButton,
                                titleButton: titleButton) { [weak self] in
            self?.presenter?.present()
        }
    }
    
    func hideMessage() {
        view.dismissMessageView()
    }
}
