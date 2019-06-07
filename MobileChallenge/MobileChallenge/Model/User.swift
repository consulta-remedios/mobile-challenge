//
//  User.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import Foundation

/// The object representing the current user of the application.
class User {

    // MARK: Properties

    /// The user's shopping cart.
    var shoppingCart = ShoppingCart()

    // MARK: Singleton

    /// The shared user of the application.
    /// - Note: This shouldn't be accessed directly. It should be injected into any controllers that need it.
    static let shared = User()
}
