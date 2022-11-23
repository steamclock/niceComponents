//
//  ButtonStyle.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

/// A button style to be applied to a button component
public struct NiceButtonStyle {
    /// The text style will be applied to the text inside the button.
    public var fontStyle: FontStyle

    /// The height of the button.
    public var height: CGFloat

    /// The background color of the button.
    public var surfaceColor: Color

    /// The color the content on top of the background.
    public var onSurfaceColor: Color

    /// Background color when set to inactive.
    public var inactiveSurfaceColor: Color

    /// Content color when set to inactive
    public var inactiveOnSurfaceColor: Color

    /// The style of the border applied to your button
    public var borderStyle: NiceBorderStyle

    /**
     * Create a new button style to apply to a button component.
     *
     * - Parameters:
     *  - fontStyle: Font style to apply to any text in the button. Default is systemFont size 16
     *  - height: Height of the button. Default is 44.
     *  - surfaceColor: Surface color of the button.
     *  - onSurfaceColor: Color of any assets on top of your button.
     *  - inactiveSurfaceColor: Surface color when set to inactive.  Default is your background color.
     *  - inactiveOnSurfaceColor: Color of any assets on top of your button when inactive. Default is your secondary color.
     *  - border: Border style for the button. Default is none.
     *
     * - Returns: the newly modified button style.
     */
    public init(
        fontStyle: FontStyle? = nil,
        height: CGFloat = 44,
        surfaceColor: Color,
        onSurfaceColor: Color,
        inactiveSurfaceColor: Color? = nil,
        inactiveOnSurfaceColor: Color? = nil,
        border: NiceBorderStyle? = nil
    ) {
        self.fontStyle = fontStyle ?? .init(size: 16)
        self.height = height
        self.surfaceColor = surfaceColor
        self.onSurfaceColor = onSurfaceColor
        self.inactiveSurfaceColor = inactiveSurfaceColor ?? surfaceColor
        self.inactiveOnSurfaceColor = inactiveOnSurfaceColor ?? onSurfaceColor
        self.borderStyle = border ?? .none
    }
}

public extension NiceButtonStyle {
    /**
     * Modify a button style with the given properties.
     *
     * - Parameters:
     *  - fontStyle: Font style to apply to any text in the button. Default is systemFont size 16
     *  - height: Height of the button. Default is 44.
     *  - surfaceColor: Surface color of the button.
     *  - onSurfaceColor: Color of any assets on top of your button.
     *  - inactiveSurfaceColor: Surface color when set to inactive.  Default is your background color.
     *  - inactiveOnSurfaceColor: Color of any assets on top of your button when inactive. Default is your secondary color.
     *  - border: Border style for the button. Default is none.
     *
     * - Returns: the newly modified button style.
     */
    func with(
        fontStyle: FontStyle? = nil,
        height: CGFloat? = nil,
        surfaceColor: Color? = nil,
        onSurfaceColor: Color? = nil,
        inactiveSurfaceColor: Color? = nil,
        inactiveOnSurfaceColor: Color? = nil,
        border: NiceBorderStyle? = nil
    ) -> NiceButtonStyle {
        NiceButtonStyle(
            fontStyle: fontStyle ?? self.fontStyle,
            height: height ?? self.height,
            surfaceColor: surfaceColor ?? self.surfaceColor,
            onSurfaceColor: onSurfaceColor ?? self.onSurfaceColor,
            inactiveSurfaceColor: inactiveSurfaceColor ?? self.inactiveSurfaceColor,
            inactiveOnSurfaceColor: inactiveOnSurfaceColor ?? self.inactiveOnSurfaceColor,
            border: border ?? self.borderStyle
        )
    }
}
