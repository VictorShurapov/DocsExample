//
//  ConfirmEraseItemsMessage.swift
//  DocsExample
//
//  Created by Yaro4ka on 03.08.2023.
//

import SwiftUI

struct ConfirmEraseItemsMessage: View {
    @State private var isShowingDialog = false
    var title: String = "ConfirmEraseItemsMessage title"
    
    var body: some View {
        Button {
            isShowingDialog = true
        } label: {
            Label("Empty Trash", systemImage: "trash")
        }
        .confirmationDialog(title, isPresented: $isShowingDialog) {
            Button("Empty Trash", role: .destructive) {
                // Handle empty trash action.
            }
        } message: {
            Text("You cannot undo this action.")
        }
    }
}

struct ConfirmEraseItemsMessage_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmEraseItemsMessage()
    }
}
