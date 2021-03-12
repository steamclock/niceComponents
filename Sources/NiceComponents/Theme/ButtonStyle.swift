//
//  ButtonStyle.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct ButtonStyle {
    public var textStyle: TypeTheme.Text
    public var height: CGFloat
    public var surfaceColor: Color
    public var onSurfaceColor: Color
    public var borderColor: Color
    public var borderRadius: CGFloat
    public var borderWidth: CGFloat

    public init(
        textStyle: TypeTheme.Text,
        height: CGFloat = 44,
        surfaceColor: Color,
        onSurfaceColor: Color,
        borderColor: Color? = nil,
        borderRadius: CGFloat = 4,
        borderWidth: CGFloat = 0
    ) {
        self.textStyle = textStyle
        self.height = height
        self.surfaceColor = surfaceColor
        self.onSurfaceColor = onSurfaceColor

        self.borderColor = borderColor ?? surfaceColor
        self.borderRadius = borderRadius
        self.borderWidth = borderWidth
    }
}
