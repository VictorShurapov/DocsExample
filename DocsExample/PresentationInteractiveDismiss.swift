//
//  PresentationInteractiveDismiss.swift
//  DocsExample
//
//  Created by Yaro4ka on 18.08.2023.
//

import SwiftUI

struct PresentationInteractiveDismiss: View {
    @State private var isSheetPresented = false
    @State private var areTermsAccepted = false
    
    var body: some View {
        Button("Use Service") {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            TermsOfService(areTermsAccepted: $areTermsAccepted)
                .interactiveDismissDisabled(!areTermsAccepted)
        }
    }

}

struct TermsOfService: View {
    @Binding var areTermsAccepted: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Text("License Agreement")
                .font(.title)
            Text("Terms and conditions go here.")
            Button("Accept") {
                areTermsAccepted = true
                dismiss()
            }
        }
        .onDisappear(perform: {
            areTermsAccepted = false
        })
    }
}

struct PresentationInteractiveDismiss_Previews: PreviewProvider {
    static var previews: some View {
        PresentationInteractiveDismiss()
    }
}
