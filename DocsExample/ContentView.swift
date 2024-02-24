//
//  ContentView.swift
//  DocsExample
//
//  Created by Yaro4ka on 25.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink("Presentation modifiers", destination: PresentationModifiers())
                NavigationLink("State modifiers", destination: StateModifiers())
                NavigationLink("Other modifiers", destination: OtherModifiers())                
            }
        } detail: {
            NavigationStack {
                Text("Select Example! :)")
            }
        }
    }
}
