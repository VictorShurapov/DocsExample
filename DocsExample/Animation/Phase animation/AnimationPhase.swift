//
//  AnimationPhase.swift
//  DocsExample
//
//  Created by Yaro4ka on 06.03.2024.
//

import Foundation

enum AnimationPhase: CaseIterable {
    case initial
    case move
    case scale

    var verticalOffset: Double {
        switch self {
        case .initial: 0
        case .move, .scale: -64
        }
    }

    var scale: Double {
        switch self {
        case .initial: 1.0
        case .move: 1.1
        case .scale: 1.8
        }
    }
}
