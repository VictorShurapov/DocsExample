//
//  SFWeather.swift
//  DocsExample
//
//  Created by Yaro4ka on 29.12.2023.
//

import Foundation

struct SFWeather: Equatable, Identifiable {
    let id = UUID()
    var month: String
    var temp: Int
}

extension SFWeather {
    static var sampleData: [SFWeather] = [
        .init(month: "Jan", temp: 65),
        .init(month: "Feb", temp: 68),
        .init(month: "Mar", temp: 72),
        .init(month: "Apr", temp: 56),
        .init(month: "May", temp: 66),
        .init(month: "Jun", temp: 75),
        .init(month: "Jul", temp: 83),
        .init(month: "Aug", temp: 97),
        .init(month: "Sep", temp: 103),
        .init(month: "Oct", temp: 87),
        .init(month: "Nov", temp: 76),
        .init(month: "Dec", temp: 62)
    ]
}
