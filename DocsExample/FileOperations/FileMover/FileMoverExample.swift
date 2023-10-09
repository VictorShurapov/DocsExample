//
//  FileMoverExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 18.09.2023.
//

import SwiftUI

struct FileMoverExample: View {
    @State private var showFileImporter = false
    @State private var textFileURL: URL?
    @State private var moverURLArray: [URL]?
    
    var body: some View {
        Text(
            "Current URL: \(textFileURL?.absoluteString ?? "No File Selected")"
        )
        
        .navigationTitle("File Mover")
        
        .toolbar {
            ImportFileButton { urlArray in
                moverURLArray = urlArray
                textFileURL = urlArray.first
            } onCancellation: {
                print("File import is cancelled")
            }
            
            MoveTextFileButton(url: $textFileURL) { url in
                textFileURL = url
            }
            
            QuickLookPreviewButton(moverURLArray: $moverURLArray)
        }
    }
}

struct FileMoverExample_Previews: PreviewProvider {
    static var previews: some View {
        FileMoverExample()
    }
}
