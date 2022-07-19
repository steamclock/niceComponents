//
//  ButtonStyle.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

/// A button style to be applied to a button component
public struct NiceButtonStyle {
    public var textStyle: TypeTheme.TextStyle
    public var height: CGFloat
    public var surfaceColor: Color
    public var onSurfaceColor: Color
    public var disabledSurfaceColor: Color
    public var disabledOnSurfaceColor: Color
    public var cornerRadius: CGFloat
    private var borderStyle: NiceBorderStyle
    public var borderColor: Color
    public var borderWidth: CGFloat
    public var strokeStyle: StrokeStyle?

    /**
     Create a new button style to apply to a button component.

     - Parameter textStyle: Text style to apply to any text in the button. Default is systemFont size 16
     - Parameter height: Height of the button. Default is 44.
     - Parameter surfaceColor: Surface color of the button.
     - Parameter onSurfaceColor: Color of any assets on top of your button.
     - Parameter disabledSurfaceColor: Surface color when disabled.  Default is your background color
     - Parameter disabledOnSurfaceColor: Color of any assets on top of your button when disabled. Default is your secondary color
     - Parameter border: Border style for the button. Default is none
     */
    public init(
        textStyle: TypeTheme.TextStyle? = nil,
        height: CGFloat = 44,
        surfaceColor: Color,
        onSurfaceColor: Color,
        disabledSurfaceColor: Color? = nil,
        disabledOnSurfaceColor: Color? = nil,
        border: NiceBorderStyle? = nil
    ) {
        self.textStyle = textStyle ?? .init(size: 16)
        self.height = height
        self.surfaceColor = surfaceColor
        self.onSurfaceColor = onSurfaceColor
        self.disabledSurfaceColor = disabledSurfaceColor ?? Color("background", bundle: Bundle.module)
        self.disabledOnSurfaceColor = disabledOnSurfaceColor ?? Color("secondary", bundle: Bundle.module)
        self.borderStyle = border ?? .none

        switch border {
        case .capsule(let borderWidth, let borderColor):
            self.borderColor = borderColor ?? .clear
            self.borderWidth = borderWidth ?? 0.0
            self.cornerRadius = height / 2
            self.strokeStyle = nil
        case .rounded(let radius, let borderWidth, let borderColor):
            self.borderWidth = borderWidth ?? 0.0
            self.borderColor = borderColor ?? .clear
            self.cornerRadius = radius
            self.strokeStyle = nil
        case .border(let borderWidth, let borderColor):
            self.borderWidth = borderWidth
            self.borderColor = borderColor
            self.cornerRadius = 0.0
            self.strokeStyle = nil
        case .stroke(let strokeStyle):
            self.cornerRadius = 0.0
            self.borderColor = .clear
            self.borderWidth = 0.0
            self.strokeStyle = strokeStyle
        default:
            self.cornerRadius = 0.0
            self.borderColor = .clear
            self.borderWidth = 0.0
            self.strokeStyle = nil
        }
    }
}

public extension NiceButtonStyle {
    func with(
        textStyle: TypeTheme.TextStyle? = nil,
        height: CGFloat? = nil,
        surfaceColor: Color? = nil,
        onSurfaceColor: Color? = nil,
        disabledSurfaceColor: Color? = nil,
        disabledOnSurfaceColor: Color? = nil,
        border: NiceBorderStyle? = nil
    ) -> NiceButtonStyle {
        NiceButtonStyle(
            textStyle: textStyle ?? self.textStyle,
            height: height ?? self.height,
            surfaceColor: surfaceColor ?? self.surfaceColor,
            onSurfaceColor: onSurfaceColor ?? self.onSurfaceColor,
            disabledSurfaceColor: disabledSurfaceColor ?? self.disabledSurfaceColor,
            disabledOnSurfaceColor: disabledOnSurfaceColor ?? self.disabledOnSurfaceColor,
            border: border ?? self.borderStyle
        )
    }
}
