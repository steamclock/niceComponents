//
//  NiceText.swift
//  NiceComponents
//
//  Created by Alejandro Zielinsky on 2022-06-09.
//

import SwiftUI

/// Defines a struct for text views presented and managed by NiceComponents
public protocol NiceText: View {
    /// The text to display in the View
    var text: AttributedString { get }

    /// The styling to apply to the text.
    var style: NiceTextStyle { get }

    static var defaultStyle: NiceTextStyle { get }

    init(_ attributedText: AttributedString, style: NiceTextStyle?)

    init(_ text: String, style: NiceTextStyle?)

    init(_ text: String, color: Color?, size: CGFloat?, lineLimit: Int?, dynamicMaxSize: DynamicTypeSize?)

    init(_ text: String, color: Color?, size: CGFloat?, lineLimit: Int?, dynamicMaxSize: DynamicTypeSize?, configure: (inout AttributedString) -> Void)
}

public extension NiceText {

    /**
     * Create a new text view by passing in custom styling.
     *
     * - Parameters:
     *  - text: The text to display.
     *  - color: The color to style the text.
     *  - size: The size to make the text.
     *  - lineLimit: If provided, the number of lines to limit text to.
     *  - dynamicMaxSize: The maximum dynamic type size the text should scale to.
     */
    init(
        _ text: String,
        color: Color? = nil,
        size: CGFloat? = nil,
        lineLimit: Int? = nil,
        dynamicMaxSize: DynamicTypeSize? = nil
    ) {
        self.init(
            text,
            style: Self.defaultStyle.with(
                color: color,
                fontStyle: Self.defaultStyle.fontStyle.with(size: size, dynamicTypeMaxSize: dynamicMaxSize),
                lineLimit: lineLimit
            )
        )
    }

    /**
     * Create a new text view by passing in custom styling.
     *
     * - Parameters:
     *  - text: The text to display.
     *  - style: The style to apply to the text.
     */
    init(_ text: String, style: NiceTextStyle?) {
        self.init(AttributedString(text), style: style)
    }

    /**
     * Create a new text view by passing in custom styling and allowing for mutating attributed string elements.
     *
     * - Parameters:
     *  - text: The text to display.
     *  - color: The color to style the text.
     *  - size: The size to make the text.
     *  - lineLimit: If provided, the number of lines to limit text to.
     *  - dynamicMaxSize: The maximum dynamic type size the text should scale to.
     *  - configure: Configuration block for the attributed text.
     */
    init(
        _ text: String,
        color: Color? = nil,
        size: CGFloat? = nil,
        lineLimit: Int? = nil,
        dynamicMaxSize: DynamicTypeSize? = nil,
        configure: (inout AttributedString) -> Void
    ) {
        var attributedString = AttributedString(text)
        configure(&attributedString)
        self.init(attributedString, style: Self.defaultStyle.with(
            color: color,
            fontStyle: Self.defaultStyle.fontStyle.with(size: size, dynamicTypeMaxSize: dynamicMaxSize),
            lineLimit: lineLimit
        )
)
    }
}

