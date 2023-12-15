//
//  DogProfileView.swift
//  DocsExample
//
//  Created by Yaro4ka on 17.11.2023.
//

import SwiftUI

struct Dog: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var breed: String
    var backstory: String
}

struct DogProfileView: View, Hashable {
    var rescueDog: Dog = Dog(
        name: "Pretzel",
        breed: "Ruby Spaniel",
        backstory: "Pretzel sat amongst the clump of smooth beach stones. It was a bright, clear day, with friendly waves stretching out all the way to Inishmore, yet the dull, gray sand around him managed to drag down his thoughts to the dire reality he found himself within. He could hear faint human noises all the way from Salthill, and even more vividly smell the beachside treats being unwrapped and passed around amidst the playtime. Yet for all the smells of the beach and ocean that swirled around him, salty and savory, Pretzel's mind was lost staring blankly into dewy moss covering the rock just in front of him. \r\rThe road here had been a long one, and its end as dissatisfying as the beginning. The journey had taken its toll: his hair was clumped and scratchy, his frame a scraggly mess worn from tussles and tears. \rNow, sitting near the ocean's edge, not knowing where else to go, Pretzel let his limbs fall limp with exhaustion. \r\rA scent, different from the rest. It came and went, mixing with the ocean smells, as if dancing lightly between the mossy boulders surrounding him. It grew stronger, wrapping around his body like a warm blanket, easing the tension out of him. It grew stronger still, igniting a fire within him. Pretzel lifted his head, pointing his snout in different directions. Where was it coming from? \rSuddenly he was back on the road, trotting west but still within view of the cracked shoreline. He followed the smell along an old stone wall that opened up into an unkempt yard. The old house beyond was still intact but half-covered in vines, its tentacles crawling up over the windows to one of the two chimneys on the leftpaw side of the roof. \r\rPretzel stood at the yard entrance, feeling an odd camaraderie within this old ruin he'd never seen before. He gave a sturdy sniff in the direction of the front door: a dead end. Not wanting to go, Pretzel nonetheless turned back towards the road.\rThe scent was growing stronger, and it pulled Pretzel onto a side street that curved off an up above the road.\rThickly lined with twisted trees and crumbling stone walls, he could not see where the road ultimately led around the bend, but the scent was undeniable. Cautiously working his way around each turn, suddenly he found himself in a wide driveway, with several cars parked about.\rSomething felt familiar and welcoming about this place. He trotted over the steps that went up from the left edge, leading to a walkway that curved through a small garden and arriving at a screen porch door.")
    
    var body: some View {
        ScrollViewReader(content: { proxy in
            ScrollView {
                HeaderView(rescueDog)
                    .id(rescueDog.id)
                
                Text(rescueDog.backstory)
                    .padding()
                
                Button("Jump to Top") {
                    withAnimation {
                        proxy.scrollTo(rescueDog.id)
                    }
                }
                .buttonStyle(.bordered)
                .cornerRadius(20)
                .padding()
            }
            .padding()
        })
        .navigationTitle("DogProfileView")
    }
}

struct HeaderView: View {
    @State private var vStackHeight: CGFloat = 0 // State to hold the height
    var rescueDog: Dog
    
    init(_ resqueDog: Dog) {
        self.rescueDog = resqueDog
    }
    
    var body: some View {
        HStack {
            Image("pretzel")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: vStackHeight)
                .padding(.trailing)
            
                VStack(alignment: .leading) {
                    Text(rescueDog.name)
                        .font(.headline)
                    Text(rescueDog.breed)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .background(GeometryReader { geometry in
                    Color.clear // Invisible background to capture the size
                        .onAppear {
                            vStackHeight = geometry.size.height // Capture the height
                        }
                })
            
            Spacer() // Ensures the content is aligned to the left
        }
        .padding() // Apply padding first
        .background(Color(UIColor.secondarySystemBackground)) // Then apply background color
        .cornerRadius(25) // Finally, apply corner radius
    }
}

#Preview {
    DogProfileView()
}
