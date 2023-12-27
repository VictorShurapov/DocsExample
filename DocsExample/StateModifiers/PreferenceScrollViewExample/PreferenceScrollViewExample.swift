//
//  PreferenceScrollViewExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 23.12.2023.
//

import SwiftUI

struct PreferenceScrollView<Content: View>: View {
    let content: Content
    
    @State private var contentSize: CGSize = .zero
    // tracking transient state
    @GestureState private var translation: CGSize = .zero
    // shift the displayed contents by the specified amount
    @State private var offset: CGSize = .zero
    
    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .updating($translation) { value, state, _ in
                state = value.translation
            }
            .onEnded { value in
                offset = value.translation
            }
    }
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            content
                .fixedSize()
                .offset(offset)
                .offset(translation)
                .border(.red)
                .sizePreference()
                .onPreferenceChange(SizePreferenceKey.self) { contentSize = $0 }
                .gesture(isScrollable(geometry.size) ? dragGesture : nil)
        }
        .clipped()
    }
    
    private func isScrollable(_ size: CGSize) -> Bool {
        contentSize.width > size.width || contentSize.height > size.height
    }
}

struct PreferenceScrollViewExample: View {
    var body: some View {
        PreferenceScrollView {
            Color.indigo.frame(width: 500, height: 500, alignment: .topLeading)
            Text("")
        }
    }
}

#Preview {
    PreferenceScrollViewExample()
}
