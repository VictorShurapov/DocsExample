//
//  TextPreferenceBorder.swift
//  DocsExample
//
//  Created by Yaro4ka on 09.01.2024.
//

import SwiftUI

struct TextPreferenceBorder: View {
    @State private var activeIndex: Int = 0
    @State private var rects: [CGRect] = Array<CGRect>(repeating: CGRect(), count: 12)
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 3.0)
                .foregroundColor(.green)
                .frame(width: rects[activeIndex].size.width, height: rects[activeIndex].size.height)
                .offset(x: rects[activeIndex].minX, y: rects[activeIndex].minY)
                .animation(.easeInOut(duration: 1.0), value: activeIndex)
            
            VStack {
                Spacer()
                HStack {
                    MonthView(activeMonth: $activeIndex, label: "January", index: 0)
                    MonthView(activeMonth: $activeIndex, label: "February", index: 1)
                    MonthView(activeMonth: $activeIndex, label: "March", index: 2)
                    MonthView(activeMonth: $activeIndex, label: "April", index: 3)
                }
                Spacer()
                HStack {
                    MonthView(activeMonth: $activeIndex, label: "May", index: 4)
                    MonthView(activeMonth: $activeIndex, label: "June", index: 5)
                    MonthView(activeMonth: $activeIndex, label: "July", index: 6)
                    MonthView(activeMonth: $activeIndex, label: "August", index: 7)
                }
                Spacer()
                HStack {
                    MonthView(activeMonth: $activeIndex, label: "September", index: 8)
                    MonthView(activeMonth: $activeIndex, label: "October", index: 9)
                    MonthView(activeMonth: $activeIndex, label: "November", index: 10)
                    MonthView(activeMonth: $activeIndex, label: "December", index: 11)
                }
                Spacer()
            }
            .minimumScaleFactor(0.7)
            .lineLimit(1)
            .onPreferenceChange(MyTextPreferenceKey.self) { myTextPreferenceDataArray in
                for myTextPreferenceData in myTextPreferenceDataArray {
                    rects[myTextPreferenceData.index] = myTextPreferenceData.rect
                }
            }
        }
        .coordinateSpace(name: "myZStack")
    }
}
