//
//  PresentationContentInteraction.swift
//  DocsExample
//
//  Created by Yaro4ka on 23.08.2023.
//

import SwiftUI

struct PresentationContentInteraction: View {
    @State private var showSettings = false
    var agreementText = """
    By default, when a person swipes up on a scroll view in a resizable presentation, the presentation grows to the next detent. A scroll view embedded in the presentation only scrolls after the presentation reaches its largest size. Use this modifier to control which action takes precedence.
    For example, you can request that swipe gestures scroll content first, resizing the sheet only after hitting the end of the scroll view, by passing the scrolls value to this modifier:
        By default, when a person swipes up on a scroll view in a resizable presentation, the presentation grows to the next detent. A scroll view embedded in the presentation only scrolls after the presentation reaches its largest size. Use this modifier to control which action takes precedence.
        For example, you can request that swipe gestures scroll content first, resizing the sheet only after hitting the end of the scroll view, by passing the scrolls value to this modifier:
    """
    
    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            ScrollView {
                Text(agreementText)
                    .font(.footnote)
            }
            .padding()
            .presentationDetents([.medium, .large])
            // When .presentationContentInteraction(.scrolls) is set, the user must resize the sheet using the drag indicator. This control is always available regardless of the content interaction behavior set.
            .presentationContentInteraction(.scrolls)
        }
    }
}

struct PresentationContentInteraction_Previews: PreviewProvider {
    static var previews: some View {
        PresentationContentInteraction()
    }
}
