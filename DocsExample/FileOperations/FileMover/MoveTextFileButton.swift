//
//  MoveTextFileButton.swift
//  DocsExample
//
//  Created by Yaro4ka on 28.09.2023.
//

import SwiftUI

struct MoveTextFileButton: View {
    @State private var showFileMover = false
    @State private var error: Error?
    @Binding var url: URL?
    var onTextFileMoved: (URL) -> Void
    
    var body: some View {
        Button {
            showFileMover = true
        } label: {
            Label("Move text file",
                  systemImage: "arrow.up.right.and.arrow.down.left.rectangle")
        }
        .fileMover(isPresented: $showFileMover, file: url) { result in
            switch result {
            case .success(let url):
                onTextFileMoved(url)
            case .failure(let error):
                self.error = error
            }
        }
    }
}

// wrapper with creation of exampleTextFile for testing FileMover

struct PreviewWrapper: View {
    var exampleTextFile: URL {
        let temporaryDirectory =  FileManager.default.temporaryDirectory
        
        let fileURL = temporaryDirectory.appendingPathComponent("example.txt")
        let text = "This is the content of the text file."
        
        do {
            try text.write(to: fileURL, atomically: true, encoding: .utf8)
            print("File created successfully at \(fileURL.path)")
        } catch {
            print("Error creating file: \(error)")
        }
        return fileURL
    }
    
    var body: some View {
        MoveTextFileButton(url: .constant(exampleTextFile), onTextFileMoved: { _ in } )
    }
}

struct MoveTextFileButton_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
