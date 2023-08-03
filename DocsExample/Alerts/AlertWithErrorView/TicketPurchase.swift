//
//  TicketPurchase.swift
//  DocsExample
//
//  Created by Yaro4ka on 26.07.2023.
//

import SwiftUI

struct TicketPurchase: View {
    @State private var error: AlertError? = nil
    @State private var showAlert = false
    
    var body: some View {
        TicketForm(showAlert: $showAlert, error: $error)
            .alert(
                isPresented: $showAlert,
                error: error) { _ in
                    Button("OK") {
                        // Handle acknowledgment.
                    }
                } message: { error in
                    Text(error.recoverySuggestion ?? "Try again later.")
                }
    }
}

struct TicketForm: View {
    @Binding var showAlert: Bool
    @Binding var error: AlertError?
    @State private var ticketHolderName = ""
    
    var body: some View {
        Form {
            TextField("Ticket holder name", text: $ticketHolderName)
            Button("Show alert") {
                $showAlert.wrappedValue.toggle()
                $error.wrappedValue = AlertError.unstableConnection
            }
        }
    }
}

struct TicketPurchase_Previews: PreviewProvider {
    static var previews: some View {
        TicketPurchase()
    }
}
