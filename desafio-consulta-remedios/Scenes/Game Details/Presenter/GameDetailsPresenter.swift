//
//  GameDetailsPresenter.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class GameDetailsPresenter {
    private(set) weak var view: GameDetailsPresenterView?
    private(set) var router: GameDetailsPresenterRouter
    var gamesRepository: GameRepositoryProtocol?
    var game: Game?
    var gameDetail: GameDetail?
    var images: [String] = []
    
    init(view: GameDetailsPresenterView, router: GameDetailsPresenterRouter) {
        self.view = view
        self.router = router
    }
    
    func present() { fetchId() }
    
    private func fetchId() {
        guard let game = game else { fatalError("Missing dependencies GAME") }
        view?.displayView(title: game.platform)
        view?.startLoading(text: "Loading...", backgroundColor: .white)
        gamesRepository?.fetchId(id: game.id, response: { [weak self] (response, message) in
            self?.view?.stopLoading()
            self?.view?.hideMessage()
            guard let gameDetail = response else {
                self?.view?.showMessage(icon: .notFound,
                                        text: message,
                                        sizeIcon: 100,
                                        backgroundColor: .white,
                                        isButton: true,
                                        titleButton: "TENTAR NOVAMENTE")
                return
            }
            self?.gameDetail = gameDetail
            self?.images = gameDetail.images
            self?.view?.reloadData()
            self?.view?.displayView(numberPages: gameDetail.images.count)
            self?.view?.displayView(name: gameDetail.name)
            self?.view?.displayView(description: gameDetail.description, isMore: true)
            self?.view?.displayView(price: gameDetail.price.formattedCurrency())
            self?.view?.displayView(freight: "Frete: R$ 10,00")
        })
    }
    
    func configure(for row: Int, _ cell: PageCellPresenterView) {
        cell.displayView(image: gameDetail?.images[row] ?? "")
    }
    
    func onMoreDescriptionTapped() {
        view?.displayView(description: gameDetail?.description ?? "", isMore: false)
    }
    
    func onCloseButtonTapped() {
        router.onDismiss()
    }
    
    func onAddGameInShoppingCartButtonTapped() {
        guard let game = self.game else { return }
        CartSingleton.shared.add(value: game)
        router.onShowShoppingCart(rootController: .gameDetail)
    }
    
    func onShowShoppingCartButtonTapped() {
        router.onShowShoppingCart(rootController: .games)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
