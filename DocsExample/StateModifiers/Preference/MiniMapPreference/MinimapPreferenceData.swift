//
//  MinimapPreferenceData.swift
//  DocsExample
//
//  Created by Yaro4ka on 14.01.2024.
//

import SwiftUI

struct MinimapPreferenceData: Identifiable {
    let id = UUID()
    let viewType: MyViewType
    let bounds: Anchor<CGRect>
    
    // Calculate the color to use in the minimap, for each view type
    func getColor() -> Color {
        switch viewType {
        case .field(let length):
            return length == 0 ? .red : (length < 3 ? .yellow : .green)
        case .title:
            return .purple
        default:
            return .gray
        }
    }
    
    // Returns true, if this view type must be shown in the minimap.
    // Only fields, field containers and title are shown in the minimap
    func show() -> Bool {
        switch viewType {
        case .field, .title, .fieldContainer:
            return true
        default:
            return false
        }
    }
}
