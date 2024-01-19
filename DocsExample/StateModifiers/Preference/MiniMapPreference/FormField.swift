//
//  FormField.swift
//  DocsExample
//
//  Created by Yaro4ka on 14.01.2024.
//

import SwiftUI

// This view draws a rounded box, with a label and a textfield
struct FormField: View {
    @Binding var fieldValue: String
    let label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            TextField("", text: $fieldValue)
                .textFieldStyle(.roundedBorder)
                .anchorPreference(key: MinimapPreferenceKey.self, value: .bounds) {
                    return [MinimapPreferenceData(viewType: .field(fieldValue.count), bounds: $0)]
                }
        }
        .padding(15)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color(white: 0.9)))
        .transformAnchorPreference(key: MinimapPreferenceKey.self, value: .bounds) {
            $0.append(MinimapPreferenceData(viewType: .fieldContainer, bounds: $1))
        }
    }
}
