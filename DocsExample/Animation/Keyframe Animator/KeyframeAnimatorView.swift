//
//  KeyframeAnimatorView.swift
//  DocsExample
//
//  Created by Yaro4ka on 08.03.2024.
//

import SwiftUI

struct KeyframeAnimatorView: View {
    var emoji: String = "❤️"
    @State private var likeCount = 1
    @State private var tapCount = 1
    
    var body: some View {
        VStack {
            EmojiView(emoji: emoji)
                .keyframeAnimator(
                    initialValue: AnimationValues(),
                    trigger: likeCount
                ) { content, value in
                    content
                        .rotationEffect(value.angle)
                        .scaleEffect(value.scale)
                        .scaleEffect(y: value.verticalStretch)
                        .offset(y: value.verticalOffset)
                        .rotation3DEffect(value.rotationDegrees, axis: (x: 0, y: 1, z: 0))
                } keyframes: { _ in
                    KeyframeTrack(\.scale) {
                        LinearKeyframe(1.0, duration: 0.36)
                        SpringKeyframe(1.5, duration: 0.8, spring: .bouncy)
                        SpringKeyframe(1.0, spring: .bouncy)
                    }
                    KeyframeTrack(\.verticalOffset) {
                        LinearKeyframe(0.0, duration: 0.1)
                        SpringKeyframe(20.0, duration: 0.15, spring: .bouncy)
                        SpringKeyframe(-60.0, duration: 1.0, spring: .bouncy)
                        SpringKeyframe(0.0, spring: .bouncy)
                    }
                    KeyframeTrack(\.verticalStretch) {
                        CubicKeyframe(1.0, duration: 0.1)
                        CubicKeyframe(0.6, duration: 0.15)
                        CubicKeyframe(1.5, duration: 0.1)
                        CubicKeyframe(1.05, duration: 0.15)
                        CubicKeyframe(1.0, duration: 0.88)
                        CubicKeyframe(0.8, duration: 0.1)
                        CubicKeyframe(1.04, duration: 0.4)
                        CubicKeyframe(1.0, duration: 0.22)
                    }
                    KeyframeTrack(\.angle) {
                        CubicKeyframe(.zero, duration: 0.58)
                        CubicKeyframe(.degrees(16), duration: 0.125)
                        CubicKeyframe(.degrees(-16), duration: 0.125)
                        CubicKeyframe(.degrees(16), duration: 0.125)
                        CubicKeyframe(.zero, duration: 0.125)
                    }
                }
                .onTapGesture {
                    likeCount += 1
                }
            
            VStack {
                Text("SwiftUI")
                    .font(.system(size: 36)).italic()
                    .keyframeAnimator(
                        initialValue: AnimationValues(),
                        trigger: tapCount
                    ) { content, value in
                        content
                            .rotation3DEffect(value.rotationDegrees, axis: (x: 0, y: 1, z: 0))
                    } keyframes: { _ in
                        KeyframeTrack(\.scale) {
                            LinearKeyframe(1.0, duration: 0.36)
                            SpringKeyframe(1.5, duration: 0.8, spring: .bouncy)
                            SpringKeyframe(1.0, spring: .bouncy)
                        }
                        KeyframeTrack(\.verticalOffset) {
                            LinearKeyframe(0.0, duration: 0.1)
                            SpringKeyframe(20.0, duration: 0.15, spring: .bouncy)
                            SpringKeyframe(-60.0, duration: 1.0, spring: .bouncy)
                            SpringKeyframe(0.0, spring: .bouncy)
                        }
                        KeyframeTrack(\.verticalStretch) {
                            CubicKeyframe(1.0, duration: 0.1)
                            CubicKeyframe(0.6, duration: 0.15)
                            CubicKeyframe(1.5, duration: 0.1)
                            CubicKeyframe(1.05, duration: 0.15)
                            CubicKeyframe(1.0, duration: 0.88)
                            CubicKeyframe(0.8, duration: 0.1)
                            CubicKeyframe(1.04, duration: 0.4)
                            CubicKeyframe(1.0, duration: 0.22)
                        }
                        KeyframeTrack(\.angle) {
                            CubicKeyframe(.zero, duration: 0.58)
                            CubicKeyframe(.degrees(16), duration: 0.125)
                            CubicKeyframe(.degrees(-16), duration: 0.125)
                            CubicKeyframe(.degrees(16), duration: 0.125)
                            CubicKeyframe(.zero, duration: 0.125)
                        }
                        KeyframeTrack(\.rotationDegrees) {
                            LinearKeyframe(.zero, duration: 0.1)
                            SpringKeyframe(.degrees(-120), duration: 0.15, spring: .bouncy)
                            SpringKeyframe(.degrees(360), duration: 1.0, spring: .bouncy)
                            SpringKeyframe(.zero, spring: .bouncy)
                        }
                    }
                
                Text("Ukraine")
                    .font(.system(size: 36)).italic()
                    .keyframeAnimator(
                        initialValue: AnimationValues(),
                        trigger: tapCount
                    ) { content, value in
                        content
                            .rotation3DEffect(value.rotationDegrees, axis: (x: 0, y: 1, z: 0))
                    } keyframes: { _ in
                        KeyframeTrack(\.scale) {
                            LinearKeyframe(1.0, duration: 0.36)
                            SpringKeyframe(1.5, duration: 0.8, spring: .bouncy)
                            SpringKeyframe(1.0, spring: .bouncy)
                        }
                        KeyframeTrack(\.verticalOffset) {
                            LinearKeyframe(0.0, duration: 0.1)
                            SpringKeyframe(20.0, duration: 0.15, spring: .bouncy)
                            SpringKeyframe(-60.0, duration: 1.0, spring: .bouncy)
                            SpringKeyframe(0.0, spring: .bouncy)
                        }
                        KeyframeTrack(\.verticalStretch) {
                            CubicKeyframe(1.0, duration: 0.1)
                            CubicKeyframe(0.6, duration: 0.15)
                            CubicKeyframe(1.5, duration: 0.1)
                            CubicKeyframe(1.05, duration: 0.15)
                            CubicKeyframe(1.0, duration: 0.88)
                            CubicKeyframe(0.8, duration: 0.1)
                            CubicKeyframe(1.04, duration: 0.4)
                            CubicKeyframe(1.0, duration: 0.22)
                        }
                        KeyframeTrack(\.angle) {
                            CubicKeyframe(.zero, duration: 0.58)
                            CubicKeyframe(.degrees(16), duration: 0.125)
                            CubicKeyframe(.degrees(-16), duration: 0.125)
                            CubicKeyframe(.degrees(16), duration: 0.125)
                            CubicKeyframe(.zero, duration: 0.125)
                        }
                        KeyframeTrack(\.rotationDegrees) {
                            LinearKeyframe(.zero, duration: 0.1)
                            SpringKeyframe(.degrees(120), duration: 0.15, spring: .bouncy)
                            SpringKeyframe(.degrees(-360), duration: 1.0, spring: .bouncy)
                            SpringKeyframe(.zero, spring: .bouncy)
                        }
                    }
            }
            .onTapGesture {
                tapCount += 1
            }
            .navigationTitle("KeyframeAnimator")
        }
    }
}

#Preview {
    KeyframeAnimatorView()
}
