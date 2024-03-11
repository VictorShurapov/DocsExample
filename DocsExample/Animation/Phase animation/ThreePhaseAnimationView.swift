//
//  ThreePhaseAnimationView.swift
//  DocsExample
//
//  Created by Yaro4ka on 06.03.2024.
//

import SwiftUI

struct ThreePhaseAnimationView: View {
    var emoji: String = "❤️"
    @State private var likeCount = 1
    
    var body: some View {
        EmojiView(emoji: emoji)
            .phaseAnimator(
                    AnimationPhase.allCases,
                    trigger: likeCount
                ) { content, phase in
                    content
                        .scaleEffect(phase.scale)
                        .offset(y: phase.verticalOffset)
                } animation: { phase in
                    switch phase {
                    case .initial: .smooth
                    case .move: .easeInOut(duration: 0.3)
                    case .scale: .spring(
                        duration: 0.3, bounce: 0.7)
                    }
                }
            .onTapGesture {
                likeCount += 1
            }
    }
}


#Preview {
    ThreePhaseAnimationView()
}
