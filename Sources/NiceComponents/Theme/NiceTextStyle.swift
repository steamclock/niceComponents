//
//  NiceTextStyle.swift
//  NiceComponents
//
//  Created by Brendan on 2021-03-05.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Styling settings for a text element.
public struct NiceTextStyle {
    /// The color your text should be.
    public var color: Color

    /// The font style to apply to the text.
    public var fontStyle: FontStyle

    /// The number of lines to limit the text to.
    public var lineLimit: Int?

    /// The space between the characters of the text.
    public var tracking: CGFloat
    
    /// The space between lines of the text.
    public var lineSpacing: CGFloat
    
    /**
     * Create a new text style to apply to a text element.
     *
     * - Parameters:
     *  - color: The color your text should be.
     *  - fontStyle: The font style to apply to the text.
     *  - lineLimit: The number of lines to limit the text to.
     */
    public init(
        color: Color,
        fontStyle: FontStyle,
        lineLimit: Int? = nil,
        lineSpacing: CGFloat = 0,
        tracking: CGFloat = 0
    ) {
        self.color = color
        self.fontStyle = fontStyle
        self.lineLimit = lineLimit
        self.lineSpacing = lineSpacing
        self.tracking = tracking
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
     */
    func with(
        color: Color? = nil,
        size: CGFloat? = nil,
        lineLimit: Int? = nil,
        dynamicTypeMaxSize: DynamicTypeSize? = nil,
        lineSpacing: CGFloat? = nil,
        tracking: CGFloat? = nil
    ) -> NiceTextStyle {
        NiceTextStyle(
            color: color ?? self.color,
            fontStyle: FontStyle(
                self.fontStyle.name,
                size: size ?? self.fontStyle.size,
                weight: self.fontStyle.weight,
                dynamicTypeMaxSize: dynamicTypeMaxSize ?? self.fontStyle.dynamicTypeMaxSize
            ),
            lineLimit: lineLimit ?? self.lineLimit,
            lineSpacing: lineSpacing ?? self.lineSpacing,
            tracking: tracking ?? self.tracking
        )
    }
}
