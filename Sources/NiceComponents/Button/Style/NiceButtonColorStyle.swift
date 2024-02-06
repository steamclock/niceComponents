//
//  NiceButtonColorStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import SwiftUI

public struct NiceButtonColorStyle {
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
