//
//  TextTheme.swift
//  NiceComponents
//
//  Created by Brendan on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Styling settings for a text element.
public struct TextTheme {
    /// The color your text should be.
    public var color: Color

    /// The number of lines to limit the text to.
    public var lineLimit: Int?

    /// The space between lines of the text.
    public var lineSpacing: CGFloat

    /**
     * Create a new text style to apply to a text element.
     *
     * - Parameters:
     *  - color: The color your text should be.
     *  - lineLimit: The number of lines to limit the text to.
     *  - lineSpacing: TODO
     */
    public init(
        color: Color,
        lineLimit: Int? = nil,
        lineSpacing: CGFloat = 0
    ) {
        self.color = color
        self.lineLimit = lineLimit
        self.lineSpacing = lineSpacing
    }
}
