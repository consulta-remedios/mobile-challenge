//
//  InformationTableViewCell.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit

/// A cell displaying additional information about the purchase (e.g address, credit card, etc).
class InformationTableViewCell: UITableViewCell {

    // MARK: Parameters:

    /// The label dislaying the title of the information.
    @IBOutlet weak var informationTitleLabel: UILabel!

    /// The label displaying the value associated with the information.
    @IBOutlet weak var valueTitleLabel: UILabel!

    // MARK: Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()

        informationTitleLabel.text = ""
        valueTitleLabel.text = ""
    }
}
