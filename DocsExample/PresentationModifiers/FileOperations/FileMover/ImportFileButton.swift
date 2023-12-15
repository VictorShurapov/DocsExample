//
//  ImportTextFileButton.swift
//  DocsExample
//
//  Created by Yaro4ka on 28.09.2023.
//

import SwiftUI

struct ImportFileButton: View {
    @State private var showFileImporter = false
    @State private var error: Error?
    var onTextFilePicked: ([URL]) -> Void
    var onCancellation: (() -> Void)?

    
    var body: some View {
        Button {
            showFileImporter = true
        } label: {
            Label("Import text file",
                  systemImage: "square.and.arrow.down")
        }
        .fileImporter(isPresented: $showFileImporter, allowedContentTypes: [.plainText, .image], allowsMultipleSelection: true, onCompletion: { result in
            switch result {
            case .success(let urlArray):
                onTextFilePicked(urlArray)
                onCancellation?()
            case .failure(let error):
                self.error = error
            }
        })
    }
}

struct ImportTextFileButton_Previews: PreviewProvider {
    static var previews: some View {
        ImportFileButton(onTextFilePicked: { _ in } )
    }
}
