//
//  EqualWidthModifier.swift
//  DocsExample
//
//  Created by Yaro4ka on 28.12.2023.
//

import SwiftUI

// Add an overlay of GeometryReader to the content so we can collect the width from GeometryProxy
struct EqualWidthModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: WidthPreferenceKey.self, value: [proxy.size.width])
                }
            }
    }
}

extension View {
    func equalWidth() -> some View {
        modifier(EqualWidthModifier())
    }
}
