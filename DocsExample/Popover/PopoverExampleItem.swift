//
//  PopoverExampleItem.swift
//  DocsExample
//
//  Created by Yaro4ka on 17.08.2023.
//

import SwiftUI

struct PopoverModel: Identifiable {
    var id: String { message }
    let message: String
}

struct PopoverExampleItem: View {
    @State private var popover: PopoverModel?
    
    var body: some View {
        Button("Show Popover") {
            popover = PopoverModel(message: "Custom Message")
        }
        .popover(item: $popover) { detail in
            Text("""
                 \(detail.message)
                 
                 *For compact size class of the content area
                  Popover Content is shown as
                  full-screen modal view like a sheet.
                 """)
            .padding()
        }
    }
}

struct PopoverExampleItem_Previews: PreviewProvider {
    static var previews: some View {
        PopoverExampleItem()
    }
}
