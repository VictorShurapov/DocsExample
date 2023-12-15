//
//  ConfirmEraseItems.swift
//  DocsExample
//
//  Created by Yaro4ka on 27.07.2023.
//

import SwiftUI

struct ConfirmEraseItems: View {
    @State private var isShowingDialog = false
    
    var body: some View {
        Button("Empty Trash") {
            isShowingDialog = true
        }
        .confirmationDialog(
            "Permanently erase the items in the Trash?",
            isPresented: $isShowingDialog
        ) {
            Button("Empty Trash", role: .destructive) {
                // Handle empty trash action.
            }
        } 
    }
}
struct ConfirmEraseItems_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmEraseItems()
    }
}
