//
//  PreferenceKeyExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 26.12.2023.
//

import SwiftUI

struct PreferenceKeyExample: View {
    @State private var preferenceValue = ""
    
    var body: some View {
        VStack {
            Text("Nice & Happy")
                .preference(key: ViktPreferenceKey.self, value: "Nice & Happy")
            Text("Coding")
                .preference(key: ViktPreferenceKey.self, value: "Coding")
            Divider()
            Text(preferenceValue)
                .font(.title3)
        }
        .onPreferenceChange(ViktPreferenceKey.self) { value in
            preferenceValue = value
        }
    }
}

#Preview {
    PreferenceKeyExample()
}
