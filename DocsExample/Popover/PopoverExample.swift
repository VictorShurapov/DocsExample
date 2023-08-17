//
//  PopoverExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 16.08.2023.
//

import SwiftUI

struct PopoverExample: View {
    @State private var isShowingPopover = false
    
    var body: some View {
        Button("Show Popover") {
            self.isShowingPopover = true
        }
        .popover(isPresented: $isShowingPopover, attachmentAnchor: .point(.bottomTrailing), arrowEdge: .bottom) {
            Text("""
                 For compact size class of the content area
                 Popover Content is shown as
                 a full-screen modal view like a sheet.
                 """)
            .padding()
        }
    }
}

struct PopoverExample_Previews: PreviewProvider {
    static var previews: some View {
        PopoverExample()
    }
}
