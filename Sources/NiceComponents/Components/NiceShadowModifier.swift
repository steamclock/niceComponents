//
//  NiceShadowModifier.swift
//  NiceComponents
//
//  Created by Alejandro Zielinsky on 2022-06-09.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

public struct NiceShadowStyle {
    /// The color of the shadow. Defaults to black.
    let color: Color

    /// The blur radius of the shadow. Defaults to 4.
    let radius: CGFloat

    /// The horizontal offset of the shadow. Defaults to 0.
    let x: CGFloat

    /// The vertical offset of the shadow. Defaults to 4.
    let y: CGFloat

    /// Initializes a new shadow style with customizable parameters.
    /// - Parameters:
    ///   - color: The color of the shadow. Defaults to `.black`.
    ///   - radius: The blur radius of the shadow. Defaults to `4`.
    ///   - x: The horizontal offset of the shadow. Defaults to `0`.
    ///   - y: The vertical offset of the shadow. Defaults to `4`.
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

/// Attach a drop shadow to the given View.
struct NiceShadowModifier: ViewModifier {
    let style: NiceShadowStyle

    func body(content: Content) -> some View {
        content
            .shadow(color: style.color, radius: style.radius, x: style.x, y: style.y)
    }
}

public extension View {
    /// Attach a drop shadow to the provided View.
    /// - Parameter style: The style to use for the drop shadow. Defaults to your config's `shadowStyle`.
    func shadow(_ style: NiceShadowStyle = Config.current.shadowStyle) -> some View {
        modifier(NiceShadowModifier(style: style))
    }
}