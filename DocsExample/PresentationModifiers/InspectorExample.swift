//
//  InspectorExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 07.10.2023.
//

import SwiftUI

struct InspectorExample: View {
    @State private var isShowingInspector = false
    
    var body: some View {
        Button("Show Inspector") {
            isShowingInspector.toggle()
        }
        .inspector(isPresented: $isShowingInspector) {
            VStack {
                Text("Inspector View")
                Text("👋😎🌟")
            }
            .font(.title)
            .presentationDetents([.medium, .large])
            // Sets a flexible, preferred width for the inspector in a trailing-column presentation on macOS
            .inspectorColumnWidth(min: 50, ideal: 150, max: 200)
        }
        .navigationTitle("Inspector")
    }
}

#Preview {
    InspectorExample()
}
