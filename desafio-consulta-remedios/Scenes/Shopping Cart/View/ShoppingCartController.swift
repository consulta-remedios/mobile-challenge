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
            tableView.estimatedRowHeight = 146
        }
    }
    @IBOutlet weak var tableViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var freightPriceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.hideHairline(isTransparent: true)
        recalculateSizeTableView()
        
        freightPriceLabel.addColor(with: "Transportadora:", color: .black)
    }
    
    private func recalculateSizeTableView() {
        tableView.layoutIfNeeded()
        tableViewHeightLayoutConstraint.constant = tableView.contentSize.height + 2
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ShoppingCartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingCartCell.identifier, for: indexPath) as? ShoppingCartCell else { return UITableViewCell() }
        return cell
    }
}
