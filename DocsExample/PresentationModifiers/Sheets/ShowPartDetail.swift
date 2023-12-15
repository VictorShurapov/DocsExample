//
//  ShowPartDetail.swift
//  DocsExample
//
//  Created by Yaro4ka on 11.08.2023.
//

import SwiftUI

struct InventoryItem: Identifiable, Equatable {
    var id: String
    let partNumber: String
    let quantity: Int
    let name: String
}

struct ShowPartDetail: View {
    @State private var sheetDetail: InventoryItem?
    
    var body: some View {
        Button("Show Part Details") {
            sheetDetail = InventoryItem(
                id: "0123456789",
                partNumber: "X-1234A",
                quantity: 100, name: "Widget")
        }
        .sheet(item: $sheetDetail, onDismiss: didDismiss) { detail in
            VStack(alignment: .leading, spacing: 20) {
                Text("Part Number: \(detail.partNumber)")
                Text("Name: \(detail.name)")
                Text("Quantity On-Hand: \(detail.quantity)")
            }
            .onTapGesture {
                sheetDetail = nil
            }
        }
    }
    
    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct ShowPartDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShowPartDetail()
    }
}
