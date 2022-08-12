//
//  BodyText.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct BodyText: NiceText {
    public let text: AttributedString
    public let style: TypeStyle

    public static var defaultStyle: TypeStyle {
        Config.current.bodyTextStyle
    }

    public init(_ text: AttributedString, style: TypeStyle? = nil) {
        self.text = text
        self.style = style ?? Self.defaultStyle
    }

    public var body: some View {
        Text(text)
            .foregroundColor(style.color)
            .scaledFont(
                name: style.theme.name,
                size: style.theme.size,
                weight: style.theme.weight,
                maxSize: style.theme.dynamicTypeMaxSize
            )
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(style.lineLimit)
    }
}
