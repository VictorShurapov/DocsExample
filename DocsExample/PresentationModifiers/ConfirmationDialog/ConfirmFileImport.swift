//
//  ConfirmFileImport.swift
//  DocsExample
//
//  Created by Yaro4ka on 30.07.2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct FileDetails: Identifiable {
    var id: String { name }
    let name: String
    let fileType: UTType
}

struct ConfirmFileImport: View {
    @State private var isConfirming = false
    @State private var dialogDetail: FileDetails?
    var body: some View {
        Button("Import File") {
            dialogDetail = FileDetails(
                name: "MyImageFile.png", fileType: .png)
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
        }
    }
}

struct ConfirmFileImport_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmFileImport()
    }
}
