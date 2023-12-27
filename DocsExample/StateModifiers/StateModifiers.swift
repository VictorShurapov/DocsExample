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
                }
                Section("Environment values") {
                    NavigationLink("Environment Value", destination: EnvironmentValueExample())
                    NavigationLink("Transform environment", destination: TransformEnvironmentExample())
                }
                Section("Preferences") {
                    NavigationLink("Preference Key Example", destination: PreferenceKeyExample())
                    NavigationLink("Preference Scroll View Example", destination: PreferenceScrollViewExample())
                }
            }
            .navigationTitle("View modifiers")
        }
    }
}
