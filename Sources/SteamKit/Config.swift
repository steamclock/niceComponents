//
//  Config.swift
//  
//
//  Created by Brendan on 2021-01-13.
//

import SwiftUI

public struct TextStyle {
    public var color: Color
    public var font: Font
    public var size: CGFloat

    public init(color: Color, font: Font, size: CGFloat) {
        self.color = color
        self.font = font
        self.size = size
    }
}

public struct Config {
    public static var current = Config()

    public var textFont: Font
    public var titleFont: Font

    public var bodyText: TextStyle
    public var itemTitle: TextStyle

    public init(textFont: Font = Font.body, titleFont: Font = Font.title) {
        self.textFont = textFont
        self.titleFont = titleFont

        bodyText = TextStyle(color: Color.gray, font: textFont, size: 16)
        itemTitle = TextStyle(color: Color.black, font: titleFont, size: 20)
    }
}
