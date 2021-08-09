//
//  TypeStyle.swift
//  
//
//  Created by Brendan on 2021-03-05.
//

import SwiftUI

public struct TypeStyle {
    public var color: Color
    public var theme: TypeTheme.TextStyle
    public var lineLimit: Int?

    public init(color: Color,
            theme: TypeTheme.TextStyle,
            lineLimit: Int? = nil) {
        self.color = color
        self.theme = theme
        self.lineLimit = lineLimit
    }
}
