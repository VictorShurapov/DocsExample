//
//  SizeModifier.swift
//  DocsExample
//
//  Created by Yaro4ka on 27.12.2023.
//

import SwiftUI

struct SizeModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
    
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
}

extension View {
    func sizePreference() -> some View {
        modifier(SizeModifier())
    }
}
