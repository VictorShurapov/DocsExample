//
//  TextAnchorPreferenceKey.swift
//  DocsExample
//
//  Created by Yaro4ka on 11.01.2024.
//

import SwiftUI

struct TextAnchorPreferenceKey: PreferenceKey {
    static var defaultValue: [TextAnchorPreferenceData] = []
    
    static func reduce(value: inout [TextAnchorPreferenceData], nextValue: () -> [TextAnchorPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
