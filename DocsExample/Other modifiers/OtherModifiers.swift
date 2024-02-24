//
//  OtherModifiers.swift
//  DocsExample
//
//  Created by Yaro4ka on 24.02.2024.
//

import SwiftUI

struct OtherModifiers: View {
    var body: some View {
        NavigationStack {
            List {
                Section("MapKit") {
                    NavigationLink("Look Around Viewer", destination: LookAroundViewer())
                }
            }
            .navigationTitle("Other modifiers")
        }
    }
}

#Preview {
    OtherModifiers()
}
