//
//  File.swift
//  
//
//  Created by Brendan Lensink on 2024-01-30.
//

import SwiftUI

public struct ButtonColorStyle {
    let surface: Color
    let onSurface: Color

    let inactiveSurface: Color?
    let inactiveOnSurface: Color?
    let border: Color? = nil

    init(surface: Color,
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

