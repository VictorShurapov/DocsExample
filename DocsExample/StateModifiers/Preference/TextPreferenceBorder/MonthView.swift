//
//  MonthView.swift
//  DocsExample
//
//  Created by Yaro4ka on 09.01.2024.
//

import SwiftUI

struct MonthView: View {
    @Binding var activeMonth: Int
    let label: String
    let index: Int
    
    var body: some View {
        Text(label)
            .padding(10)
            .background(MyPreferenceViewSetter(index: index)).onTapGesture {
                activeMonth = index
            }
    }
}
