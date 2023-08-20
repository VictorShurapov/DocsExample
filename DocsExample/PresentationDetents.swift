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
    
    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $settingsDetent, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                Text(".medium").tag(PresentationDetent.medium)
                Text(".large").tag(PresentationDetent.large)
            }
            .pickerStyle(.segmented)
            Button("View Settings") {
                showSettings = true
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
                    .presentationDetents([.medium, .large], selection: $settingsDetent)
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
