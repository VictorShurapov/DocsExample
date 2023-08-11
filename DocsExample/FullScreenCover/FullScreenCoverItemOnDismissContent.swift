//
//  FullScreenCoverItemOnDismissContent.swift
//  DocsExample
//
//  Created by Yaro4ka on 11.08.2023.
//

import SwiftUI

struct CoverData: Identifiable {
    var body: String
    var id: String {
        return body
    }
}

struct FullScreenCoverItemOnDismissContent: View {
    @State private var coverData: CoverData?
    
    var body: some View {
        Button("Present Full-Screen Cover With Data") {
            coverData = CoverData(body: "Custom Data")
        }
        .fullScreenCover(item: $coverData,
                         onDismiss: didDismiss) { details in
            VStack(spacing: 20) {
                Text("\(details.body)")
                    .font(.title)
                Text("Tap to Dismiss ✨")
            }
            .onTapGesture {
                coverData = nil
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue)
            .ignoresSafeArea(.all)
        }
    }
    
    func didDismiss() {
        // Handle the dismissing action.
    }
}



struct FullScreenCoverItemOnDismissContent_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverItemOnDismissContent()
    }
}
