//
//  MinimapPreferenceKey.swift
//  DocsExample
//
//  Created by Yaro4ka on 14.01.2024.
//

import SwiftUI

struct MinimapPreferenceKey: PreferenceKey {
    typealias Value = [MinimapPreferenceData]
    
    static var defaultValue: [MinimapPreferenceData]  = []
    
    static func reduce(value: inout [MinimapPreferenceData], nextValue: () -> [MinimapPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
