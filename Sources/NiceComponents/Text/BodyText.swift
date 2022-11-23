//
//  BodyText.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct BodyText: NiceText {
    public let text: AttributedString
    public let style: NiceTextStyle

    public static var defaultStyle: NiceTextStyle {
        Config.current.bodyTextStyle
    }

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
