//
//  NiceShadowModifier.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import NiceInit
import SwiftUI

@NiceInit public struct NiceShadowStyle {
    /// The color of the shadow. Defaults to black.
    public var color: Color?

    /// The blur radius of the shadow. Defaults to 4.
    public var radius: CGFloat = 4

    /// The horizontal offset of the shadow. Defaults to 0.
    public var x: CGFloat = 0

    /// The vertical offset of the shadow. Defaults to 4.
    public var y: CGFloat = 4
}

/// Attach a drop shadow to the given View.
public struct NiceShadowModifier: ViewModifier {
    let style: NiceShadowStyle

    public func body(content: Content) -> some View {
        content
            .shadow(
                color: style.color ?? Config.current.colorStyle.shadow,
                radius: style.radius,
                x: style.x,
                y: style.y
            )
    }
}

public extension View {
    /// Attach a drop shadow to the provided View.
    /// - Parameter style: The style to use for the drop shadow. Defaults to your config's `shadowStyle`.
    func shadow(_ style: NiceShadowStyle = Config.current.shadowStyle) -> some View {
        modifier(NiceShadowModifier(style: style))
    }
}
