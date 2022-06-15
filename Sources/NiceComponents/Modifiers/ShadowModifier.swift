//
//  ShadowModifier.swift
//  
//
//  Created by Alejandro Zielinsky on 2022-06-09.
//

import SwiftUI

public struct ShadowStyle {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat
}

struct ShadowModifier: ViewModifier {

    let style: ShadowStyle

    func body(content: Content) -> some View {
        content
            .shadow(color: style.color, radius: style.radius, x: style.x, y: style.y)
    }
}

public extension View {
    func shadow(_ style: ShadowStyle = Config.current.shadowStyle) -> some View {
        modifier(ShadowModifier(style: style))
    }
}
