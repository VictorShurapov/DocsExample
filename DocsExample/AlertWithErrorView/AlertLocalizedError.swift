//
//  AlertLocalizedError.swift
//  DocsExample
//
//  Created by Yaro4ka on 25.07.2023.
//

import Foundation

enum AlertError: LocalizedError {
    case incorrectPassword
    
    var errorDescription: String? {
        switch self {
        case .incorrectPassword:
            return "Failed logging in account"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .incorrectPassword:
            return "Entered password was incorrect"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .incorrectPassword:
            return "Please try again with different password"
        }
    }
    
    var helpAnchor: String? {
        switch self {
        case .incorrectPassword:
            return "You can recheck what you typed in"
        }
    }
}
