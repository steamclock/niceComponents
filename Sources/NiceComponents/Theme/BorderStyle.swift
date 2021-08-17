//
//  File.swift
//  
//
//  Created by Brendan on 2021-08-09.
//

import SwiftUI

/// Defines the border style for a component
public struct BorderStyle {
    var color: Color
    var radius: CGFloat
    var width: CGFloat

    /**
     Create a new border style to apply to a component.

     - Parameter color: Color to apply to the border. Default is `nil`.
     - Parameter radius: Corner radius of the border. Default is `4`.
     - Parameter width: Stroke width of the border. Default is `0`.
     */
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

