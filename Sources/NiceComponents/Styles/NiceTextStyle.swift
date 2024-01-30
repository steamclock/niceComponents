//
//  NiceTextStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//


import SwiftUI

public struct NiceTextStyle {
    let fontTheme: FontTheme
    let textTheme: TextTheme

    public init(fontTheme: FontTheme, textTheme: TextTheme) {
        self.fontTheme = fontTheme
        self.textTheme = textTheme
    }
}

public extension NiceTextStyle {
    /**
     * Modify a text style with the given properties.
     *
     * - Parameters:
     *  - color: The color your text should be.
     *  - size: The font size to change.
     *  - fontStyle: The font style to apply to the text.
     *  - lineLimit: The number of lines to limit the text to.
     *  - lineSpacing: The space between lines of the text.
     */
    func with(
        name: String? = nil,
        weight: Font.Weight? = nil,
        size: CGFloat? = nil,
        tracking: CGFloat? = nil,
        dynamicTypeMaxSize: DynamicTypeSize? = nil,
        color: Color? = nil,
        lineLimit: Int? = nil,
        lineSpacing: CGFloat? = nil
    ) -> NiceTextStyle {
        NiceTextStyle(
            fontTheme: FontTheme(
                name ?? self.fontTheme.name,
                size: size ?? self.fontTheme.size,
                weight: weight ?? self.fontTheme.weight,
                tracking: tracking ?? self.fontTheme.tracking,
                dynamicTypeMaxSize: dynamicTypeMaxSize ?? self.fontTheme.dynamicTypeMaxSize
            ),
            textTheme: TextTheme(
                color: color ?? self.textTheme.color,
                lineLimit: lineLimit ?? self.textTheme.lineLimit,
                lineSpacing: lineSpacing ?? self.textTheme.lineSpacing
            )
        )
    }
}
