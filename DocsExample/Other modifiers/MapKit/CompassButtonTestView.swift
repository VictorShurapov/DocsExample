//
//  CompassButtonTestView.swift
//  DocsExample
//
//  Created by Yaro4ka on 13.03.2024.
//

import MapKit
import SwiftUI

struct CompassButtonTestView: View {
    @Namespace var mapScope
    var body: some View {
        VStack {
            Map(scope: mapScope)
            HStack {
                MapScaleView(scope: mapScope)
                MapCompass(scope: mapScope)
            }
        }
        .mapScope(mapScope)
        .navigationTitle("Map controls mapScope")
    }
}

#Preview {
    CompassButtonTestView()
}
