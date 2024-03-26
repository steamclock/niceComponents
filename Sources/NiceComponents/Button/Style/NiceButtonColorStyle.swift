//
//  NiceButtonColorStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import NiceInit
import SwiftUI

/// Defines the color style for a `NiceButton`, including states for active and inactive.
@NiceInit public struct NiceButtonColorStyle {
    /// The button's background color in its active state.
    public var surface: Color

    /// The button's text or icon color in its active state.
    public var onSurface: Color

    /// The button's background color in its inactive state.
    @NiceDefault("surface") public var inactiveSurface: Color

    /// The button's text or icon color in its inactive state.
    @NiceDefault("onSurface") public var inactiveOnSurface: Color
}
