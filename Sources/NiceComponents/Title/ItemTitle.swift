//
//  ItemTitle.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//  Copyright © 2022 Steamclock Software. All rights reserved.
//

import SwiftUI

/// A smaller title style meant to emphasize elements on a page or further divide sections.
public struct ItemTitle: NiceText {

    public let text: AttributedString
    public let style: NiceTextStyle

    static public var defaultStyle: NiceTextStyle {
        Config.current.itemTitleStyle
    }

    /**
     * Create a new title title.
     * Item titles should be used to further break up content within sections, roughly equivalent to <h3>.
     *
     * - Parameters:
     *  - text: The text to display.
     *  - style: Any customizations to the style that should be applied. By default your config's `itemTitleStyle` is used.
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

struct ItemTitle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: NiceSpacing.large) {
            ItemTitle("Item Title")
            ItemTitle("Item Title", color: .red)
            ItemTitle("Item Title", size: 64)
            ItemTitle("Veeeeeeeeeeeery Loooooong Item Title", lineLimit: 1).padding()
        }
    }
}
