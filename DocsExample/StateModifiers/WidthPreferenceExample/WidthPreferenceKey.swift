//
//  WidthPreferenceKey.swift
//  DocsExample
//
//  Created by Yaro4ka on 28.12.2023.
//

import SwiftUI

// Collect width from all the child views and keep them cached inside an array.
struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: [CGFloat] = []
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}

