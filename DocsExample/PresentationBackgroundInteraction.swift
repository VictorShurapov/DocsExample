//
//  PresentationBackgroundInteraction.swift
//  DocsExample
//
//  Created by Yaro4ka on 22.08.2023.
//

import SwiftUI

struct PresentationBackgroundInteraction: View {
    @State private var showSettings = false
    
    var body: some View {
        VStack(spacing: 100) {
            Button("Print hello!") {
                print("hello")
            }
            Button("View Settings") {
                showSettings = true
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
                    .presentationDetents([.height(120), .medium, .large])
                    .presentationBackgroundInteraction(.enabled(upThrough: .height(120)))
            }
            Spacer()
        }
    }
}

struct PresentationBackgroundInteraction_Previews: PreviewProvider {
    static var previews: some View {
        PresentationBackgroundInteraction()
    }
}
