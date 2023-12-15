//
//  AlertMessageView.swift
//  DocsExample
//
//  Created by Yaro4ka on 26.07.2023.
//

import SwiftUI

struct AlertMessageView: View {
    @State private var didFail = false
    let alertTitle: String = "Login failed"
    
    var body: some View {
        LoginForm(didFail: $didFail)
            .alert(
                alertTitle,
                isPresented: $didFail) {
                    Button("Nice") {
                        print("alert ok button pressed")
                    }
                    Button("OK") {
                        print("alert ok button pressed")
                    }
                    .keyboardShortcut(.defaultAction)
                } message: {
                    Text("Please check your credentials and try again.")
                }
    }
}

struct LoginForm: View {
    @Binding var didFail: Bool
    @State var loginPassword = ""
    
    var body: some View {
        Form {
            TextField("Login password", text: $loginPassword)
            Button("Present Alert with message") {
                $didFail.wrappedValue.toggle()
            }
        }
    }
}

struct AlertMessageView_Previews: PreviewProvider {
    static var previews: some View {
        AlertMessageView()
    }
}
