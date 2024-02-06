//
//  NiceButtonStyle.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

public struct NiceButtonStyle {
    public var textStyle: NiceTextStyle
    public var height: CGFloat
    public var colorStyle: NiceButtonColorStyle
    public var border: NiceBorderStyle // TODO: add theme?

    public init(
        textStyle: NiceTextStyle? = nil,
        height: CGFloat? = nil,
        colorStyle: NiceButtonColorStyle? = nil,
        border: NiceBorderStyle? = nil
    ) {
        self.textStyle = textStyle ?? Config.current.primaryButtonStyle.textStyle
        self.height = height ?? 44
        self.colorStyle = colorStyle ?? Config.current.primaryButtonStyle.colorStyle
        self.border = border ?? .none
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
