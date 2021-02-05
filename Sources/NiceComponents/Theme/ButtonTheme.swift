//
//  ButtonTheme.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct ButtonTheme {
    public var borderColor: Color
    public var borderRadius: CGFloat
    public var borderWidth: CGFloat
    public var color: Color
    public var height: CGFloat
    public var textTheme: TextTheme

    public init(
            color: Color,
            height: CGFloat,
            textTheme: TextTheme,
            borderColor: Color? = nil,
            borderRadius: CGFloat = 4,
            borderWidth: CGFloat = 0) {
        self.color = color
        self.height = height
        self.textTheme = textTheme

        self.borderColor = borderColor ?? color
        self.borderRadius = borderRadius
        self.borderWidth = borderWidth
    }
}
