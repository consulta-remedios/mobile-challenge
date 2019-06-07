//
//  ShoppingCartTableViewController.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit
import Kingfisher

/// The view controller displaying the shopping cart of the user.
class ShoppingCartTableViewController: UITableViewController {

    // MARK: Properties

    /// The reuse identifier of the game cells.
    fileprivate let gameCellReuseIdentifier = "Game Cell"

    /// The reuse identifier of the information cells.
    fileprivate let infoCellReuseIdentifier = "Info Cell"

    /// The store service used to finish the purchase.
    var storeService: StoreServiceProtocol!

    /// The user of the application, with its shopping cart.
    var user: User!

    /// The label displaying the total price of the shopping cart.
    @IBOutlet weak var totalPriceLabel: UILabel!

    /// The button used to complete the purchase.
    @IBOutlet weak var finishPurchaseButton: UIButton!

    /// The button used to take the user to the games listing.
    @IBOutlet weak var continueBuyingButton: UIButton!

    /// The activity indicator showing that the request is in progress.
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        guard storeService != nil else {
            preconditionFailure("The store service must be injected.")
        }

        guard user != nil else {
            preconditionFailure("The user must be injected.")
        }

        totalPriceLabel.text = "R$ \(user.shoppingCart.totalPrice)"
    }

    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO:
    }

    // MARK: Actions

    /// Finishes the purchase, posting the purchase data to the server.
    @IBAction func finishPurchase(_ sender: UIButton? = nil) {
        activityIndicator.startAnimating()
        finishPurchaseButton.isEnabled = false
        continueBuyingButton.isEnabled = false

        storeService.finishPurchase { [weak self] wasSuccessful, error in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.finishPurchaseButton.isEnabled = true
                self?.continueBuyingButton.isEnabled = true

                if wasSuccessful {
                    // TODO: Go to the next controller.
                    // For now, only pop it.
                    self?.navigationController?.popToRootViewController(animated: true)
                } else if let error = error {
                    var message: String!

                    switch error {
                    case .connection:
                        message = ErrorMessages.noInternetConnection
                    case .serverResponse:
                        message = ErrorMessages.gamesDetailsErrorResponse
                    case .unexpectedDataContent:
                        message = ErrorMessages.readData
                    }

                    let alert = self?.makeErrorAlertController(withMessage: message)
                    alert?.addAction(UIAlertAction(title: AlertButtonTitles.tryAgain, style: .default) { _ in
                        self?.finishPurchase()
                    })

                    if let alert = alert {
                        self?.present(alert, animated: true)
                    }
                }
            }
        }
    }

    /// Takes the user back to the game listing controller.
    @IBAction func continueBuying(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ShoppingCartTableViewController {

    // MARK: Sections

    private enum Section: Int, CaseIterable {
        case games
        case informations
    }

    private enum InformationRow: Int, CaseIterable {
        case address
        case freight
        case payment
    }

    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            preconditionFailure("The section should be correclty instantiated.")
        }

        switch section {
        case .games:
            return user.shoppingCart.items.count
        case .informations:
            return InformationRow.allCases.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            preconditionFailure("The section should be correclty instantiated.")
        }

        switch section {
        case .games:
            return makeGameCell(usingTableView: tableView, andIndexPath: indexPath)
        case .informations:
            return makeInformationCell(usingTableView: tableView, andIndexPath: indexPath)
        }
    }

    // MARK: Cell Factories

    /// Creates the game cell to display the games in the shopping cart.
    /// - Parameters:
    ///     - tableView: the table view used to dequeue the cells.
    ///     - indexPath: the index path used to get the related game.
    /// - Returns: the created game cell.
    private func makeGameCell(
        usingTableView tableView: UITableView,
        andIndexPath indexPath: IndexPath) -> GameShoppingCartTableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: gameCellReuseIdentifier, for: indexPath
            ) as? GameShoppingCartTableViewCell else {
            preconditionFailure("The cell should be of the GameShoppingCartTableViewCell type.")
        }

        let game = user.shoppingCart.items[indexPath.row]

        if let URL = URL(string: game.imagePath) {
            cell.gameCoverImageView.kf.setImage(with: URL)
        }
        cell.gameNameLabel.text = game.name
        cell.priceLabel.text = "R$ \(game.price)"
        cell.itemsCountLabel.text = "1" // TODO: Make this show the real number of items to be purchased.

        return cell
    }

    /// Creates the information cell to display the additional details of the purchase.
    /// - Parameters:
    ///     - tableView: the table view used to dequeue the cells.
    ///     - indexPath: the index path used to get the related information.
    /// - Returns: the created information cell.
    private func makeInformationCell(
        usingTableView tableView: UITableView,
        andIndexPath indexPath: IndexPath) -> InformationTableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: infoCellReuseIdentifier, for: indexPath
            ) as? InformationTableViewCell else {
                preconditionFailure("The cell should be of the InformationTableViewCell type.")
        }

        guard let informationRow = InformationRow(rawValue: indexPath.row) else {
            preconditionFailure("The row must have a compatible enum value.")
        }

        var title: String!
        var information: String!

        switch informationRow {
        case .address:
            title = NSLocalizedString(
                "Endereço de entrega",
                comment: "The title of a field in the shopping cart controller."
            )
            information = "80510-342 Rua Desembargador Vieira Cavalcanti, 703 Curitiba - Paraná"

        case .freight:
            title = NSLocalizedString(
                "Frete",
                comment: "The title of a field in the shopping cart controller."
            )
            let freight = user.shoppingCart.freight
            information = freight == 0 ?
                NSLocalizedString("Grátis", comment: "") : "Transportadora: R$ \(freight)"

        case .payment:
            title = NSLocalizedString(
                "Pagamento",
                comment: "The title of a field in the shopping cart controller."
            )
            information = "5678 **** **** 4536 visa"
        }

        cell.informationTitleLabel.text = title
        cell.valueTitleLabel.text = information

        return cell
    }
}
