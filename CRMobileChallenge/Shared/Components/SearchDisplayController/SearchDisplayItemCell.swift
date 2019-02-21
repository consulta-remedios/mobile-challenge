//
//  SearchDisplayItemCell.swift
//  Shared
//
//  Created by Adriano Souza Costa on 19/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit

public class SearchDisplayItemCell: UITableViewCell {
    
    // MARK: - Private Variables
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var coverImage: UIImageView!
    
    // MARK: - Public Methods
    
    func setup(with item: SearchDisplayItem) {
        titleLabel.text = item.title
        
        subTitleLabel.text = item.subTitle
        subTitleLabel.isHidden = item.subTitle == nil
        
        detailLabel.text = item.detail
        detailLabel.isHidden = item.detail == nil
        
        if let url = item.imageURL {
            coverImage.load(from: url)
            coverImage.isHidden = false
        } else {
            coverImage.isHidden = true
        }
    }
    
}
