//
//  PickTextFileButton.swift
//  DocsExample
//
//  Created by Yaro4ka on 12.09.2023.
//

import SwiftUI

struct PickTextFileButton: View {
    @State private var showFileImporter = false
    var onTextFilePicked: (String) -> Void
    
    @State private var text = ""
    @State private var error: Error?
    
    var body: some View {
        Button {
            showFileImporter = true
        } label: {
            Label("Import text file",
                  systemImage: "square.and.arrow.down")
        }
        .fileImporter(isPresented: $showFileImporter, allowedContentTypes: [.plainText]) {
            let result = $0.flatMap { url in
                read(from: url)
            }
            switch result {
            case .success(let text):
                self.text += text
                onTextFilePicked(text)
            case .failure(let error):
                self.error = error
            }
        }
    }
    
    private func read(from url: URL) -> Result<String,Error> {
        let accessing = url.startAccessingSecurityScopedResource()
        defer {
            if accessing {
                url.stopAccessingSecurityScopedResource()
            }
        }
        
        return Result { try String(contentsOf: url) }
    }
}

struct PickTextFileButton_Previews: PreviewProvider {
    static var previews: some View {
        PickTextFileButton(onTextFilePicked: { url in })
    }
}
