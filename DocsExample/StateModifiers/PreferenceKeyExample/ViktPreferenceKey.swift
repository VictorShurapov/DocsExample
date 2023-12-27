//
//  ViktPreferenceKey.swift
//  DocsExample
//
//  Created by Yaro4ka on 26.12.2023.
//

import SwiftUI

struct ViktPreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = "\(value) & \(nextValue()) ✨"
    }
    typealias Value = String
}
