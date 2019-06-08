//
//  ShoppingCartController.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 06/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class ShoppingCartController: UIViewController {
    struct Constants { // swiftlint:disable nesting
        struct Nib {
            static let ShoppingCartCell = "ShoppingCartCell"
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: Constants.Nib.ShoppingCartCell, bundle: .main), forCellReuseIdentifier: ShoppingCartCell.identifier)
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 148
        }
    }
    @IBOutlet weak var tableViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var freightPriceLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var presenter: ShoppingCartPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.hideHairline(isTransparent: true)
        presenter?.present()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recalculateSizeTableView()
    }
    
    private func recalculateSizeTableView() {
        tableView.layoutIfNeeded()
        tableViewHeightLayoutConstraint.constant = tableView.contentSize.height + 2
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        presenter?.dismiss()
    }
    
    @IBAction func finalizePurchaseButtonTapped(_ sender: Any) {
        presenter?.rootController = .gameDetail
        presenter?.onFinalizePurchase()
    }
    
    @IBAction func continueBuyingButtonTapped(_ sender: Any) {
        presenter?.rootController = .gameDetail
        presenter?.dismiss()
    }
}

extension ShoppingCartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingCartCell.identifier, for: indexPath) as? ShoppingCartCell else { return UITableViewCell() }
        presenter?.configure(for: indexPath.row, cell)
        return cell
    }
}

extension ShoppingCartController: ShoppingCartPresenterView {
    func reloadData() {
        tableView.reloadData()
        recalculateSizeTableView()
    }
    
    func displayView(total: String) {
        totalLabel.text = total
    }
    
    func display(freight: String) {
        freightPriceLabel.text = freight
        freightPriceLabel.addColor(with: "Transportadora:", color: .black)
    }
    
    func showMessage(icon: Icon, text: String, sizeIcon: Int, backgroundColor: UIColor, isButton: Bool, titleButton: String) {
        view.displayMessageView(icon: icon, text: text, sizeIcon: sizeIcon, backgroundColor: backgroundColor, isButton: isButton, titleButton: titleButton) { [weak self] in
            self?.presenter?.dismiss()
        }
    }
    
    func hideMessage() {
        view.dismissMessageView()
    }
    
    func startLoading(text: String, backgroundColor: UIColor) {
        view.displayLoadingIndicator(text: text, backgroundColor: backgroundColor)
    }
    
    func stopLoading() {
        view.dismissLoadingIndicator()
    }
    
    func displayView(title: String) {
        self.title = title
    }
}
