//
//  TextDocument.swift
//  DocsExample
//
//  Created by Yaro4ka on 25.08.2023.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

enum TextDocumentError: Error {
    case regularFileContentError
}

struct TextDocument: FileDocument {
    
    static var readableContentTypes: [UTType] {
        [.plainText]
    }
    
    var text = ""
        
    init(text: String) {
        self.text = text
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents else {
            text = ""
            throw TextDocumentError.regularFileContentError
        }
        text = String(decoding: data, as: UTF8.self)
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        FileWrapper(regularFileWithContents: Data(text.utf8))
    }
}
