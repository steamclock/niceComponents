//
//  NiceDividerStyle.swift
//  NiceComponents: [https://github.com/steamclock/NiceComponents](https://github.com/steamclock/NiceComponents)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: [https://github.com/steamclock/NiceComponents/blob/main/LICENSE](https://github.com/steamclock/NiceComponents/blob/main/LICENSE)
//

import NiceInit
import SwiftUI

/// Defines the style for a divider, including its color, height, and opacity.
@NiceInit public struct NiceDividerStyle {
    /// The color of the divider.
    public var color: Color?
    
    /// The thickness (height) of the divider.
    public var height: CGFloat = 1

    /// The opacity of the divider, determining its transparency.
    public var opacity: CGFloat = 0.6
}
