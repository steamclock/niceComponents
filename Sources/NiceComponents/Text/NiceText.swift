//
//  NiceText.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import SwiftUI

/// A SwiftUI view for displaying styled text.
public struct NiceText: View {
    /// The text style to apply.
    let style: NiceTextStyle

    /// The attributed string to display.
    let text: AttributedString

    /// Initializes a new `NiceText` view with the specified attributed text and style.
    /// - Parameters:
    ///   - text: The attributed string to display.
    ///   - style: The style to apply to the text.
    public init( _ text: AttributedString, style: NiceTextStyle) {
        self.style = style
        self.text = text
    }

    /// The body of the `NiceText` view, configuring the text appearance based on the provided style.
    public var body: some View {
        Text(text)
            .foregroundStyle(style.color)
            .scaledFont(
                name: style.font,
                size: style.size,
                weight: style.weight,
                maxSize: style.dynamicTypeMaxSize
            )
            .fixedSize(horizontal: false, vertical: true)
    }
}

public extension NiceText {
    /// Initializes a new `NiceText` view with a plain string and style.
    /// - Parameters:
    ///   - text: The string to display.
    ///   - style: The style to apply to the text.
    init(_ text: String, style: NiceTextStyle) {
        self.init(AttributedString(text), style: style)
    }

    /// Initializes a new `NiceText` view with a plain string, style, and custom configuration for the attributed string.
    /// - Parameters:
    ///   - text: The string to display.
    ///   - style: The style to apply to the text.
    ///   - configure: A closure to customize the attributed string before displaying.
    init(
        _ text: String,
        style: NiceTextStyle,
        configure: (inout AttributedString) -> Void
    ) {
        var attributedString = AttributedString(text)
        configure(&attributedString)
        self.init(attributedString, style: style)
    }
}
