//
//  MapFeatureExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 14.03.2024.
//

import MapKit
import SwiftUI

struct MapFeatureExample: View {
    @State private var position: MapCameraPosition = .camera(
        .init(centerCoordinate: .kyiv, distance: 1000)
    )
    @State private var selectedFeature: MapFeature?
    
    var body: some View {
        Map(position: $position, selection: $selectedFeature) {
        }
        .mapStyle(.hybrid)
        .mapFeatureSelectionContent { feature in
            if feature.pointOfInterestCategory == .hotel {
                Marker("😴", coordinate: feature.coordinate)
            } else {
                EmptyMapContent()
            }
        }
        .mapFeatureSelectionDisabled { feature in
            feature.pointOfInterestCategory == .cafe ? true : false
        }
    }
}

#Preview {
    MapFeatureExample()
}
