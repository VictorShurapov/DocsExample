//
//  EmojiView.swift
//  DocsExample
//
//  Created by Yaro4ka on 06.03.2024.
//

import SwiftUI

struct EmojiView: View {
    var emoji: String
    
    var body: some View {
        Text(emoji)
            .font(.system(size: 38))
    }
}

#Preview {
    EmojiView(emoji: "❤️")
}
