//
//  Config.swift
//  
//
//  Created by Brendan on 2021-01-13.
//

import SwiftUI

public struct FontStyle {
    public let color: Color
    public let size: CGFloat

    public init(color: Color, size: CGFloat) {
        self.color = color
        self.size = size
    }
}

public struct Config {
    public static var current = Config()

    public var textFont = Font.system(.body)
    public var titleFont = Font.bold

    public var bodyText = FontStyle(color: Color.gray, size: 16)
    public var itemTitle = FontStyle(color: Color.black, size: 20)

    public init() {

    }
}
