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
        textStyle: TypeTheme.TextStyle? = nil,
        height: CGFloat = 44,
        surfaceColor: Color? = nil,
        onSurfaceColor: Color? = nil,
        border: BorderStyle? = nil
    ) {
        self.textStyle = textStyle ?? Config.current.primaryButtonStyle.textStyle
        self.height = height
        self.surfaceColor = surfaceColor ?? Config.current.primaryButtonStyle.surfaceColor
        self.onSurfaceColor = onSurfaceColor ?? Config.current.primaryButtonStyle.onSurfaceColor

        self.border = border ?? BorderStyle()
    }
}
