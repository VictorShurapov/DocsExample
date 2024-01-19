//
//  MiniMapPreference.swift
//  DocsExample
//
//  Created by Yaro4ka on 14.01.2024.
//

import SwiftUI

struct MiniMapPreference: View {
    @State private var fieldValues = Array<String>(repeating: "", count: 5)
    @State private var length: Float = 300
    @State private var twitterFieldPreset = false
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                // This view puts a gray rectangle where the minimap elements will be.
                // We will reference its size and position later, to make sure the mini map elements
                // are overlayed right on top of it.
                HStack {
                    Color.cyan
                        .frame(width: 150)
                        .anchorPreference(key: MinimapPreferenceKey.self, value: .bounds) {
                            return [MinimapPreferenceData(viewType: .miniMapArea, bounds: $0)]
                        }
                }
                
                // Form Container
                VStack(alignment: .center) {
                    // Title
                    VStack {
                        Text("Hello \(fieldValues[0]) \(fieldValues[1]) \(fieldValues[2])")
                            .font(.title)
                            .fontWeight(.bold)
                            .anchorPreference(key: MinimapPreferenceKey.self, value: .bounds) {
                                return [MinimapPreferenceData(viewType: .title, bounds: $0)]
                            }
                        Divider()
                    }
                    
                    // Switch + Slider
                    HStack {
                        Toggle("", isOn: $twitterFieldPreset)
                        Slider(value: $length, in: 300...450).layoutPriority(1)
                    }
                    .padding(.bottom, 5)
                    
                    // First row of text fields
                    HStack {
                        FormField(fieldValue: $fieldValues[0], label: "First Name")
                        FormField(fieldValue: $fieldValues[1], label: "Middle Name")
                        FormField(fieldValue: $fieldValues[2], label: "Last Name")
                    }
                    .frame(width: 450)
                    
                    // Second row of text fields
                    HStack {
                        FormField(fieldValue: $fieldValues[3], label: "Email")
                        if twitterFieldPreset {
                            FormField(fieldValue: $fieldValues[4], label: "Twitter")
                        }
                    }
                    .frame(width: CGFloat(length))
                }
                .background(.yellow)
                .transformAnchorPreference(key: MinimapPreferenceKey.self, value: .bounds) {
                    $0.append(MinimapPreferenceData(viewType: .formContainer, bounds: $1))
                }
            }
            .padding()
            .overlayPreferenceValue(MinimapPreferenceKey.self) { preferences in
                GeometryReader { geometry in
                    MiniMap(geometry: geometry, preferences: preferences)
                }
            }
        }
        .background(Color.indigo)
    }
}
