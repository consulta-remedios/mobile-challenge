//
//  GameDetailsController.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class GameDetailsController: UIViewController {
    struct Constants { // swiftlint:disable nesting
        struct Nib {
            static let PageCell = "PageCell"
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(
                UINib(nibName: Constants.Nib.PageCell,
                      bundle: .main),
                forCellWithReuseIdentifier: PageCell.identifier)
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var freightLabel: UILabel!
    
    var presenter: GameDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.hideHairline(isTransparent: true)
        descriptionLabel.addTapGestureRecognizer { [weak self] in
            self?.presenter?.onMoreDescriptionTapped()
        }
        presenter?.present()
    }
    
    @IBAction func addGameInShoppingCartButtonTapped(_ sender: UIButton) {
        presenter?.onAddGameInShoppingCartButtonTapped()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        presenter?.onCloseButtonTapped()
    }
    
    @IBAction func showShoppingCartButtonTapped(_ sender: UIBarButtonItem) {
        presenter?.onShowShoppingCartButtonTapped()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter?.prepare(for: segue, sender: sender)
    }
}

extension GameDetailsController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PageCell.identifier,
            for: indexPath) as? PageCell else { return UICollectionViewCell() }
        presenter?.configure(for: indexPath.row, cell)
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let center = CGPoint(
            x: scrollView.contentOffset.x + (scrollView.frame.width / 2),
            y: (scrollView.frame.height / 2))
        if let newPage = collectionView.indexPathForItem(at: center) {
            pageControl.currentPage = newPage.row
        }
    }
}

extension GameDetailsController: GameDetailsPresenterView {
    func startLoading(text: String, backgroundColor: UIColor) {
        view.displayLoadingIndicator(text: text, backgroundColor: backgroundColor)
    }
    
    func stopLoading() {
        view.dismissLoadingIndicator()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func showMessage(icon: Icon,
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
    
    func displayView(numberPages: Int) {
        pageControl.numberOfPages = numberPages
    }
    
    func displayView(price: String) {
        priceLabel.text = price
    }
    
    func displayView(title: String) {
        self.title = title
    }
    
    func displayView(description: String, isMore: Bool) {
        descriptionLabel.text = description
        if isMore {
            descriptionLabel.addTrailing(
                with: "\n",
                moreText: "Leia mais",
                moreTextColor: .mainBlue)
        }
    }
    
    func displayView(name: String) {
        nameLabel.text = name
    }
    
    func displayView(freight: String) {
        freightLabel.text = freight
        freightLabel.addColor(with: "Frete:", color: .mainGreen)
    }
}
