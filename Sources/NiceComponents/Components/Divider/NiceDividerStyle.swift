//
//  NiceDividerStyle.swift
//  NiceComponents
//
//  Created by Brendan Lensink on 2024-01-30.
//  Copyright © 2024 Steamclock Software. All rights reserved.
//

import NiceInit
import SwiftUI

/// Defines the style for a divider, including its color, height, and opacity.
@NiceInit public struct NiceDividerStyle {
    /// The color of the divider.
    public var color: Color = Config.current.colorStyle.divider

    /// The thickness (height) of the divider.
    public var height: CGFloat = 1

    /// The opacity of the divider, determining its transparency.
    public var opacity: CGFloat = 0.6
}
