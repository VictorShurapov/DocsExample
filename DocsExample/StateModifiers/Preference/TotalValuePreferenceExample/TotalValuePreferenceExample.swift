//
//  TotalValuePreferenceExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 01.01.2024.
//

import SwiftUI

struct TotalValuePreferenceExample: View {
    @State private var total: Double = 0
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(CartProduct.sampleData) { cartProduct in
                    HStack {
                        Text("Item \(cartProduct.name)")
                        Spacer()
                        Text(cartProduct.price, format: .currency(code: "USD"))
                            .preference(key: TotalValuePreferenceKey.self, value: cartProduct.price)
                    }
                }
                HStack {
                    Text("Cart Total:")
                    Spacer()
                    Text(total, format: .currency(code: "USD"))
                }
                .font(.title.bold())
            }
            .navigationTitle("Total Value Preference")
            .onPreferenceChange(TotalValuePreferenceKey.self) { totalValue in
                total = totalValue
            }
        }
    }
}
