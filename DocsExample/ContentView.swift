//
//  ContentView.swift
//  DocsExample
//
//  Created by Yaro4ka on 25.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Section("Alerts") {
                NavigationLink("Alert with Error", destination: AlertWithErrorView())
                NavigationLink("Alert with Error presenting data", destination: TicketPurchase())
                    .navigationTitle("Docs Examples")
                NavigationLink("Alert with message", destination: AlertMessageView())
                NavigationLink("Alert with data", destination: SaveButton())
                    .navigationTitle("Docs Examples")
            }
            Section("Confirmations") {
                NavigationLink("Confirmation", destination: ConfirmEraseItems())
                NavigationLink("Confirmation with message", destination: ConfirmEraseItemsMessage())
                NavigationLink("Confirmation with data", destination: ConfirmFileImport())
                NavigationLink("Confirmation with data and message", destination: ConfirmFileImportMessage())
            }
            Section("Sheets") {
                NavigationLink("Sheet Binding to Bool value", destination: ShowLicenseAgreement())
                NavigationLink("Sheet Binding to Data Source", destination: ShowPartDetail())
            }
            Section("Full-Screen Cover") {
                NavigationLink("Full-Screen Cover Binding to Bool value", destination: FullScreenCoverPresentedOnDismiss())
                NavigationLink("Full-Screen Cover Binding to Data Source", destination: FullScreenCoverItemOnDismissContent())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


