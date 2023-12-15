//
//  QuickLookPreviewButton.swift
//  DocsExample
//
//  Created by Yaro4ka on 09.10.2023.
//

import SwiftUI
import QuickLook

struct QuickLookPreviewButton: View {
    @State var textFileURL: URL?
    @Binding var moverURLArray: [URL]?
    
    var body: some View {
        Button {
            textFileURL = moverURLArray?.first
        } label: {
            Label("Quick Look Preview",
                  systemImage: "eye.square")
        }
        .quickLookPreview($textFileURL, in: moverURLArray ?? [])
    }
}
