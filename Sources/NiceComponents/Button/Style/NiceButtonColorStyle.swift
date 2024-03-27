//
//  NiceButtonColorStyle.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
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
