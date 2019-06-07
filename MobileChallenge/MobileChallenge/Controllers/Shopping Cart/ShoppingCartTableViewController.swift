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

    /// The store service used to finish the purchase.
    var storeService: StoreServiceProtocol!

    // TODO: Inject the user with the shopping cart.

    @IBOutlet weak var totalPriceLabel: UILabel!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        guard storeService != nil else {
            preconditionFailure("The store service must be injected.")
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
