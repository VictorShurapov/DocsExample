//
//  PresentationDetents.swift
//  DocsExample
//
//  Created by Yaro4ka on 19.08.2023.
//

import SwiftUI

struct PresentationDetents: View {
    @State private var showSettings = false
    @State private var settingsDetent = PresentationDetent.medium
    @State private var presentationDragIndicatorIsVisible: Bool = true
    
    var body: some View {
        Form {
            List {
                Picker(selection: $settingsDetent, label: Text("Presentation Detent")) {
                    Text(".medium").tag(PresentationDetent.medium)
                    Text(".large").tag(PresentationDetent.large)
                }
                
                Picker(selection: $presentationDragIndicatorIsVisible, label: Text("Presentation Drag Indicator")) {
                    Text("visible").tag(true)
                    Text("hidden").tag(false)
                }
            }
            Button("View Settings") {
                showSettings = true
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
                    .presentationDetents([.medium, .large], selection: $settingsDetent)
                    .presentationDragIndicator(presentationDragIndicatorIsVisible ? .visible : .hidden)
            }
        }
    }
}

struct SettingsView: View {
    
    var body: some View {
        Text("SettingsView")
            .font(.title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue)
            .ignoresSafeArea(.all)
    }
}

struct PresentationDetents_Previews: PreviewProvider {
    static var previews: some View {
        PresentationDetents()
    }
}
