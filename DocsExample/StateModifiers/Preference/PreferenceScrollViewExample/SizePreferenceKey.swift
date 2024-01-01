//
//  SizePreferenceKey.swift
//  DocsExample
//
//  Created by Yaro4ka on 27.12.2023.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
