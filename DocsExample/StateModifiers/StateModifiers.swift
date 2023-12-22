//
//  StateModifiers.swift
//  DocsExample
//
//  Created by Yaro4ka on 08.12.2023.
//

import SwiftUI

struct StateModifiers: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Identity") {
                    NavigationLink("Flavor Picker", destination: FlavorPicker())
                    NavigationLink("Dog Profile", destination: DogProfileView())
                    NavigationLink("Environment Value", destination: EnvironmentValueExample())
                    NavigationLink("Transform environment", destination: TransformEnvironmentExample())
                }
            }
        }
        .navigationTitle("View modifiers")
    }
}
