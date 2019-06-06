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

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.addTrailing(with: "\n", moreText: "Leia mais", moreTextColor: .mainBlue)
        descriptionLabel.addTapGestureRecognizer { [weak self] in
            self?.moreTapped()
        }
        freightLabel.addColor(with: "Frete:", color: .mainGreen)
    }
    
    func moreTapped() {
        descriptionLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    }
    
    @IBAction func addInShoppingCartButtonTapped(_ sender: UIButton) {
        print("ADD ITEM IN SHOPPING CART")
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showShoppingCartButtonTapped(_ sender: UIBarButtonItem) {
        print("SHOW SHOPPING CART")
    }
}

extension GameDetailsController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PageCell.identifier,
            for: indexPath) as? PageCell else { return UICollectionViewCell() }
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
