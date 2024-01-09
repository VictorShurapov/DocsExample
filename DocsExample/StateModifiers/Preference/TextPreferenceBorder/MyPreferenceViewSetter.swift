//
//  MyPreferenceViewSetter.swift
//  DocsExample
//
//  Created by Yaro4ka on 09.01.2024.
//

import SwiftUI

struct MyPreferenceViewSetter: View {
    let index: Int
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(.clear)
                .preference(key: MyTextPreferenceKey.self, value: [MyTextPreferenceData(index: index, rect: geometry.frame(in: .named("myZStack")))])
            
        }
    }
}
