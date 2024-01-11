//
//  MonthAnchorView.swift
//  DocsExample
//
//  Created by Yaro4ka on 11.01.2024.
//

import SwiftUI

struct MonthAnchorView: View {
    @Binding var activeMonth: Int
    let label: String
    let index: Int
    
    var body: some View {
        Text(label)
            .lineLimit(1)
            .minimumScaleFactor(0.7)
            .padding(10)
            .anchorPreference(
                key: TextAnchorPreferenceKey.self,
                value: .bounds,
                transform: { [TextAnchorPreferenceData(viewIndex: index, bounds: $0)] }
            )
            .onTapGesture {
                activeMonth = index
            }
    }
}
