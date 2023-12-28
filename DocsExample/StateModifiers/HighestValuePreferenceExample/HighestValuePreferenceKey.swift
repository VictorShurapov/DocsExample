//
//  HighestValuePreferenceKey.swift
//  DocsExample
//
//  Created by Yaro4ka on 29.12.2023.
//

import SwiftUI

struct HighestValuePreferenceKey: PreferenceKey {
    static var defaultValue: SFWeather = SFWeather(month: "", temp: 0)
    
    static func reduce(value: inout SFWeather, nextValue: () -> SFWeather) {
        value = value.temp > nextValue().temp ? value : nextValue()
    }
}
