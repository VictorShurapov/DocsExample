//
//  TotalValuePreferenceKey.swift
//  DocsExample
//
//  Created by Yaro4ka on 01.01.2024.
//

import SwiftUI

struct TotalValuePreferenceKey: PreferenceKey {
    static var defaultValue: Double = 0.0
    
    static func reduce(value: inout Double, nextValue: () -> Double) {
        value += nextValue()
    }
}
