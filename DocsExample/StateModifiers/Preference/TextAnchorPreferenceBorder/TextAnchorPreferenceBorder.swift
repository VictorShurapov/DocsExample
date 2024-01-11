//
//  TextAnchorPreferenceBorder.swift
//  DocsExample
//
//  Created by Yaro4ka on 11.01.2024.
//

import SwiftUI

struct TextAnchorPreferenceBorder: View {
    @State private var activeIndex: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                MonthAnchorView(activeMonth: $activeIndex, label: "January", index: 0)
                MonthAnchorView(activeMonth: $activeIndex, label: "February", index: 1)
                MonthAnchorView(activeMonth: $activeIndex, label: "March", index: 2)
                MonthAnchorView(activeMonth: $activeIndex, label: "April", index: 3)
            }
            Spacer()
            HStack {
                MonthAnchorView(activeMonth: $activeIndex, label: "May", index: 4)
                MonthAnchorView(activeMonth: $activeIndex, label: "June", index: 5)
                MonthAnchorView(activeMonth: $activeIndex, label: "July", index: 6)
                MonthAnchorView(activeMonth: $activeIndex, label: "August", index: 7)
            }
            Spacer()
            HStack {
                MonthAnchorView(activeMonth: $activeIndex, label: "September", index: 8)
                MonthAnchorView(activeMonth: $activeIndex, label: "October", index: 9)
                MonthAnchorView(activeMonth: $activeIndex, label: "November", index: 10)
                MonthAnchorView(activeMonth: $activeIndex, label: "December", index: 11)
            }
            Spacer()
        }
        .navigationTitle("Text Anchor Preference Border")
        .backgroundPreferenceValue(TextAnchorPreferenceKey.self) { preferenceArray in
            GeometryReader { geometry in
                createBorder(geometry, preferenceArray)
            }
        }
    }
    
    func createBorder(_ geometry: GeometryProxy, _ preferences: [TextAnchorPreferenceData]) -> some View {
        let activeMonthPreference = preferences.first { $0.viewIndex == activeIndex }
        
        let bounds =
        (activeMonthPreference != nil) ? geometry[activeMonthPreference!.bounds] : .zero
        
        return RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3.0)
            .foregroundColor(.green)
            .frame(width: bounds.size.width, height: bounds.size.height)
            .fixedSize()
            .offset(x: bounds.minX, y: bounds.minY)
            .animation(.easeInOut(duration: 1.0), value: activeIndex)
    }
}
