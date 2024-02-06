//
//  NiceText.swift
//  NiceComponents
//
//  Created by Brendan on 2024-01-29.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

public struct NiceText: View {
    let style: NiceTextStyle
    let text: AttributedString

    public init( _ text: AttributedString, style: NiceTextStyle) {
        self.style = style
        self.text = text
    }

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
    init(_ text: String, style: NiceTextStyle) {
        self.init(AttributedString(text), style: style)
    }

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
