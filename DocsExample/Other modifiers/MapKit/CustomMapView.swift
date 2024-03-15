//
//  CustomMapView.swift
//  DocsExample
//
//  Created by Yaro4ka on 13.03.2024.
//

import MapKit
import SwiftUI

struct CustomMapView: View {
    var body: some View {
        Map {
            Annotation("Seattle", coordinate: .seattle) {
                Image(systemName: "mappin")
                    .foregroundColor(.black)
                    .padding()
                    .background(.red)
                    .clipShape(.circle)
            }
            Marker(coordinate: .newYork) {
                Label("New York", systemImage: "mappin")
            }
            Marker("San Francisco", monogram: Text("SF"), coordinate: .sanFrancisco)
        }
        .mapStyle(.imagery(elevation: .realistic))
        .mapControls {
            MapCompass()
            MapPitchToggle()
            MapScaleView()
            MapUserLocationButton()
        }
        .mapControlVisibility(.visible)
        .navigationTitle("Map controls and customization")
    }
}

#Preview {
    CustomMapView()
}
