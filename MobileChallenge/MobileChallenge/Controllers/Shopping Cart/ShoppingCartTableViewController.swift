//
//  ShoppingCartTableViewController.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit

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

    @IBOutlet weak var totalPriceLabel: UILabel!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        guard storeService != nil else {
            preconditionFailure("The store service must be injected.")
        }

        guard user != nil else {
            preconditionFailure("The user must be injected.")
        }
    }

    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO:
    }

    // MARK: Actions

    /// Finishes the purchase, posting the purchase data to the server.
    @IBAction func finishPurchase(_ sender: UIButton) {

    }

    /// Takes the user back to the game listing controller.
    @IBAction func continueBuying(_ sender: UIButton) {

    }
}

extension ShoppingCartTableViewController {

    // MARK: Sections

    private enum Section: Int, CaseIterable {
        case games
        case informations
    }

    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            preconditionFailure("The section case should be correclty instantiated.")
        }

        switch section {
        case .games:
            return user.shoppingCart.items.count
        case .informations:
            return 3 // Address, freight and payment.
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // TODO: Configure the cell...

        return cell
    }

    // MARK: Cell Factories

    /// Creates the game cell to display the games in the shopping cart.
    /// - Parameters:
    ///     - tableView: the table view used to dequeue the cells.
    ///     - indexPath: the index path used to get the related game.
    /// - Returns: the created game cell.
//    private func makeGameCell(
//        usingTableView tableView: UITableView,
//        andIndexPath indexPath: IndexPath) -> GameShoppingCartTableViewCell {
//
//    }

    /// Creates the information cell to display the additional details of the purchase.
    /// - Parameters:
    ///     - tableView: the table view used to dequeue the cells.
    ///     - indexPath: the index path used to get the related information.
    /// - Returns: the created information cell.
//    private func makeInformationCell(
//        usingTableView tableView: UITableView,
//        andIndexPath indexPath: IndexPath) -> InformationTableViewCell {
//
//    }
}
