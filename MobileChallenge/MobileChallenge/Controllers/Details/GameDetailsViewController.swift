//
//  GameDetailsViewController.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit
import Kingfisher

/// The controller displaying the details of an item.
class GameDetailsViewController: UIViewController {

    // MARK: Properties

    /// The segue identifier of the shopping cart.
    private let segueIdentifier = "Show shopping cart"

    /// The service used to request the details of an item from the server.
    var storeService: StoreServiceProtocol!

    /// The user of the application.
    var user: User!

    /// The item being displayed.
    var item: Item!

    /// The image view displaying the cover of the game.
    @IBOutlet weak var gameImageView: UIImageView!

    /// The label displaying the title of the game.
    @IBOutlet weak var gameTitleLabel: UILabel!

    /// The label describing the game.
    @IBOutlet weak var gameDescriptionLabel: UILabel!

    /// The label displaying the price of the game.
    @IBOutlet weak var priceLabel: UILabel!

    /// The label displaying the freight associated to the game.
    @IBOutlet weak var freightLabel: UILabel!

    /// The view informing the user that the details are loading.
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        guard storeService != nil else {
            preconditionFailure("The store service must be injected.")
        }

        guard user != nil else {
            preconditionFailure("The user must be injected.")
        }

        guard item != nil else {
            preconditionFailure("The item must be injected.")
        }

        title = item.platform

        if let URL = URL(string: item.imagePath) {
            gameImageView.kf.setImage(with: URL)
        }
        gameTitleLabel.text = item.name
        priceLabel.text = "R$ \(item.price)"
        freightLabel.text = "R$ 10.00"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getItemDetails()
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let shoppingCartController = segue.destination as? ShoppingCartTableViewController else {
            preconditionFailure("The controller must be the shopping cart one.")
        }

        shoppingCartController.storeService = storeService
        shoppingCartController.user = user
    }

    // MARK: Actions

    @IBAction func addToShoppingCart(_ sender: UIButton) {
        user.shoppingCart.addItem(item)
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }

    // MARK: Imperatives

    /// Requests the details of the item to the server.
    private func getItemDetails() {
        activityIndicator.startAnimating()
        storeService.requestItemDetails(usingId: "\(item.identifier)") { [weak self] item, error in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()

                if let item = item {
                    self?.gameDescriptionLabel.text = item.description ?? ""
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

                    let alert = self!.makeErrorAlertController(withMessage: message)
                    alert.addAction(UIAlertAction(title: AlertButtonTitles.tryAgain, style: .default) { _ in
                        self?.getItemDetails()
                    })

                    self?.present(alert, animated: true)
                }
            }
        }
    }
}
