//
//  PresentationBackground.swift
//  DocsExample
//
//  Created by Yaro4ka on 21.08.2023.
//

import SwiftUI

struct PresentationBackground: View {
    // present sheet with shape style or custom view as background
    @State private var showSheetShapeStyle = false
    @State private var showSheetCustomView = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.green)
                .frame(width: 300, height: 300)
            VStack(spacing: 20) {
                Button("Sheet with shape style background") {
                    showSheetShapeStyle = true
                }
                .sheet(isPresented: $showSheetShapeStyle) {
                    Text("Shape style background")
                        .presentationBackground(.ultraThinMaterial)
                }
                
                Button("Sheet with custom view background") {
                    showSheetCustomView = true
                }
                .sheet(isPresented: $showSheetCustomView) {
                    Text("Custom view background")
                        .presentationBackground {
                            ZStack {
                                Rectangle().fill(.red)
                                Rectangle().fill(.ultraThinMaterial)
                            }
                        }
                }
            }
        }
    }
}

struct PresentationBackground_Previews: PreviewProvider {
    static var previews: some View {
        PresentationBackground()
    }
}
