//
//  LookAroundViewer.swift
//  DocsExample
//
//  Created by Yaro4ka on 24.02.2024.
//

import SwiftUI
import MapKit

struct LookAroundViewer: View {
    var lookAroundScene: MKLookAroundScene?
    @State private var isLookingAround: Bool = false
    
    var body: some View {
        Button {
            isLookingAround.toggle()
            
        } label: {
            Label("Look around", systemImage: "binoculars")
        }
        .lookAroundViewer(isPresented: $isLookingAround, initialScene: lookAroundScene)
    }
}

#Preview {
    LookAroundViewer()
}
