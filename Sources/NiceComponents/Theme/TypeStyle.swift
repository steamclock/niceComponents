//
//  TypeStyle.swift
//  
//
//  Created by Brendan on 2021-03-05.
//

import SwiftUI

public struct TypeStyle {
    public let color: Color
    public let theme: TypeTheme.Text
    public let lineLimit: Int?

    init(color: Color,
         theme: TypeTheme.Text,
         lineLimit: Int? = nil) {
        self.color = color
        self.theme = theme
        self.lineLimit = lineLimit
    }
}
