//
//  CartProduct.swift
//  DocsExample
//
//  Created by Yaro4ka on 01.01.2024.
//

import Foundation

struct CartProduct: Equatable, Identifiable {
    let id = UUID()
    var name: String
    var price: Double = Double.random(in: 9...101)
}

extension CartProduct {
    static var sampleData: [CartProduct] = [
        .init(name: "Shoes"),
        .init(name: "Jacket"),
        .init(name: "Sunglasses"),
        .init(name: "MacBook"),
        .init(name: "Jeans"),
        .init(name: "Shirt"),
        .init(name: "Socks"),
        .init(name: "Hat"),
        .init(name: "Backpack"),
        .init(name: "Underwear"),
    ]
}
