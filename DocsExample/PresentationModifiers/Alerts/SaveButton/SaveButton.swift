//
//  SaveButton.swift
//  DocsExample
//
//  Created by Yaro4ka on 26.07.2023.
//

import SwiftUI

struct SaveButton: View {
    @State private var didError = false
    @State private var details: SaveDetails?
    private var model = AlertDataModel()
    
    var body: some View {
        Button("Save") {
            details = model.save(didError: $didError)
        }
        .alert(
            "Save failed.",
            isPresented: $didError,
            presenting: details
        ) { details in
            Button(role: .destructive) {
                // Handle the deletion.
            } label: {
                Text("Delete \(details.name)")
            }
            Button("Retry") {
                // Handle the retry action.
            }
        } message: { details in
            Text(details.error)
        }
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton()
    }
}
