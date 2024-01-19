//
//  MiniMap.swift
//  DocsExample
//
//  Created by Yaro4ka on 14.01.2024.
//

import SwiftUI

struct MiniMap: View {
    let geometry: GeometryProxy
    let preferences: [MinimapPreferenceData]
    
    var body: some View {
        // Get the form container preference
        guard let formContainerAnchor = preferences.first(where: { $0.viewType == .formContainer })?.bounds else { return AnyView(EmptyView()) }
        
        // Get the minimap area container
        guard let miniMapAreaAnchor = preferences.first(where: { $0.viewType == .miniMapArea })?.bounds else { return AnyView(EmptyView()) }
        
        // Calcualte a multiplier factor to scale the views from the form, into the minimap.
        let factor = geometry[formContainerAnchor].size.width / (geometry[miniMapAreaAnchor].size.width - 10)
        
        // Determine the position of the form
        let containerPosition = CGPoint(x: geometry[formContainerAnchor].minX, y: geometry[formContainerAnchor].minY)
        
        // Determine the position of the mini map area
        let miniMapPosition = CGPoint(x: geometry[miniMapAreaAnchor].minX, y: geometry[miniMapAreaAnchor].minY)
        
        // -------------------------------------------------------------------------------------------------
        // iOS 13 Beta 5 Release Notes. Known Issues:
        // Using a ForEach view with a complex expression in its closure can may result in compiler errors.
        // Workaround: Extract those expressions into their own View types. (53325810)
        // -------------------------------------------------------------------------------------------------
        // The following view had to be encapsulated in two separate functions (miniMapView & rectangleView),
        // because beta 5 has a bug that fails to compile expressions that are "too complex".
        return AnyView(miniMapView(factor, containerPosition, miniMapPosition))
    }
    
    func miniMapView(_ factor: CGFloat, _ containerPosition: CGPoint, _ miniMapPosition: CGPoint) -> some View {
        ZStack(alignment: .topLeading) {
            // Create a small representation of each of the form's views.
            // Preferences are traversed in reverse order, otherwise the branch views
            // would be covered by their ancestors
            ForEach(preferences.reversed()) { pref in
                if pref.show() { // some type of views, we don't want to show
                    self.rectangleView(pref, factor, containerPosition, miniMapPosition)
                }
            }
        }
        .padding(5)
    }
    
    func rectangleView(_ pref: MinimapPreferenceData, _ factor: CGFloat, _ containerPosition: CGPoint, _ miniMapPosition: CGPoint) -> some View {
        Rectangle()
            .fill(pref.getColor())
            .frame(width: self.geometry[pref.bounds].size.width / factor,
                   height: self.geometry[pref.bounds].size.height / factor)
            .offset(x: (self.geometry[pref.bounds].minX - containerPosition.x) / factor + miniMapPosition.x,
                    y: (self.geometry[pref.bounds].minY - containerPosition.y) / factor + miniMapPosition.y)
    }
}
