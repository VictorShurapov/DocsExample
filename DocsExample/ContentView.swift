//
//  ContentView.swift
//  DocsExample
//
//  Created by Yaro4ka on 25.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Alert with Error", destination: AlertWithErrorView())
            NavigationLink("Alert with message", destination: AlertMessageView())
            NavigationLink("Alert with data", destination: SaveButton())
                .navigationTitle("Docs Examples")
        }        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


