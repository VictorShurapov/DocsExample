//
//  ShowLicenseAgreement.swift
//  DocsExample
//
//  Created by Yaro4ka on 10.08.2023.
//

import SwiftUI



struct ShowLicenseAgreement: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        Button {
            isShowingSheet.toggle()
        } label: {
            Text("Show License Agreement, \(Image(systemName: "globe"))!")
        }
        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss) {
            VStack {
                Text("License Agreement")
                    .font(.title)
                    .padding(50)
                Text("""
                        Terms and conditions go here
                     """)
                .padding(50)
                Button("Dismiss") {
                    isShowingSheet.toggle()
                }
            }
        }
        
    }
    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct ShowLicenseAgreement_Previews: PreviewProvider {
    static var previews: some View {
        ShowLicenseAgreement()
    }
}
