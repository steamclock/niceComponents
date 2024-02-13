//
//  NiceButtonStyle.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import NiceInit
import SwiftUI

/// A customizable style for a Nice button.
@NiceInit public struct NiceButtonStyle {
    /// The text style to be applied to the button's label.
    public var textStyle: NiceTextStyle

    /// The fixed height of the button. Default is 44.
    public var height: CGFloat = 44

    /// The color style defining the button's background and foreground colors.
    public var colorStyle: NiceButtonColorStyle

    /// The border style applied to the button, including width, color, and corner radius. Default is none.
    public var border: NiceBorderStyle = .none

    public func with(
        textStyle: NiceTextStyle? = nil,
        height: CGFloat? = nil,
        colorStyle: NiceButtonColorStyle? = nil,
        border: NiceBorderStyle? = nil,
        surface: Color? = nil,
        onSurface: Color? = nil,
        inactiveSurface: Color? = nil,
        inactiveOnSurface: Color? = nil,
        font: String? = nil,
        size: CGFloat? = nil,
        weight: Font.Weight? = nil,
        tracking: CGFloat? = nil,
        dynamicTypeMaxSize: DynamicTypeSize? = nil,
        lineLimit: Int? = nil,
        lineSpacing: CGFloat? = nil
    ) -> NiceButtonStyle {
        let textStyle = textStyle ?? self.textStyle
        let colorStyle = colorStyle ?? self.colorStyle

        return NiceButtonStyle(
            textStyle: NiceTextStyle(
                color: onSurface ?? colorStyle.onSurface,
                font: font ?? textStyle.font,
                size: size ?? textStyle.size,
                weight: weight ?? textStyle.weight,
                tracking: tracking ?? textStyle.tracking,
                dynamicTypeMaxSize: dynamicTypeMaxSize ?? textStyle.dynamicTypeMaxSize,
                lineLimit: lineLimit ?? textStyle.lineLimit,
                lineSpacing: lineSpacing ?? textStyle.lineSpacing
            ),
            height: height ?? self.height,
            colorStyle: NiceButtonColorStyle(
                surface: surface ?? colorStyle.surface,
                onSurface: onSurface ?? colorStyle.onSurface,
                inactiveSurface: inactiveSurface ?? colorStyle.inactiveSurface,
                inactiveOnSurface: inactiveOnSurface ?? colorStyle.inactiveOnSurface
            ),
            border: border ?? self.border)
    }

}

internal extension NiceButtonStyle {
    /// Calculates the additional padding needed based on the button's border width.
    var paddingToAdd: CGFloat {
        if let strokeWidth = border.strokeStyle?.lineWidth, strokeWidth > 0.0 {
            return strokeWidth / 2
        } else if border.width > 0.0 {
            return border.width / 2
        }
        return 0.0
    }

    /// Provides a view modifier for creating the button's border overlay.
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

    /// Calculates the corner radius for the button's border, supporting `.capsule` style.
    var cornerRadius: CGFloat {
        if case .capsule = border {
            return height / 2
        }

        return border.cornerRadius
    }
}
