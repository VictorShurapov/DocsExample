//
//  AlertDataModel.swift
//  DocsExample
//
//  Created by Yaro4ka on 26.07.2023.
//

import SwiftUI

class AlertDataModel {
    func save(didError: Binding<Bool>) -> SaveDetails {
        didError.wrappedValue.toggle()
        return SaveDetails(name: "Save details name", error: "Save details error")
    }
}
