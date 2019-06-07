//
//  ItemDetailsViewController.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit

/// The controller displaying the details of an item.
class ItemDetailsViewController: UIViewController {

    // MARK: Properties

    /// The service used to request the details of an item from the server.
    var storeService: StoreServiceProtocol!

    /// The item being displayed.
    var item: Item!

    // MARK: Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        guard storeService != nil else {
            preconditionFailure("The store service must be injected.")
        }

        guard item != nil else {
            preconditionFailure("The item must be injected.")
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO:
    }

    // MARK: Imperatives

    // TODO:
}
