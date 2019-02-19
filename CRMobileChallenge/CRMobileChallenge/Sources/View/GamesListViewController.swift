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
import Shared

protocol GamesListCordinatorDelegate {
    
    func gamesListDidSelect(game: Game)
    func gamesListShowShoppingCart()
    
}

class GamesListViewController: UIViewController {
    
    // MARK: - Public Variables
    
    var delegate: GamesListCordinatorDelegate?
    
    // MARK: - Private Variables
    
    private let viewModel: GameListControllerViewModel
    
    private var flowLayout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        return layout
    }
    
    private lazy var cartButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showShoppingCart))
    }()
    
    // MARK: Outlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    
    init(repository: GameRepositoryProtocol) {
        self.viewModel = GameListControllerViewModel(repository: repository)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupControls()
        setupCollectionView()
        fetch()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Games"
    }
    
    private func setupControls() {
        navigationItem.rightBarButtonItem = cartButton
    }
    
    private func setupCollectionView() {
        collectionView.collectionViewLayout = GridFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GameListCell.nib, forCellWithReuseIdentifier: GameListCell.identifier)
    }
    
    private func fetch() {
        viewModel.fetch { [weak self] result in
            switch result {
            case .success:
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction private func showShoppingCart() {
        delegate?.gamesListShowShoppingCart()
    }
    
}

extension GamesListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.gamesListDidSelect(game: viewModel.game(at: indexPath))
    }
    
}

extension GamesListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameListCell.identifier, for: indexPath) as? GameListCell else {
            return UICollectionViewCell()
        }
        cell.setup(with: viewModel.game(at: indexPath))
        return cell
    }
    
}
