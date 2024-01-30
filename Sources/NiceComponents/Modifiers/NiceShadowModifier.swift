//
//  NiceShadowModifier.swift
//  NiceComponents
//
//  Created by Alejandro Zielinsky on 2022-06-09.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Styling settings for drop shadows.
public protocol NiceShadowTheme {
    var color: Color { get }
    var radius: CGFloat { get }
    var x: CGFloat { get }
    var y: CGFloat { get }
}

public struct NiceShadowStyle {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat

    public init(
        color: Color? = nil,
        radius: CGFloat? = nil,
        x: CGFloat? = nil,
        y: CGFloat? = nil
    ) {
        self.color = color ?? .black
        self.radius = radius ?? 4
        self.x = x ?? 0
        self.y = y ?? 4
    }
}

// TODO: Figure out how to do NiceShadowStyle

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
