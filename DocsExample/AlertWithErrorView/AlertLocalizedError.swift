//
//  AlertLocalizedError.swift
//  DocsExample
//
//  Created by Yaro4ka on 25.07.2023.
//

import Foundation

enum AlertError: LocalizedError {
    case incorrectPassword
    case unstableConnection
    
    var errorDescription: String? {
        switch self {
        case .incorrectPassword:
            return "Failed logging in account"
        case .unstableConnection:
            return "Unstable Connection"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .incorrectPassword:
            return "Entered password was incorrect"
        case .unstableConnection:
            return "Internet connection is lost"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .incorrectPassword:
            return "Please try again with different password"
        case .unstableConnection:
            return "Please check your connection and try again"
        }
    }
    
    var helpAnchor: String? {
        switch self {
        case .incorrectPassword:
            return "You can recheck what you typed in"
        case .unstableConnection:
            return "Turn Airplane Mode On / Off"
        }
    }
}
