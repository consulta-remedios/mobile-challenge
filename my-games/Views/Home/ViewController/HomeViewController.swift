//
//  HomeViewController.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextView: UITextField!
    
    //MARK: - Constants
    let viewModel = HomeViewModel()
    let screenWidth = UIScreen.main.bounds.width
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
    }
    
    //MARk: - Setup
    private func setup(){
        self.setupBack()
        self.title = self.viewModel.getTitle()
        self.setupCollection()
    }
    
    //MARK: SetupCellCollections
    func setupCollection(){
        self.collectionView.registerNib(named: self.viewModel.getCellCollectionIdentifier())
        
        self.viewModel.gamesResponse.asObservable().bind(to: collectionView.rx.items(cellIdentifier: self.viewModel.getCellCollectionIdentifier(), cellType: GameCollectionViewCell.self)) { row, element, cell in
            cell.setup(game: element)
            }.disposed(by: self.viewModel.bag)
        
        collectionView.rx.setDelegate(self).disposed(by: viewModel.bag)
    }
    
    //MARK: - LoadData
    private func loadData() {
        self.showLoader()
        self.viewModel.fetchData(success: {
             self.hideLoader()
        }) { (message) in
                self.hideLoader()
                self.showModalDefault(title:"modal_title_error".localized, message: message, textButton: "Ok".localized)
        }
    }
}

//MARK: - Extension UICollectionView
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth/2 - 32, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = GameDetailViewController(with: self.viewModel.getIdGameSelected(index: indexPath.row))
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
