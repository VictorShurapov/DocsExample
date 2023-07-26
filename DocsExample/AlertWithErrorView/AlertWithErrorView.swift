//
//  AlertWithErrorView.swift
//  DocsExample
//
//  Created by Yaro4ka on 25.07.2023.
//

import SwiftUI

// MARK: - Form
struct AlertWithErrorForm: View {
    @Binding var showAlert: Bool
    @Binding var error: AlertError?
    
    var body: some View {
        Form {
            Section(("This is test form")) {
                Button {
                    $showAlert.wrappedValue.toggle()
                    $error.wrappedValue = AlertError.incorrectPassword
                } label: {
                    Text("Test form do something")
                }
            }
        }
    }
}

// MARK: - AlertWithErrorView
struct AlertWithErrorView: View {
    @State private var showAlert = false
    @State private var error: AlertError? = nil
    
    var body: some View {
        AlertWithErrorForm(showAlert: $showAlert, error: $error)
            .alert(isPresented: $showAlert, error: error) {
                Button("Expand the reality") {
                    print("This is Alert action")
                }
            }
            .navigationTitle("AlertWithErrorView")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct AlertWithErrorView_Previews: PreviewProvider {
    static var previews: some View {
        AlertWithErrorView()
    }
}
