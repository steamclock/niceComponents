//
//  BodyText.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// A text view that should be used in most places as the primary body text in a view.
public struct BodyText: NiceText {
    public let text: AttributedString
    public let style: NiceTextStyle

    public static var defaultStyle: NiceTextStyle {
        Config.current.bodyTextStyle
    }

    /**
     * Create a new body text view.
     *
     * - Parameters:
     *  - text: The text to display.
     *  - style: The NiceTextStyle that should be applied to the text.
     */
    public init(_ text: AttributedString, style: NiceTextStyle? = nil) {
        self.text = text
        self.style = style ?? Self.defaultStyle
    }

    public var body: some View {
        Text(text)
            .foregroundColor(style.color)
            .scaledFont(
                name: style.fontStyle.name,
                size: style.fontStyle.size,
                weight: style.fontStyle.weight,
                maxSize: style.fontStyle.dynamicTypeMaxSize
            )
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(style.lineLimit)
    }
}
