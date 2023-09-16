//
//  ImportingExampleView.swift
//  DocsExample
//
//  Created by Yaro4ka on 16.09.2023.
//

import SwiftUI

struct ImportingExampleView: View {
    @State private var document = TextDocument(text: "Yarusy@👋")
    
    var body: some View {
        TextEditor(text: $document.text)
            .navigationTitle("File Importer")
            .border(.red)
            .padding()
            .border(.white)
        
            .scrollContentBackground(.hidden)
            .background(.indigo)
        
            .toolbar {
                PickTextFileButton { text in
                    document.text = text
                }
            }
    }
}

struct ImportingExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ImportingExampleView()
    }
}
