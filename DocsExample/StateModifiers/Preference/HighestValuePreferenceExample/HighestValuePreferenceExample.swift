//
//  HighestValuePreferenceExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 29.12.2023.
//

import SwiftUI

struct HighestValuePreferenceExample: View {
    @State private var hottestMonth: SFWeather? = nil
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(SFWeather.sampleData) { weather in
                    HStack {
                        Text(weather.month)
                        Spacer()
                        Text("\(weather.temp)°F")
                    }
                    .preference(key: HighestValuePreferenceKey.self, value: weather)
                    
                }
                if let hottestMonth {
                    Text("Month of **\(hottestMonth.month)** was at burning **\(hottestMonth.temp)°F** 🌡")
                }
            }
            .navigationTitle("Highest Value Preference")
            .onPreferenceChange(HighestValuePreferenceKey.self) { hottestWeather in
                hottestMonth = hottestWeather
            }
        }
    }
}
