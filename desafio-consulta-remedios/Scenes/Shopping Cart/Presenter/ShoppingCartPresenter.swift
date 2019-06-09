//
//  ShoppingCartPresenter.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 06/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class ShoppingCartPresenter {
    private(set) weak var view: ShoppingCartPresenterView?
    private(set) var router: ShoppingCartPresenterRouter
    var cartRepository: CartRepositoryProtocol?
    var gamesRepository: GameRepositoryProtocol?
    var rootController: RootController = .games
    var items: [CartItem] = [] {
        didSet {
            guard items.count == 0 else { return }
            view?.showMessage(icon: .logo, text: "O seu carrinho está vazio.\nTe esperamos com muitos produtos!", sizeIcon: 100, backgroundColor: .white, isButton: true, titleButton: "BORA COMPRAR?", completion: { [weak self] in
                self?.dismiss()
            })
        }
    }
    var subTotal: Double = 0.0
    var total: Double = 0.0 {
        didSet {
            view?.displayView(total: total.formattedCurrency())
        }
    }
    var freight: Double = 0.0 {
        didSet {
            view?.display(freight: freight == 0.0 ? "Transportadora: Grátis" : "Transportadora: " + freight.formattedCurrency())
        }
    }
    
    init(view: ShoppingCartPresenterView, router: ShoppingCartPresenterRouter) {
        self.view = view
        self.router = router
    }
    
    func present() {
        cartRepository?.fetchAll(response: { [weak self] (response, _) in
            guard let items = response else { return }
            self?.items = items
        })
        
        cartRepository?.getSubTotal(response: { [weak self] (subTotal, _) in
            guard let subTotal = subTotal else { return }
            self?.subTotal = subTotal
        })
        
        cartRepository?.getFreight(response: { [weak self] (freight, _) in
            guard let freight = freight else { return }
            self?.freight = freight
        })
        
        cartRepository?.getTotal(response: { [weak self] (total, _) in
            guard let total = total else { return }
            self?.total = total
        })
    }
    
    func configure(for row: Int, _ cell: ShoppingCartCellPresenterView) {
        let item = CartSingleton.shared.items[row]
        cell.displayView(name: item.game.name)
        cell.displayView(platform: item.game.platform)
        cell.displayView(image: item.game.image)
        cell.displayView(quantity: "Quantidade: \(item.quantity)")
        cell.displayView(price: item.game.price.formattedCurrency())
    }
    
    func onFinalizePurchase() {
        view?.startLoading(text: "Finalizando compra...", backgroundColor: .white)
        gamesRepository?.purchase(response: { [weak self] (response, message) in
            self?.view?.stopLoading()
            self?.view?.hideMessage()
            guard response else {
                self?.view?.showMessage(icon: .logo, text: message, sizeIcon: 100, backgroundColor: .white, isButton: true, titleButton: "TENTAR NOVAMENTE", completion: { [weak self] in
                    self?.onFinalizePurchase()
                })
                return }
            self?.view?.displayView(title: "Compra concluída")
            self?.cartRepository?.removeAll()
            self?.view?.showMessage(icon: .completed, text: "Sua compra N 00279 foi concluída com sucesso.\nEm breve você receberá seus produtos.", sizeIcon: 100, backgroundColor: .white, isButton: true, titleButton: "Continuar comprando", completion: { [weak self] in
                self?.dismiss()
            })
        })
    }
    
    func dismiss() {
        switch rootController {
        case .games:
            router.dismiss()
        case .gameDetail:
            router.rootViewControllerDismiss()
        }
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
