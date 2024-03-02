//
//  MapCameraKeyframeAnimatorExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 26.02.2024.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let newYork: Self = .init(
        latitude: 40.730610,
        longitude: -73.935242
    )
    static let seattle: Self = .init(
        latitude: 47.608013,
        longitude: -122.335167
    )
    static let sanFrancisco: Self = .init(
        latitude: 37.773972,
        longitude: -122.431297
    )
}

struct MapCameraKeyframeAnimatorExample: View {
    @State private var trigger = false
    @State private var position: MapCameraPosition = .camera(
        .init(centerCoordinate: .newYork, distance: 10_000_000)
    )
    
    var body: some View {
        Map(position: $position) {
            Marker("New York", monogram: Text("NY"), coordinate: .newYork)
            Marker("Seattle", monogram: Text("SE"), coordinate: .seattle)
            Marker("San Francisco", monogram: Text("SF"), coordinate: .sanFrancisco)
        }
        .mapCameraKeyframeAnimator(trigger: trigger) { camera in
            KeyframeTrack(\MapCamera.centerCoordinate) {
                LinearKeyframe(.newYork, duration: 2)
                LinearKeyframe(.seattle, duration: 2)
                LinearKeyframe(.sanFrancisco, duration: 2)
            }
            KeyframeTrack(\MapCamera.distance) {
                LinearKeyframe(camera.distance, duration: 2)
                LinearKeyframe(camera.distance * 3, duration: 3)
                LinearKeyframe(camera.distance / 10, duration: 2)
            }
        }
        .task {
            trigger.toggle()
        }
    }
}

#Preview {
    MapCameraKeyframeAnimatorExample()
}
