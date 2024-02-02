//
//  NiceButtonStyle.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI
import NiceInit

/// A style to be applied to a button component.
@NiceInit public struct NiceButtonStyle {
    /// The text style will be applied to the text inside the button.
    public var fontStyle: FontStyle = FontStyle(size: 16)

    /// The height of the button.
    public var height: CGFloat = 44

    /// The background color of the button.
    public var surfaceColor: Color

    /// The color the content on top of the background.
    public var onSurfaceColor: Color

    /// Background color when set to inactive.
    public var inactiveSurfaceColor: Color

    /// Content color when set to inactive.
    public var inactiveOnSurfaceColor: Color

    /// The style of the border applied to your button.
    public var border: NiceBorderStyle = .none

    /**
     * Create a new button style to apply to a button component.
     *
     * - Parameters:
     *  - fontStyle: Font style to apply to any text in the button. Default is systemFont size 16
     *  - height: Height of the button. Default is 44.
     *  - surfaceColor: Surface color of the button.
     *  - onSurfaceColor: Color of any assets on top of your button.
     *  - inactiveSurfaceColor: Surface color when set to inactive.  Default is your surface color.
     *  - inactiveOnSurfaceColor: Color of any assets on top of your button when inactive. Default is your onSurface color.
     *  - border: Border style for the button. Default is none.
     *
     * - Returns: the newly modified button style.
     */
    /*
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
        self.border = border ?? .none
    }
    */

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
            border: border ?? self.border
        )
    }
}

internal extension NiceButtonStyle {
    var paddingToAdd: CGFloat {
        if let strokeWidth = border.strokeStyle?.lineWidth, strokeWidth > 0.0 {
            return strokeWidth / 2
        } else if border.width > 0.0 {
            return border.width / 2
        }
        return 0.0
    }

    @ViewBuilder
    var borderOverlay: some View {
        if let strokeStyle = border.strokeStyle {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(style: strokeStyle)
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border.color, lineWidth: border.width)
        }
    }

    var cornerRadius: CGFloat {
        if case .capsule = border {
            return height / 2
        }

        return border.cornerRadius
    }
}
