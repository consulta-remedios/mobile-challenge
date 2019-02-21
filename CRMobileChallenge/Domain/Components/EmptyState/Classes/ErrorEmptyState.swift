//
//  ErrorEmptyState.swift
//  EmptyState
//
//  Created by Adriano on 07/02/2019.
//

import UIKit

public class ErrorEmptyState: EmptyState {
    
    // MARK: - Public Variables
    
    public var error: Error? {
        didSet {
            text = errorText
            image = errorImage
        }
    }
    
    // MARK: - Private Variables
    
    private var buttonTitleColor: UIColor {
        return UIColor(red: 0/255, green: 102/255, blue: 150/255, alpha: 1.0)
    }
    
    private var errorImage: UIImage? {
        if isNotConnectedToInternetError {
            return UIImage(named: "icon_wifi", in: Bundle(for: ErrorEmptyState.self), compatibleWith: nil)
        }
        return UIImage(named:"icon_error", in: Bundle(for: ErrorEmptyState.self), compatibleWith: nil)
    }
    
    private var errorText: String? {
        if isNotConnectedToInternetError {
            return "A requisição falhou, verifique se você tem uma conexão com a internet ativa."
        }
        
        return error?.localizedDescription
    }
    
    private var isNotConnectedToInternetError: Bool {
        guard let error = error else { return false }
        switch error {
        case URLError.notConnectedToInternet, URLError.networkConnectionLost:
            return true
        default:
            return false
        }
    }
    
    // MARK: - Life Cycle
    
    public init(error: Error? = nil, actionHandler: (() -> Void)? = nil) {
        super.init { return true }
        defer {
            self.error = error
        }
        shouldDisplayHandler = { [weak self] in
            return self?.error != nil
        }
        if let actionHandler = actionHandler {
            self.action = EmptyStateAction(title: "Tentar novamente", color: buttonTitleColor, handler: actionHandler)
        }
    }
    
}
