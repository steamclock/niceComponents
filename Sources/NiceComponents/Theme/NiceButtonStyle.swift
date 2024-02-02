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
    @Default("surfaceColor") public var inactiveSurfaceColor: Color

    /// Content color when set to inactive.
    @Default("onSurfaceColor") public var inactiveOnSurfaceColor: Color

    /// The style of the border applied to your button.
    public var border: NiceBorderStyle = .none

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
