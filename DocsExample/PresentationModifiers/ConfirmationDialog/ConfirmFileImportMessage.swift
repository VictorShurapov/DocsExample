//
//  ConfirmFileImportMessage.swift
//  DocsExample
//
//  Created by Yaro4ka on 03.08.2023.
//

import SwiftUI

struct ConfirmFileImportMessage: View {
    @State private var isConfirming = false
    @State private var dialogDetail: FileDetails?
    
    var body: some View {
        Button("Import File") {
            dialogDetail = FileDetails(
                name: "MyImageFile", fileType: .png)
            isConfirming = true
        }
        .confirmationDialog(
            Text("Import New File?"),
            isPresented: $isConfirming, presenting: dialogDetail
        ) { detail in
            Button {
                // Handle import action.
            } label: {
                Text("Import \(detail.name)")
            }
            Button("Cancel", role: .cancel) {
                dialogDetail = nil
            }
        } message: { detail in
            Text(
                  """
                  This will add \(detail.name).\(detail.fileType) \
                  to your library.
                  """)
        }
    }
}

struct ConfirmFileImportMessage_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmFileImportMessage()
    }
}
