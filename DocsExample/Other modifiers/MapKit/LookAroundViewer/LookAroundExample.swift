//
//  LookAroundExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 24.02.2024.
//

import MapKit
import SwiftUI

struct LookAroundExample: View {
    @State private var lookAroundScene: MKLookAroundScene?
    private var coordinate: CLLocationCoordinate2D = .newYork
    
    private func loadLookAroundScene() async {
        lookAroundScene = nil
        let request = MKLookAroundSceneRequest(coordinate: coordinate)
        lookAroundScene = try? await request.scene
    }
    
    var body: some View {
        LookAroundViewer(lookAroundScene: lookAroundScene)
            .task {
                // Asynchronous action
                await loadLookAroundScene()
                print("Data fetched")
            }
    }
}

#Preview {
    LookAroundExample()
}
