//
//  ButtonStyle.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

/// A button style to be applied to a button component
public struct ButtonStyle {
    public var textStyle: TypeTheme.TextStyle
    public var height: CGFloat
    public var surfaceColor: Color
    public var onSurfaceColor: Color
    public var border: BorderStyle

    /**
     Create a new button style to apply to a button component.

     - Parameter textStyle: Text style to apply to any text in the button. Default is your current primary button style.
     - Parameter height: Height of the button. Default is 44.
     - Parameter surfaceColor: Surface color of the button. Default is your current primary button style.
     - Parameter onSurfaceColor: Color of any assets on top of your button. Default is your current primary button style.
     - Parameter border: Border style for the button. Default is your current primary button style.
     */
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
