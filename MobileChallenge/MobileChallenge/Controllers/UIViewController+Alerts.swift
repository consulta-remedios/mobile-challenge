//
//  UIViewController+Alerts.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    // MARK: Imperatives

    /// Creates a default error alert configured with the passed message.
    /// - Parameters:
    ///     - message: the message to be displayed to the user.
    ///     - action: the action to be taken when the user selects the default action.
    /// - Returns: the configured error alert controller.
    func makeErrorAlertController(
        withMessage message: String,
        andDefaultActionHandler action: ((UIAlertAction) -> Void)? = nil
        ) -> UIAlertController {
        return makeErrorAlertController(
            withMessage: message,
            actionTitle: NSLocalizedString("Ok", comment: "The title of the default alert action."),
            andDefaultActionHandler: action
        )
    }

    /// Creates an error alert configured with the passed message and default action options.
    /// - Parameters:
    ///     - message: the message to be displayed to the user.
    ///     - title: the title of the default action button.
    ///     - action: the action to be taken when the user selects the default button.
    /// - Returns: the configured error alert controller.
    func makeErrorAlertController(
        withMessage message: String,
        actionTitle title: String,
        andDefaultActionHandler action: ((UIAlertAction) -> Void)? = nil
        ) -> UIAlertController {
        let alert = makeAlertController(
            withTitle: NSLocalizedString("Error", comment: "The title of the alert to be displayed."),
            andMessage: message
        )
        alert.addAction(UIAlertAction(
            title: title,
            style: .default,
            handler: action
        ))

        return alert
    }

    /// Creates an alert configured with the passed title and message.
    /// - Parameters:
    ///     - title: the title of the alert.
    ///     - message: the message of the alert.
    /// - Returns: the configured alert controller.
    func makeAlertController(withTitle title: String, andMessage message: String) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
}

extension UIViewController {

    // MARK: Error Messages

    /// Describes the constants containing the error messages used in the app.
    enum ErrorMessages {

        static let noInternetConnection = NSLocalizedString(
            "Por favor, verifique a sua conexão com a Internet, e tente novamente.",
            comment: "Message displayed when there's no internet connection."
        )

        static let readData = NSLocalizedString(
            "Houve um erro com a leitura dos dados. Por favor, contate o desenvolvedor.",
            comment: "Message displayed when the app weren't able to parse the response data."
        )

        static let gamesErrorResponse = NSLocalizedString(
            "A busca pelos items não pôde ser completada.",
            comment: "Message displayed when the server returns an error in the game's fetch."
        )

        static let gamesDetailsErrorResponse = NSLocalizedString(
            "A exibição dos detalhes não pôde ser completada.",
            comment: "Message displayed when the server returns an error in the details' fetch."
        )
    }

    /// Describes the constants containing the button titles used in the app's alerts.
    enum AlertButtonTitles {

        static let tryAgain = NSLocalizedString(
            "Tentar novamente",
            comment: "Title of the try again error alert button"
        )
    }
}
