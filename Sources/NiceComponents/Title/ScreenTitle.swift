//
//  ScreenTitle.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// Text styled to represent a main heading or top of page title.
public struct ScreenTitle: NiceText {
    public let text: AttributedString
    public let style: NiceTextStyle

    public static var defaultStyle: NiceTextStyle {
        Config.current.screenTitleStyle
    }

    /**
     * Create a new screen title
     * A screen title should be used to represent a main heading, roughly equivalent to <h1>.
     *
     * - Parameters:
     *  - text: The text to display.
     *  - style: Any customizations to the style that should be applied. By default your config's `screenTitleStyle` is used.
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

struct ScreenTitle_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTitle("Screen Title")
    }
}

