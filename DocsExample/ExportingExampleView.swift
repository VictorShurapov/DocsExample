//
//  ExportingExampleView.swift
//  DocsExample
//
//  Created by Yaro4ka on 01.09.2023.
//

import SwiftUI

struct ExportingExampleView: View {
    @State private var showFileExporter = false
    @State private var document = TextDocument(text: "Yarusy@👋")
    
    var body: some View {
        TextEditor(text: $document.text)
            .navigationTitle("File Exporter")
            .border(.red)
            .padding()
            .border(.white)

            .scrollContentBackground(.hidden)
            .background(.indigo)
        
            .toolbar {
                Button {
                    showFileExporter = true
                } label: {
                    Label("Export text file",
                          systemImage: "square.and.arrow.up")
                }
                .fileExporter(
                    isPresented: $showFileExporter,
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
