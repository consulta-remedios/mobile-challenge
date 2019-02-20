//
//  SearchDisplayItem.swift
//  Shared
//
//  Created by Adriano Souza Costa on 19/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit

public protocol SearchDisplayItem {
    
    var title: String { get }
    var subTitle: String? { get }
    var detail: String? { get }
    var imageURL: URL? { get }
    
}
