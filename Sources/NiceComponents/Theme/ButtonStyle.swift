//
//  ButtonStyle.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct ButtonStyle {
    public var textStyle: TypeTheme.TextStyle
    public var height: CGFloat
    public var surfaceColor: Color
    public var onSurfaceColor: Color
    public var border: BorderStyle

    public init(
        textStyle: TypeTheme.TextStyle,
        height: CGFloat = 44,
        surfaceColor: Color,
        onSurfaceColor: Color,
        border: BorderStyle? = nil
    ) {
        self.textStyle = textStyle
        self.height = height
        self.surfaceColor = surfaceColor
        self.onSurfaceColor = onSurfaceColor

        self.border = border ?? BorderStyle()
    }
}
