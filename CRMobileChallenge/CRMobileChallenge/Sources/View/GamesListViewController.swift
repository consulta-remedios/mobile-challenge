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
    
    private lazy var searchDisplay: SearchDisplayController<Game> = {
        return SearchDisplayController<Game>(searchItemHandler: { [weak self] (term, searchHandler) in
            self?.searchController.searchResultsController?.view.isHidden = false
            self?.viewModel.search(with: term, searchHandler)
        }, didSelectItemHandler: { [weak self] (game) in
            self?.delegate?.gamesListDidSelect(game: game)
        })
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: searchDisplay)
        searchController.searchResultsUpdater = searchDisplay
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = true
        
        let searchBar = searchController.searchBar
        searchBar.placeholder = "Search"
        searchBar.sizeToFit()
        
        return searchController
    }()
    
    private lazy var gridFlowLayout: GridFlowLayout = {
        let layout = GridFlowLayout(padding: 6)
        layout.delegate = self
        return layout
    }()
    
    private lazy var cartButton: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "icon-cart"), style: .done, target: self, action: #selector(showShoppingCart))
    }()
    
    private lazy var noItemsEmptyState: EmptyState = {
        return EmptyState(title: "Nada ainda =(", text: "Não temos nenhum jogo para você agora, volte mais tarde por favor.") { [weak self] in
            guard let self = self else { return false }
            return self.viewModel.isEmpty && !self.viewModel.hasError
        }
    }()
    
    private lazy var errorEmptyState: EmptyState = {
        let action = EmptyStateAction(title: "Tentar novamente") { [weak self] in
            self?.fetch()
        }
        
        return EmptyState(title: "Aconteceu um erro =(", text: "Não foi possível carregar o jogos, tente mais tarde por favor.", action: action) { [weak self] in
            guard let self = self else { return false }
            return self.viewModel.hasError
        }
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
        setupSearchController()
        fetch()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Games"
        
        collectionView.emptyStates = [noItemsEmptyState, errorEmptyState]
    }
    
    private func setupControls() {
        navigationItem.rightBarButtonItem = cartButton
    }
    
    private func setupCollectionView() {
        collectionView.collectionViewLayout = gridFlowLayout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GameListCell.nib, forCellWithReuseIdentifier: GameListCell.identifier)
    }
    
    private func setupSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    private func fetch() {
        viewModel.fetch { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success:
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            self.collectionView.reloadEmptyState()
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

extension GamesListViewController: GridFlowLayoutDelegate {
    
    func numberOfColumnsForGridFlow() -> Int {
        switch view.bounds.width {
        case 0...480:
            return 2
        case 481...1200:
            return 4
        default:
            return 6
        }
    }
    
}
