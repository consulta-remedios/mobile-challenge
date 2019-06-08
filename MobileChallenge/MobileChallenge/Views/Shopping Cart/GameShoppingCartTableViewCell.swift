//
//  GameShoppingCartTableViewCell.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit

/// A table view cell displaying a game in the user's shopping cart.
class GameShoppingCartTableViewCell: UITableViewCell {

    // MARK: Properties

    /// A button used to remove the item from the shopping cart.
    @IBOutlet weak var removeFromCartButton: UIButton!

    /// The image view displaying the game's cover.
    @IBOutlet weak var gameCoverImageView: UIImageView!

    /// The label displaying the name of the game.
    @IBOutlet weak var gameNameLabel: UILabel!

    /// The label displaying the price of the game.
    @IBOutlet weak var priceLabel: UILabel!

    /// The label displaying how many items will be purchased.
    @IBOutlet weak var itemsCountLabel: UILabel!

    /// The closure in charge of handling the action of the "remove-from-cart" button.
    var removalHandler: (() -> Void)?

    // MARK: Life Cycle

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        if (removeFromCartButton.actions(forTarget: self, forControlEvent: .touchUpInside) ?? []).isEmpty {
            removeFromCartButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        gameCoverImageView.image = nil
        gameNameLabel.text = ""
        priceLabel.text = ""
        itemsCountLabel.text = ""
        removalHandler = nil
    }

    // MARK: Actions

    /// The action of the remove from cart button.
    @objc private func handleButtonTap(_ sender: UIButton?) {
        removalHandler?()
    }
}
