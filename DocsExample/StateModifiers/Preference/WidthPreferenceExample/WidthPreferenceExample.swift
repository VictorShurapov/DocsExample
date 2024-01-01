//
//  WidthPreferenceExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 28.12.2023.
//

import SwiftUI

struct WidthPreferenceExample: View {
    // width which we want to apply
    @State private var width: CGFloat? = nil
    
    var body: some View {
        List {
            HStack {
                Text("1.")
                    .equalWidth()
                    .frame(width: width, alignment: .trailing)
                Text("Live up to the name.")
            }
            HStack {
                Text("20.")
                    .equalWidth()
                    .frame(width: width, alignment: .trailing)
                Text("Hard work pays off.")
            }
            HStack {
                Text("20000.")
                    .equalWidth()
                    .frame(width: width, alignment: .trailing)
                Text("People with passion can change the world for the better.")
            }
        }
        .navigationTitle("Width Preference")
        .onPreferenceChange(WidthPreferenceKey.self) { widthArray in
            // collect width from all the child views (who have the preference set)
            // find the widest among all to set that as the width for all the child views
            if let maxWidth = widthArray.max() {
                width = maxWidth
            }
        }
    }
}

#Preview {
    WidthPreferenceExample()
}
