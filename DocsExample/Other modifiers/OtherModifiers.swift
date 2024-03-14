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
                    NavigationLink("Map Camera Keyframe Animator", destination: MapCameraKeyframeAnimatorExample())
                    NavigationLink("Three Phase Animation View", destination: ThreePhaseAnimationView())
                    NavigationLink("Keyframe Animator View", destination: KeyframeAnimatorView())
                    NavigationLink("Map Controls", destination: CustomMapView())
                    NavigationLink("Map Scope Compass Button", destination: CompassButtonTestView())
                    NavigationLink("Map Feature", destination: MapFeatureExample())
                }
            }
            .navigationTitle("Other modifiers")
        }
    }
}
