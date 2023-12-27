//
//  NavigationTitlePreference.swift
//  DocsExample
//
//  Created by Yaro4ka on 24.12.2023.
//

import SwiftUI

//struct NavigationTitleKey: PreferenceKey {
//    static var defaultValue: String = ""
//    
//    static func reduce(value: inout String, nextValue: () -> String) {
//        value = nextValue()
//    }
//}

//extension View {
//    func navigationTitlePreference(_ title: String) -> some View {
//        self.preference(key: SizePreferenceKey.self, value: title)
//    }
//}

private var sizeView: some View {
    GeometryReader { geometry in
        Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
    }
}

struct NavigationTitlePreference: View {
    let messages = ["One", "Two", "Three"]
    
    var body: some View {
        NavigationStack {

            List(messages, id: \.self) { message in
                Text(message)
            }
            .background(sizeView)
            
           // .navigationTitlePreference("Messages")
        }
        .onPreferenceChange(SizePreferenceKey.self) { title in
            print(title)
        }
    }
}

#Preview {
    NavigationTitlePreference()
}
