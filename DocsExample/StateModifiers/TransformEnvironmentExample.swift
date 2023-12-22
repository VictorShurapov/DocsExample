//
//  TransformEnvironmentExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 20.12.2023.
//

import SwiftUI

struct TransformEnvironmentExample: View {
    var body: some View {
        Form {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .environment(\.font, .headline)
            TransformEnvironmentDetail()
        }
        .navigationTitle("Transform environment")
    }
}

struct TransformEnvironmentDetail: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        // adjust an environment value based on its current state.
            .transformEnvironment(\.font) { currentFont in
                currentFont = .title.italic()
            }
    }
}

#Preview {
    TransformEnvironmentExample()
}
