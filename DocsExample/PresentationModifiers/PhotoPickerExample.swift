//
//  PhotoPickerExample.swift
//  DocsExample
//
//  Created by Yaro4ka on 08.11.2023.
//

import SwiftUI
import PhotosUI

struct PhotoPickerExample: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [Image] = []
    
    var body: some View {
        if selectedImages.isEmpty {
            ContentUnavailableView("No Photos",
                                   image: "photo.on.rectangle",
                                   description: Text("To get started select some photos below"))
            .frame(height: 300)
        } else {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<selectedImages.count, id: \.self) { index in
                        selectedImages[index]
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .padding(.horizontal, 20)
                            .containerRelativeFrame(.horizontal)
                    }
                }
            }
        }
        
        PhotosPicker(selection: $selectedItems,
                     maxSelectionCount: 5,
                     selectionBehavior: .continuousAndOrdered,
                     matching: .images) {
            Label("Select a photo", systemImage: "photo")
        }
                     .photosPickerStyle(.inline)
                     .photosPickerAccessoryVisibility(.hidden)
                     .frame(height: 300)
                     .ignoresSafeArea()
                     .onChange(of: selectedItems) { oldValue, newValue in
                         selectedImages.removeAll()
                         newValue.forEach { newItem in
                             Task {
                                 if let image = try? await newItem.loadTransferable(type: Image.self) {
                                     selectedImages.append(image)
                                 }
                             }
                         }
                     }
                     .navigationTitle("Photo Picker Inline")
    }
}

#Preview {
    PhotoPickerExample()
}
