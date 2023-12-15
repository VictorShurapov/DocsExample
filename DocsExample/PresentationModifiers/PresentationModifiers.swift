//
//  PresentationModifiers.swift
//  DocsExample
//
//  Created by Yaro4ka on 08.12.2023.
//

import SwiftUI

struct PresentationModifiers: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Alerts") {
                    NavigationLink("Alert with Error", destination: AlertWithErrorView())
                    NavigationLink("Alert with Error presenting data", destination: TicketPurchase())
                    NavigationLink("Alert with message", destination: AlertMessageView())
                    NavigationLink("Alert with data", destination: SaveButton())
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
                Section("Popovers") {
                    NavigationLink("Popover with Binding to Bool value", destination: PopoverExample())
                    NavigationLink("Popover with Binding to Data Source", destination: PopoverExampleItem())
                }
                Section("Sheet and popover configuration") {
                    NavigationLink("Interactive Dismiss Disabled", destination: PresentationInteractiveDismiss())
                    NavigationLink("Presentation Detents", destination: PresentationDetents())
                    NavigationLink("Presentation Background", destination: PresentationBackground())
                    NavigationLink("Presentation Background Interaction", destination: PresentationBackgroundInteraction())
                    NavigationLink("Presentation Compact Adaptation", destination: PresentationCompactAdaptation())
                    NavigationLink("Presentation Content Interaction", destination: PresentationContentInteraction())
                    NavigationLink("Presentation Corner Radius", destination: PresentationCornerRadius())
                }
                Section("File Exporter/Importer/Mover") {
                    NavigationLink("File Exporter", destination: ExportingExampleView())
                    NavigationLink("File Importer", destination: ImportingExampleView())
                    NavigationLink("File Mover", destination: FileMoverExample())
                }
                Section("PhotoKit") {
                    NavigationLink("Photo Picker", destination: PhotoPickerExample())
                }
            }
        }
        .navigationTitle("Presentation modifiers")
    }
}
