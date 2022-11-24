//
//  NiceShadowModifier.swift
//  NiceComponents
//
//  Created by Alejandro Zielinsky on 2022-06-09.
//

import SwiftUI

/// Styling settings for drop shadows.
public struct NiceShadowStyle {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat
}

/// Attach a drop shadow to the given View.
struct NiceShadowModifier: ViewModifier {
    let style: NiceShadowStyle

    func body(content: Content) -> some View {
        content
            .shadow(color: style.color, radius: style.radius, x: style.x, y: style.y)
    }
}

public extension View {
    /**
     * Attach a drop shadow to the provided View.
     *
     * - Parameter style: The style to use for the drop shadow. Defaults to your config's `shadowStyle`.
     */
    func shadow(_ style: NiceShadowStyle = Config.current.shadowStyle) -> some View {
        modifier(NiceShadowModifier(style: style))
    }
}
