//
//  ExportingExampleView.swift
//  DocsExample
//
//  Created by Yaro4ka on 01.09.2023.
//

import SwiftUI

struct ExportingExampleView: View {
    @State private var exporting = false
    @State private var document = TextDocument(text: "RTVSF👋")
    
    var body: some View {
        TextEditor(text: $document.text)
            .padding()
            .toolbar {
                Button("Export") {
                    exporting = true
                }
                .fileExporter(
                    isPresented: $exporting,
                    document: document,
                    contentType: .plainText
                ) { result in
                    switch result {
                    case .success(let file):
                        print(file)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
    }
}

struct ExportingExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExportingExampleView()
    }
}
