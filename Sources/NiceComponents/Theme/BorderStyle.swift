//
//  File.swift
//  
//
//  Created by Brendan on 2021-08-09.
//

import SwiftUI

public struct BorderStyle {
    var color: Color
    var radius: CGFloat
    var width: CGFloat

    public init(
        color: Color? = nil,
        radius: CGFloat = 4,
        width: CGFloat = 0
    ) {
        self.color = color ?? Color.primary
        self.radius = radius
        self.width = width
    }
}

