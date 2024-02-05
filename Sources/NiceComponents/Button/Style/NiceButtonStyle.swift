//
//  NiceButtonStyle.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

public struct NiceButtonStyle: ButtonTheme {   
    public var textStyle: TextTheme
    public var height: CGFloat
    public var colorStyle: ButtonColorTheme
    public var border: BorderStyle // TODO: add theme?

    public init(
        textStyle: TextTheme,
        height: CGFloat? = nil,
        colorStyle: ButtonColorTheme? = nil,
        border: BorderStyle? = nil
    ) {
        self.textStyle = textStyle
        self.height = height ?? 44
        self.colorStyle = colorStyle ?? NiceButtonColorStyle(
            surface: .black,
            onSurface: .black
        ) // TODO: default init doesn't work here - maybe should be its own thing in config
        self.border = border ?? .none
    }
}

internal extension ButtonTheme {
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
