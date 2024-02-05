//
//  File.swift
//  
//
//  Created by Brendan Lensink on 2024-02-05.
//

import SwiftUI

public struct NiceButtonColorStyle: ButtonColorTheme {
    public var surface: Color
    public var onSurface: Color
    
    public var inactiveSurface: Color
    public var inactiveOnSurface: Color
    
    public init(
        surface: Color,
        onSurface: Color,
        inactiveSurface: Color? = nil,
        inactiveOnSurface: Color? = nil
    ) {
        self.surface = surface
        self.onSurface = onSurface
        self.inactiveSurface = inactiveSurface ?? surface
        self.inactiveOnSurface = inactiveOnSurface ?? onSurface
    }
}
