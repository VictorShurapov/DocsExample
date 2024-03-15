//
//  MapCameraChangeExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 14.03.2024.
//

import MapKit
import SwiftUI

struct MapCameraChangeExample: View {
    @State private var position: MapCameraPosition = .camera(
        .init(centerCoordinate: .newYork, distance: 10_000_000)
    )
    @State private var regionText: String = ""
    
    var body: some View {
        Map(position: $position) {
            Marker("New York", monogram: Text("NY"), coordinate: .newYork)
            Marker("Seattle", monogram: Text("SE"), coordinate: .seattle)
            Marker("San Francisco", monogram: Text("SF"), coordinate: .sanFrancisco)
        }
        .overlay(alignment: .top) {
            Text(regionText)
                .padding()
        }
        .onMapCameraChange(frequency: .continuous) { context in
            regionText = "Latitude: \(context.region.center.latitude)\nLongitude: \(context.region.center.longitude)"
            print(context.camera)
            print(context.rect)
            print(context.region)
        }
        .navigationTitle("onMapCameraChange")
    }
}

#Preview {
    MapCameraChangeExample()
}
