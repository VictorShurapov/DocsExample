//
//  PresentationCompactAdaptation.swift
//  DocsExample
//
//  Created by Yaro4ka on 22.08.2023.
//

import SwiftUI

struct PresentationCompactAdaptation: View {
    @State private var showSettings = false
    
    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .popover(isPresented: $showSettings) {
            SettingsView()
                .presentationCompactAdaptation(
                    horizontal: .popover,
                    vertical: .sheet)
        }
    }
}

struct PresentationCompactAdaptation_Previews: PreviewProvider {
    static var previews: some View {
        PresentationCompactAdaptation()
    }
}
