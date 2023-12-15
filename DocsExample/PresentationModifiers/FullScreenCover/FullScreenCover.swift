//
//  FullScreenCover.swift
//  DocsExample
//
//  Created by Yaro4ka on 11.08.2023.
//

import SwiftUI

struct FullScreenCoverPresentedOnDismiss: View {
    @State private var isPresenting = false
    
    var body: some View {
        Button("Present Full-Screen Cover") {
            isPresenting.toggle()
        }
        .fullScreenCover(isPresented: $isPresenting) {
            didDismiss()
        } content: {
            VStack {
                Text("Yarusya Kozel Super! 🌟")
                    .font(.title)
                Text("Tap to Dismiss ✨")
            }
            .onTapGesture {
                isPresenting.toggle()
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

struct FullScreenCover_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverPresentedOnDismiss()
    }
}
