//
//  PresentationCornerRadius.swift
//  DocsExample
//
//  Created by Yaro4ka on 23.08.2023.
//

import SwiftUI

struct PresentationCornerRadius: View {
    @State private var showSettings = false
    @State private var cornerRadiusValue = 21.0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Presentation Corner Radius: \(cornerRadiusValue, specifier: "%.f")")
            Slider(
                value: $cornerRadiusValue,
                in: 8...120)
            Button("Sheet with corner radius") {
                showSettings = true
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
                    .presentationDetents([.medium, .large])
                    .presentationCornerRadius(cornerRadiusValue)
            }
        }
        .padding()
    }
}

struct PresentationCornerRadius_Previews: PreviewProvider {
    static var previews: some View {
        PresentationCornerRadius()
    }
}
