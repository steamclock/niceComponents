//
//  SectionTitle.swift
//  NiceComponents
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

/// A section title should be used to break up content, usually in-line.
public struct SectionTitle: NiceText {
    public var text: AttributedString
    public let style: NiceTextStyle

    public static var defaultStyle: NiceTextStyle {
        Config.current.sectionTitleStyle
    }

    /**
     * Create a new section title.
     * Section titles should be used to break up content, roughly equivalent to <h2>.
     *
     * - Parameters:
     *  - text: The text to display.
     *  - style: Any customizations to the style that should be applied. By default your config's `sectionTitleStyle` is used.
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

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle("Section Title")
    }
}
