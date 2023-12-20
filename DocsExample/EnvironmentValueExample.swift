//
//  EnvironmentValueExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 20.12.2023.
//

import SwiftUI

@Observable class TestSettings {
    var score = 0
}

struct EnvironmentValueExample: View {
    @State private var settings = TestSettings()
    
    var body: some View {
        Form {
            Text("Your score is \(settings.score)")
            Button("Increase Score") {
                settings.score += 1
            }
            EnvironmentValueDetail()
        }
        .environment(settings)
        .navigationTitle("Environment Value")
    }
}

struct EnvironmentValueDetail: View {
    @Environment(TestSettings.self) private var settings: TestSettings
    
    var body: some View {
        Text("Score from environment in detail view: \(settings.score)")
    }
}

#Preview {
    EnvironmentValueExample()
}
